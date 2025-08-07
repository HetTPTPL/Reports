report 50168 "TSE Vendor - Purchase"
{
    ApplicationArea = All;
    Caption = 'TSE Vendor - Purchase';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

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
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(Contact; Contact)
            {
            }
            column(City; City)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            column(Purchases__LCY_; "Purchases (LCY)")
            {
            }
            column(VendLbl; VendLbl)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(MinPurchLCYGlobal; MinPurchLCY)
            {
            }
            column(MinAmtLCYCaptLbl; MinAmtLCYCaptLbl)
            {
            }
            column(HideAddr; HideAddr)
            {
            }
            // column(FilterText;FilterText)
            // {
            // }

            // trigger OnPreDataItem()
            // begin
            //     FilterText := GetFilters();  // Capture applied filters
            // end;

            trigger OnAfterGetRecord()
            begin
                if HideAddr then begin
                    Contact := '';
                    Address := '';
                    "Address 2" := '';
                    City := '';
                    "Post Code" := '';
                    "Country/Region Code" := '';
                end;

                if "Purchases (LCY)" < MinPurchLCY then
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(MinPurchLCYGlobal; MinPurchLCY)
                    {
                        ApplicationArea = all;
                        Caption = 'Purchase (LCY) Greater Than';
                        ToolTip = 'Specifies an amount so that the report will only include those customers to which you have sold more than this amount within the specified dates.';
                    }
                    field(HideAddrvar; HideAddr)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Hide Address Detail';
                        ToolTip = 'Specifies that you do not want the report to show address details for each vendor.';
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
            LayoutFile = './src/Layouts/Layout50168_VendorPurchase.rdl';
        }
    }

    var
        VendLbl: Label 'Vendor - Purcahse List';
        // FilterText: Text;
        MinAmtLCYCaptLbl: Label 'Purchase (LCY) greater than ';
        MinPurchLCY: Decimal;
        HideAddr: Boolean;

}
