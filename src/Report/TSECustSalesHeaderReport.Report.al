report 50154 "TSE Cust Sales Header Report"
{
    ApplicationArea = All;
    Caption = 'TSE Cust Sales Header Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

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
            column(Contact; Contact)
            {
                IncludeCaption = true;
            }
            column(Address; Address)
            {
                IncludeCaption = true;
            }
            column(Balance__LCY_; "Balance (LCY)")
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
            column(ShowSalesOrder; ShowSalesOrder)
            {
            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = field("No.");
                column(No_SalesHeader; "No.")
                {
                }
                column(DocumentType_SalesHeader; "Document Type")
                {
                }
                column(PostingDate_SalesHeader; "Posting Date")
                {
                }
                column(PostingDescription_SalesHeader; "Posting Description")
                {
                }
                column(AmountIncludingVAT_SalesHeader; "Amount Including VAT")
                {
                }
                trigger OnPreDataItem()
                begin
                    if not ShowSalesOrder then
                        CurrReport.Break();
                    SetRange("Document Type", "Document Type"::Order);
                end;
            }
        }

    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(ShowSalesOrder_Option; ShowSalesOrder)
                    {
                        ApplicationArea = all;
                        Caption = 'Show Sales Order';
                        ToolTip = 'Specifies the value of the Show Sales Order field.';
                    }
                    field(Test_Lbl; Test_Lbl)
                    {
                        ApplicationArea = all;
                        ShowCaption = false;
                        Editable = false;
                        trigger OnDrillDown()
                        var
                            SalesHaeaderRec: Record "Sales Header";
                        begin
                            Message('This is test action');
                            Page.RunModal(Page::"Sales Order List", SalesHaeaderRec);
                        end;
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
            LayoutFile = './src/Layouts/Layout50154_CustomerSales.RDL';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CustReportLbl: Label 'Customer Sales Report';
        ShowSalesOrder: Boolean;
        Test_Lbl: Label 'Test';
}
