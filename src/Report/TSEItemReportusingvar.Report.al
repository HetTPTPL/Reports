report 50172 "TSE Item Report using var"
{
    ApplicationArea = All;
    Caption = 'TSE Item Report using var';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(Integer; "Integer")
        {
            column(EntryNo; EntryNo)
            {
            }
            column(EntryType; EntryType)
            {
            }
            column(Doctype; Doctype)
            {
            }
            column(DocNo; DocNo)
            {
            }
            column(SalesAmt; SalesAmt)
            {
            }
            column(No; No)
            {
            }
            column(Name; Name)
            {
            }
            column(postingdate; postingdate)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(CostAmount; CostAmount)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {

            }
            trigger OnPreDataItem()
            begin
                if ItemNoFilter <> '' then
                    ItemLedgerEntryRec.SetRange("Item No.", ItemNoFilter);
                SetRange(Number, 1, ItemLedgerEntryRec.Count);
            end;

            trigger OnAfterGetRecord()
            begin
                if ItemLedgerEntryRec.Get(Number) then begin
                    ItemLedgerEntryRec.CalcFields("Sales Amount (Actual)", "Cost Amount (Actual)");
                    EntryNo := ItemLedgerEntryRec."Entry No.";
                    EntryType := ItemLedgerEntryRec."Entry Type";
                    Doctype := ItemLedgerEntryRec."Document Type";
                    DocNo := ItemLedgerEntryRec."Document No.";
                    SalesAmt := ItemLedgerEntryRec."Sales Amount (Actual)";
                    No := ItemLedgerEntryRec."Item No.";
                    postingdate := ItemLedgerEntryRec."Posting Date";
                    Quantity := ItemLedgerEntryRec.Quantity;
                    CostAmount := ItemLedgerEntryRec."Cost Amount (Actual)";
                end;

                if ItemRec.Get(No) then
                    Name := ItemRec.Description;
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(TopItem; TopN)
                    {
                        Caption = 'Enter No. of Record you want';
                        ToolTip = 'Enter No. of Record you want';
                        ApplicationArea = all;
                        MinValue = 1;
                    }
                    field(ItemNoFilter_Filer; ItemNoFilter)
                    {
                        Caption = 'Enter Item No.';
                        ToolTip = 'Enter the Item No. you want to display.';
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50172_ItemHistory_Var.rdl';
        }

    }

    labels
    {
        Report_lbl = 'Item History';
        ItemNo_lbl = 'No.';
        ItemName_lbl = 'Name';
        EntryType_lbl = 'Entry Type';
        DocumentType_lbl = 'Document Type';
        DocumentNo_lbl = 'Document No.';
        PostingDate_lbl = 'Posting Date';
        Quantity_lbl = 'Quantity';
        SalesAmt_lbl = 'Sales Amount (Actual)';
        CostAmt_lbl = 'Cost Amount (Actual)';
        Total_lbl = 'Total';
        ItemTotal_lbl = 'Item Total';
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        ItemRec: Record Item;
        ItemLedgerEntryRec: Record "Item Ledger Entry";
        CompanyInfo: Record "Company Information";
        TopN: Integer;
        EntryType: Enum "Item Ledger Entry Type";
        Doctype: Enum "Item Ledger Document Type";
        ItemNoFilter: Code[20];
        DocNo: Code[20];
        SalesAmt: Decimal;
        EntryNo: Integer;
        No: Code[20];
        Name: Text[100];
        postingdate: Date;
        Quantity: Decimal;
        CostAmount: Decimal;

}
