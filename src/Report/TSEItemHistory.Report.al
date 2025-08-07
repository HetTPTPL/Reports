report 50169 TSEItemHistory
{
    ApplicationArea = All;
    Caption = 'TSE Item History';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            column(No_Item; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = sorting("Entry No.");
                column(Entry_No_; "Entry No.")
                {

                }
                column(Item_No_ItemLedgerEntry; "Item No.")
                {
                }
                column(EntryType_ItemLedgerEntry; "Entry Type")
                {
                }
                column(DocumentType_ItemLedgerEntry; "Document Type")
                {
                }
                column(PostingDate_ItemLedgerEntry; "Posting Date")
                {
                }
                column(DocumentNo_ItemLedgerEntry; "Document No.")
                {
                }
                column(SalesAmountActual_ItemLedgerEntry; "Sales Amount (Actual)")
                {
                }
                column(CostAmountActual_ItemLedgerEntry; "Cost Amount (Actual)")
                {
                }
                column(Quantity_ItemLedgerEntry; Quantity)
                {
                }

            }
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
            LayoutFile = './src/Layouts/Layout50169_ItemHistoryV3.rdl';
        }
        layout("RDLC-V2")
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50169_ItemHistoryV2.rdl';
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
        CompanyInfo: Record "Company Information";
}