report 50158 "TSE Vendor Ledg By Matrix"
{
    ApplicationArea = All;
    Caption = 'TSE Vendor Ledg By Matrix';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            column(VendorNo_VendorLedgerEntry; "Vendor No.")
            {
            }
            column(VendorName_VendorLedgerEntry; "Vendor Name")
            {
            }
            column(DocumentType_VendorLedgerEntry; "Document Type")
            {
            }
            column(DocumentNo_VendorLedgerEntry; "Document No.")
            {
            }
            column(AmountLCY_VendorLedgerEntry; "Amount (LCY)")
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(VendReportLbl; VendReportLbl)
            {
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = field("Vendor No.");
                column(No_; "No.")
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
            LayoutFile = './src/Layouts/Layout50158_VendorLedger.RDL';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        VendReportLbl: Label 'Vendor Ledger Report';
}
