report 50155 "TSE Cust Ledg Entry"
{
    ApplicationArea = All;
    Caption = 'TSE Cust Ledg Entry';
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
            column(Address; Address)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CustReportLbl; CustReportLbl)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                column(DocumentNo_CustLedgerEntry; "Document No.")
                {
                }
                column(DocumentType_CustLedgerEntry; "Document Type")
                {
                }
                column(DocumentDate_CustLedgerEntry; "Document Date")
                {
                }
                column(Description_CustLedgerEntry; Description)
                {
                }
                column(AmountLCY_CustLedgerEntry; "Amount (LCY)")
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
            LayoutFile = './src/Layouts/Layout50155_CustLedgEntry.RDL';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CustReportLbl: Label 'Customer ledger Report';
}