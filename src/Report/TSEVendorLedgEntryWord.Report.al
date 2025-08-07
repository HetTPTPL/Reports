report 50160 "TSE Vendor Ledg Entry Word"
{
    ApplicationArea = All;
    Caption = 'TSE Vendor Ledg Entry Word';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Word;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Contact_Vendor; Contact)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(VendLbl;VendLbl)
            {
            }
            column(UserID; UserId)
            {
            }
            dataitem("Vendor Ledger Entry";"Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = field("No.");
                column(DocumentNo_VendorLedgerEntry; "Document No.")
                {
                }
                column(DocumentType_VendorLedgerEntry; "Document Type")
                {
                }
                column(Description_VendorLedgerEntry; Description)
                {
                }
                column(AmountLCY_VendorLedgerEntry; "Amount (LCY)")
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
        layout(Word)
        {
            Type = Word;
            LayoutFile = './src/Layouts/Layout50160_VendorReport(DOC).docx';
        }
    }

    var
    VendLbl: Label 'Vender Ledger Report';
}
