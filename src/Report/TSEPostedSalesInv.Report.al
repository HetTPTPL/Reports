report 50165 "TSE Posted Sales Inv"
{
    ApplicationArea = All;
    Caption = 'TSE Posted Sales Inv';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";

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
            column(SalesLbl; SalesLbl)
            {
            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = field("No.");
                column(No_SalesInvoiceHeader; "No.")
                {
                }
                column(PostingDate_SalesInvoiceHeader; "Posting Date")
                {
                }
                column(AmountIncludingVAT_SalesInvoiceHeader; "Amount Including VAT")
                {
                }
                trigger OnPreDataItem()
                begin
                    Message('Pre DataItem Posted Sales Invoice!!');
                end;

                trigger OnAfterGetRecord()
                begin
                    Message('After Get Record Posted Sales Invoice!!');
                end;

                trigger OnPostDataItem()
                begin
                    Message('Post DataItem Posted Sales Invoice!!');
                end;
            }
            trigger OnPreDataItem()
            begin
                Message('Pre DataItem Customer!!');
            end;

            trigger OnAfterGetRecord()
            begin
                Message('After Get Record Customer!!');
            end;

            trigger OnPostDataItem()
            begin
                Message('Post DataItem Customer!!');
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
            LayoutFile = './src/Layouts/Layout50165_PostedSalesInv.rdl';
        }
    }

    var
        SalesLbl: Label 'Posted Sales Invoice Report';
}
