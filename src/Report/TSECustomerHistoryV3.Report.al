report 50170 "TSE Customer History V3"
{
    ApplicationArea = All;
    Caption = 'TSE Customer History V3';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;
    EnableHyperlinks = true;

    dataset
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Customer No.";
            column(CustomerNo_CustLedgerEntry; "Customer No.")
            {
            }
            column(CustomerName_CustLedgerEntry; "Customer Name")
            {
            }
            column(Balance_Customer; CustomerRec."Balance (LCY)")
            {
            }
            column(Balance_Due_Customer; CustomerRec."Balance Due (LCY)")
            {
            }
            column(EntryNo_CustLedgerEntry; "Entry No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(AmountLCY; "Amount (LCY)")
            {
            }
            column(RemainingAmtLCY; "Remaining Amt. (LCY)")
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            trigger OnAfterGetRecord()
            begin
                CustomerRec.Get("Customer No.");
                CustomerRec.SetRange("Date Filter", WorkDate());
                CustomerRec.CalcFields("Balance (LCY)", "Balance Due (LCY)");
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
            LayoutFile = './src/Layouts/Layout50170_CustomerHistoryV3.rdl';
        }
    }

    labels
    {
        Report_Lbl = 'Customer History V3';
        No_Lbl = 'No.';
        Name_Lbl = 'Name';
        DocumentType_Lbl = 'Document Type';
        DocumentNO_Lbl = 'Document No.';
        DueDate_Lbl = 'Due Date';
        PostingDate_Lbl = 'Posting Date';
        CurrencyCode_Lbl = 'Currency Code';
        Amount_Lbl = 'Amount (LCY)';
        RemainingAmt_Lbl = 'Remaining Amount (LCY)';
        Total_lbl = 'Total';
        Grand_lbl = 'Grand Total';
        Balance_Lbl = 'Balance (LCY)';
        Balancedue_Lbl = 'Balance Due (LCY)';
        Location_Lbl = 'https://www.google.com/maps/place//data=!4m2!3m1!1s0x395e9b882b1ca08b:0x59b5bcaac7764236?source=g.page.share';
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CustomerRec: Record Customer;
        CompanyInfo: Record "Company Information";

}
