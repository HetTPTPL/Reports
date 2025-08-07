report 50167 "TSE Customer History Update "
{
    ApplicationArea = All;
    Caption = 'TSE Customer History Update ';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;
    EnableHyperlinks = true;
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(City; City)
            {
            }
            column(Balance; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
            column(BalanceDue; "Balance Due (LCY)")
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName)
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
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(LinkLbl; LinkLbl)
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
                column(PostingDate_CustLedgerEntry; "Posting Date")
                {
                }
                column(CurrencyCode_CustLedgerEntry; "Currency Code")
                {
                }
                column(RemainingAmount_CustLedgerEntry; "Remaining Amount")
                {
                }
                column(Amount_CustLedgerEntry; Amount)
                {
                }
            }

            trigger OnPreDataItem()
            begin
                Customer.SetRange("No.", '0', '40000');
            end;

            trigger OnAfterGetRecord()
            begin
                Customer.SetRange("Date Filter", 0D, WorkDate());
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
            LayoutFile = './src/Layouts/Layout50167_CustomerHistoryUpdatedV2.rdl';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;


    var
        CompanyInfo: Record "Company Information";
        LinkLbl: Label 'https://tripearltech.com/';
    // CompanyLbl: Label 'Tripearltech Pvt Ltd.';
    // AddressLbl: Label '1012, The Capital 2';
    // Address2Lbl: Label 'Science City Road, Sola';
    // Address3Lbl: Label 'Ahmedabad - 380060. Gujarat.';
}
