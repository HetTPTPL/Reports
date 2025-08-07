report 50156 "TSE Vendor Ledger Entry"
{
    ApplicationArea = All;
    Caption = 'TSE Vendor Ledger Entry';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Excel;

    dataset
    {
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {
            column(VendorNo; "Vendor No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(Description; Description)
            {
            }
            column(AmountLCY; "Amount (LCY)")
            {
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
        layout(Excel)
        {
            Type = Excel;
            LayoutFile = './src/Layouts/Layout50156_VendorLedgerEntry.xlsx';
        }
    }
}
