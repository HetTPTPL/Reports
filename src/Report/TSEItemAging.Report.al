namespace Task.Task;
using Microsoft.Inventory.Item;
using Microsoft.Utilities;
using Microsoft.Foundation.Company;
using Microsoft.Inventory.Ledger;
report 50180 "TSE Item Aging"
{
    ApplicationArea = All;
    Caption = 'Item Age - Quantity';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Layouts/Layout50180_Item Age - Quantity.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Inventory Posting Group", "Statistics Group", "Location Filter";
            column("No_Item"; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(HeaderText1; HeaderText[1])
            {
            }
            column(HeaderText2; HeaderText[2])
            {
            }
            column(HeaderText3; HeaderText[3])
            {
            }
            column(HeaderText4; HeaderText[4])
            {
            }
            column(CompanyInfo; CompanyInfo.Name)
            {
            }
            column(TableCaptnItemFilter; Item.TableCaption + ': ' + ItemFilter)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(ActualQty1; ActualQty[1])
            {
            }
            column(ActualQty2; ActualQty[2])
            {
            }
            column(ActualQty3; ActualQty[3])
            {
            }
            column(ActualQty4; ActualQty[4])
            {
            }
            column(ActualValue1; ActualValue[1])
            {
            }
            column(ActualValue2; ActualValue[2])
            {
            }
            column(ActualValue3; ActualValue[3])
            {
            }
            column(ActualValue4; ActualValue[4])
            {
            }
            column(ExpectedQty1; ExpectedQty[1])
            {
            }
            column(ExpectedQty2; ExpectedQty[2])
            {
            }
            column(ExpectedQty3; ExpectedQty[3])
            {
            }
            column(ExpectedQty4; ExpectedQty[4])
            {
            }
            column(ExpectedValue1; ExpectedValue[1])
            {
            }
            column(ExpectedValue2; ExpectedValue[2])
            {
            }
            column(ExpectedValue3; ExpectedValue[3])
            {
            }
            column(ExpectedValue4; ExpectedValue[4])
            {
            }
            column(ShowExpectedCost; ShowExpectedCost)
            {
            }
            column(RowTotalActualQty; RowTotalActualQty)
            {
            }
            column(RowTotalActualValue; RowTotalActualValue)
            {
            }
            column(RowTotalExpectedQty; RowTotalExpectedQty)
            {
            }
            column(RowTotalExpectedValue; RowTotalExpectedValue)
            {
            }


            trigger OnPreDataItem()
            begin
                CalcDates();
                CreateHeadings();
            end;

            trigger OnAfterGetRecord()
            var
                ValueEntry_lRec: Record "Value Entry";
                i: Integer;
            begin
                Clear(ActualQty);
                Clear(ActualValue);
                Clear(ExpectedQty);
                Clear(ExpectedValue);

                Clear(RowTotalActualQty);
                Clear(RowTotalActualValue);
                Clear(RowTotalExpectedQty);
                Clear(RowTotalExpectedValue);

                ValueEntry_lRec.Reset();
                ValueEntry_lRec.SetRange("Item No.", "No.");
                ValueEntry_lRec.SetRange("Posting Date", 0D, EndingDate);
                if LocationFilter <> '' then
                    ValueEntry_lRec.SetFilter("Location Code", LocationFilter);

                if ValueEntry_lRec.FindSet() then
                    repeat
                        for i := 1 to 3 do
                            if (ValueEntry_lRec."Posting Date" >= PeriodStartDate[i]) and (ValueEntry_lRec."Posting Date" <= PeriodEndDate[i]) then begin
                                ActualQty[i] += ValueEntry_lRec."Invoiced Quantity";
                                ActualValue[i] += ValueEntry_lRec."Cost Amount (Actual)";
                                ExpectedQty[i] += ValueEntry_lRec."Item Ledger Entry Quantity";
                                ExpectedValue[i] += ValueEntry_lRec."Cost Amount (Expected)" + ValueEntry_lRec."Cost Amount (Actual)";
                            end;


                        if ValueEntry_lRec."Posting Date" <= PeriodEndDate[4] then begin
                            ActualQty[4] += ValueEntry_lRec."Invoiced Quantity";
                            ActualValue[4] += ValueEntry_lRec."Cost Amount (Actual)";
                            ExpectedQty[4] += ValueEntry_lRec."Item Ledger Entry Quantity";
                            ExpectedValue[4] += ValueEntry_lRec."Cost Amount (Expected)" + ValueEntry_lRec."Cost Amount (Actual)";
                        end;
                    until ValueEntry_lRec.Next() = 0;

                for i := 1 to 4 do begin
                    RowTotalActualQty += ActualQty[i];
                    RowTotalActualValue += ActualValue[i];
                    RowTotalExpectedQty += ExpectedQty[i];
                    RowTotalExpectedValue += ExpectedValue[i];
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(EndingDate_Filter; EndingDate)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the EndingDate field.';
                        Caption = 'Ending Date';
                    }
                    field(PeriodLength_Filter; PeriodLength)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the PeriodLength field.';
                        Caption = 'Period Length';
                    }
                    field("Include Expected Cost"; ShowExpectedCost)
                    {
                        ApplicationArea = all;
                        Caption = 'Include Expected Cost';
                        ToolTip = 'Specifies the value of the Include Expected Cost field.';
                    }
                }
            }
        }
    }

    labels
    {
        Report_Lbl = 'Item Age - Quantity';
        Page_Lbl = 'Page ';
        ItemNo_Lbl = 'Item No.';
        Description_Lbl = 'Description';
        Total_Lbl = 'Total';
        Expected_Lbl = 'Expected Cost Included';
        ExpectedTotal_Lbl = 'Expected Cost Included Total';
        Quantity_Lbl = 'Quantity';
        Value_Lbl = 'Value';
        Inventory_Lbl = 'Inventory Sum';
    }

    trigger OnInitReport()
    begin
        EndingDate := WorkDate();
        Evaluate(PeriodLength, '1M');
        CompanyInfo.Get();
    end;

    trigger OnPreReport()
    var
        FormatDocument: Codeunit "Format Document";
    begin
        ItemFilter := FormatDocument.GetRecordFiltersWithCaptions(Item);
        ItemFilter := Item.GetFilters();
        LocationFilter := Item.GetFilter("Location Filter");
    end;

    var
        CompanyInfo: Record "Company Information";
        PeriodLength: DateFormula;
        EndingDate: Date;
        PeriodStartDate: array[4] of Date;
        PeriodEndDate: array[4] of Date;
        HeaderText: array[4] of Text[50];
        ActualQty: array[4] of Decimal;
        ExpectedQty: array[4] of Decimal;
        ActualValue: array[4] of Decimal;
        ExpectedValue: array[4] of Decimal;
        ItemFilter: Text;
        ShowExpectedCost: Boolean;
        LocationFilter: Text;
        RowTotalActualQty: Decimal;
        RowTotalActualValue: Decimal;
        RowTotalExpectedQty: Decimal;
        RowTotalExpectedValue: Decimal;


    local procedure CalcDates()
    var
        i: Integer;
    begin
        PeriodEndDate[1] := EndingDate;
        PeriodStartDate[1] := CalcDate('-' + Format(PeriodLength), PeriodEndDate[1] + 1);

        for i := 2 to 3 do begin
            PeriodEndDate[i] := PeriodStartDate[i - 1] - 1;
            PeriodStartDate[i] := CalcDate('-' + Format(PeriodLength), PeriodEndDate[i] + 1);
        end;

        PeriodEndDate[4] := PeriodStartDate[3] - 1;
        PeriodStartDate[4] := 0D;
    end;

    local procedure CreateHeadings()
    var
        i: Integer;
    begin
        for i := 1 to 3 do
            HeaderText[i] := Format(PeriodStartDate[i]) + '..' + Format(PeriodEndDate[i]);

        HeaderText[4] := '..Before ';
    end;
}
