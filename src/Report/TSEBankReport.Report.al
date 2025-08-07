report 50153 "TSE Bank Report"
{
    ApplicationArea = All;
    Caption = 'TSE Bank Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;


    dataset
    {
        dataitem(Bank; "Bank Account")
        {


            column(No_Bank; "No.")
            {
            }
            column(Name_Bank; Name)
            {
            }
            column(BankBranchNo_Bank; "Bank Branch No.")
            {
            }
            column(BankAccountNo_Bank; "Bank Account No.")
            {
            }
            column(BalanceLCY_Bank; "Balance (LCY)")
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(BankReportLbl; BankReportLbl)
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No.");
                column(DocumentNo_BankAccountLedgerEntry; "Document No.")
                {
                }
                column(Description_BankAccountLedgerEntry; Description)
                {
                }
                column(PostingDate_BankAccountLedgerEntry; "Posting Date")
                {
                }
                column(Amount_BankAccountLedgerEntry; Amount)
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
            LayoutFile = './src/Layouts/Layout50153_BankReport.RDL';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        BankReportLbl: Label 'Bank Report';
}
