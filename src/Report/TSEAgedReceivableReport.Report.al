report 50179 "TSE Aged Receivable Report"
{
    ApplicationArea = All;
    Caption = 'TSE Aged Receivable Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(Balance; TotalRemainingBalance)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(Bucket1Label; Bucket1Label)
            {
            }
            column(Bucket2Label; Bucket2Label)
            {
            }
            column(Bucket3Label; Bucket3Label)
            {
            }
            column(Bucket4Label; Bucket4Label)
            {
            }
            column(Bucket1Balance; Bucket1Balance)
            {
            }
            column(Bucket2Balance; Bucket2Balance)
            {
            }
            column(Bucket3Balance; Bucket3Balance)
            {
            }
            column(Bucket4Balance; Bucket4Balance)
            {
            }
            column(AgedAsOfDate; AgedAsOfDate)
            {
            }
            column(AgingBy; AgingBy)
            {
            }


            trigger OnPreDataItem()
            begin
                SetBucketLabels();
                if not TotalaBalance then
                    CurrReport.Break();
            end;

            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
            begin
                Bucket1Balance := 0;
                Bucket2Balance := 0;
                Bucket3Balance := 0;
                Bucket4Balance := 0;
                TotalRemainingBalance := 0;
                CustLedgerEntry.Reset();
                CustLedgerEntry.SetRange("Customer No.", "No.");

                if AgingBy = AgingBy::"Due Date" then
                    CustLedgerEntry.SetRange("Due Date", 0D, AgedAsOfDate)
                else
                    CustLedgerEntry.SetRange("Posting Date", 0D, AgedAsOfDate);

                if CustLedgerEntry.FindSet() then
                    repeat
                        CustLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                        TotalRemainingBalance += CustLedgerEntry."Remaining Amt. (LCY)";

                        if AgingBy = AgingBy::"Due Date" then begin
                            if CustLedgerEntry."Due Date" > Bucket1Start then
                                Bucket1Balance += CustLedgerEntry."Remaining Amt. (LCY)"
                            else
                                if CustLedgerEntry."Due Date" > Bucket2Start then
                                    Bucket2Balance += CustLedgerEntry."Remaining Amt. (LCY)"
                                else
                                    if CustLedgerEntry."Due Date" > Bucket3Start then
                                        Bucket3Balance += CustLedgerEntry."Remaining Amt. (LCY)"
                                    else
                                        Bucket4Balance += CustLedgerEntry."Remaining Amt. (LCY)";
                        end else
                            if CustLedgerEntry."Posting Date" > Bucket1Start then
                                Bucket1Balance += CustLedgerEntry."Remaining Amt. (LCY)"
                            else
                                if CustLedgerEntry."Posting Date" > Bucket2Start then
                                    Bucket2Balance += CustLedgerEntry."Remaining Amt. (LCY)"
                                else
                                    if CustLedgerEntry."Posting Date" > Bucket3Start then
                                        Bucket3Balance += CustLedgerEntry."Remaining Amt. (LCY)"
                                    else
                                        Bucket4Balance += CustLedgerEntry."Remaining Amt. (LCY)";
                    until CustLedgerEntry.Next() = 0;

                if SkipZeroBalanceCustomers then
                    if TotalRemainingBalance = 0 then
                        CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                field(AgedAsOfDate_Filter; AgedAsOfDate)
                {
                    ApplicationArea = All;
                    Caption = 'Aged As Of';
                    ToolTip = 'Aged As Of';
                }
                field(AgingBy_Filter; AgingBy)
                {
                    ApplicationArea = All;
                    Caption = 'Aging By';
                    ToolTip = 'Aging By';
                    OptionCaption = 'Due Date,Posting Date';
                }
                field(PeriodLength_Filter; PeriodLength)
                {
                    ApplicationArea = all;
                    Caption = 'Period Length';
                    ToolTip = 'Period Length';
                }
                field(SkipZeroBalanceCustomers_Filter; SkipZeroBalanceCustomers)
                {
                    ApplicationArea = all;
                    Caption = 'Skip Zero Balance Customers';
                    ToolTip = 'Skip Zero Balance Customers';
                }
                field(TotalaBalance_Filter; TotalaBalance)
                {
                    ApplicationArea = all;
                    Caption = 'Show Total Balance';
                    ToolTip = 'Specifies the value of the Show Total Balance field.';
                }
            }
        }
    }
    rendering
    {
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50179_AgedReceivableReport.rdl';
        }
    }

    labels
    {
        Report_Lbl = 'Aged Accounts Receivable';
        CustNo_Lbl = 'No.';
        CustName_Lbl = 'Name';
        CurrencyCode_Lbl = 'Currency Code';
        Balance_Lbl = 'Balance';
        Total_Lbl = 'Total Balance';
        Agedasof_Lbl = 'Aged as of ';
        AgedBy_Lbl = 'Aged by ';
    }

    trigger OnInitReport()
    begin
        PeriodLength := '1M';
        AgedAsOfDate := WorkDate();
        TotalaBalance := true;
    end;

    var
        AgedAsOfDate: Date;
        AgingBy: Option "Due Date","Posting Date";
        TotalRemainingBalance: Decimal;
        Bucket1Start: Date;
        Bucket2Start: Date;
        Bucket3Start: Date;
        Bucket1Label: Text[50];
        Bucket2Label: Text[50];
        Bucket3Label: Text[50];
        Bucket4Label: Text[50];
        Bucket1Balance: Decimal;
        Bucket2Balance: Decimal;
        Bucket3Balance: Decimal;
        Bucket4Balance: Decimal;
        PeriodLength: Text;
        SkipZeroBalanceCustomers: Boolean;
        TotalaBalance: Boolean;

    local procedure SetBucketLabels()
    begin
        // Bucket1Start := CalcDate('<-1M>', AgedAsOfDate);
        // Bucket2Start := CalcDate('<-2M>', AgedAsOfDate);
        // Bucket3Start := CalcDate('<-3M>', AgedAsOfDate);

        Bucket1Start := CalcDate('-' + PeriodLength, AgedAsOfDate);
        Bucket2Start := CalcDate('-' + PeriodLength + '-' + PeriodLength, AgedAsOfDate);
        Bucket3Start := CalcDate('-' + PeriodLength + '-' + PeriodLength + '-' + PeriodLength, AgedAsOfDate);

        Bucket1Label := Format(Bucket1Start + 1) + '..' + Format(AgedAsOfDate);
        Bucket2Label := Format(Bucket2Start + 1) + '..' + Format(Bucket1Start);
        Bucket3Label := Format(Bucket3Start + 1) + '..' + Format(Bucket2Start);
        Bucket4Label := 'Before ' + Format(Bucket3Start + 1);
    end;


}
