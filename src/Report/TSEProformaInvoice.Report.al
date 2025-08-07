report 50171 "TSE Proforma Invoice"
{
    ApplicationArea = All;
    Caption = 'TSE Proforma Invoice';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "No.", "Sell-to Customer No.";
            column(No_SalesHeader; "No.")
            {
            }
            column(BilltoName_SalesHeader; "Bill-to Name")
            {
            }
            column(BilltoContact_SalesHeader; "Bill-to Contact")
            {
            }
            column(BilltoAddress_SalesHeader; "Bill-to Address")
            {
            }
            column(BilltoCity_SalesHeader; "Bill-to City")
            {
            }
            column(BilltoAddress2_SalesHeader; "Bill-to Address 2")
            {
            }
            // column(BilltoCountryRegionCode_SalesHeader; "Bill-to Country/Region Code")
            // {
            // }
            column(BilltoPostCode_SalesHeader; "Bill-to Post Code")
            {
            }
            column(SelltoCustomerName_SalesHeader; "Sell-to Customer Name")
            {
            }
            column(SelltoContact_SalesHeader; "Sell-to Contact")
            {
            }
            column(SelltoAddress_SalesHeader; "Sell-to Address")
            {
            }
            column(SelltoAddress2_SalesHeader; "Sell-to Address 2")
            {
            }
            column(SelltoCity_SalesHeader; "Sell-to City")
            {
            }
            // column(SelltoCountryRegionCode_SalesHeader; "Sell-to Country/Region Code")
            // {
            // }
            column(SelltoPostCode_SalesHeader; "Sell-to Post Code")
            {
            }
            // column(PaymentTermsCode_SalesHeader; "Payment Terms Code")
            // {
            // }
            // column(ShipmentMethodCode_SalesHeader; "Shipment Method Code")
            // {
            // }
            // column(PaymentMethodCode_SalesHeader; "Payment Method Code")
            // {
            // }
            column(CompanyName_Company; CompanyInfo.Name)
            {
            }
            column(CompanyLogo_Company; CompanyInfo.Picture)
            {
            }
            column(CompanyAddress_Company; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2_Company; CompanyInfo."Address 2")
            {
            }
            column(CompanyCity_Company; CompanyInfo.City)
            {
            }
            // column(CompanyCountry; CompanyInfo."Country/Region Code")
            // {
            // }
            column(CompanyPostCode_Company; CompanyInfo."Post Code")
            {
            }
            column(BilltoCountry_SalesHeader; BilltoCountry)
            {
            }
            column(SelltoCountry_SalesHeader; SelltoCountry)
            {
            }
            column(CompanyCountry_SalesHeader; CompanyCountry)
            {
            }
            column(ShipmentMethodDesc_SalesHeader; ShipmentMethodDesc)
            {
            }
            column(PaymentMethodDesc_SalesHeader; PaymentMethodDesc)
            {
            }
            column(PaymenttermDesc_SalesHeader; PaymenttermDesc)
            {
            }
            // column(Comments;Comments)
            // {
            // }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where(Type = filter(Item | "G/L Account"));
                column(No_SalesLine; "No.")
                {
                }
                column(Description_SalesLine; Description)
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                }
                column(LineDiscountAmount_SalesLine; "Line Discount Amount")
                {
                }
                column(LineAmount_SalesLine; "Line Amount")
                {
                }
            }
            dataitem(SalesCommentLine; "Sales Comment Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Document Type" = field("Document Type"), "No." = field("No.");
                DataItemTableView = where("Document Line No." = filter(0));
                column(Comment_SalesCommentLine; Comment)
                {
                }
                column(Counter; Counter)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    Counter += 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if CountryRegion.Get("Bill-to Country/Region Code") then
                    BilltoCountry := CountryRegion.Name;
                if CountryRegion.Get("Sell-to Country/Region Code") then
                    SelltoCountry := CountryRegion.Name;
                if CountryRegion.Get(CompanyInfo."Country/Region Code") then
                    CompanyCountry := CountryRegion.Name;
                if ShipmentMethod.Get("Shipment Method Code") then
                    ShipmentMethodDesc := ShipmentMethod.Description;
                if PaymentMetod.Get("Payment Method Code") then
                    PaymentMethodDesc := PaymentMetod.Description;
                if PaymentTerm.Get("Payment Terms Code") then
                    PaymenttermDesc := PaymentTerm.Description;

                Counter := 0;
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
            LayoutFile = './src/Layouts/Layout50171_ProformaInvoice.rdl';
        }
    }

    labels
    {
        Report_Lbl = 'Proforma Invoice';
        Billto_Lbl = 'Bill-to';
        Sellto_Lbl = 'Sell-to';
        CompanyInfo_Lbl = 'Company Information';
        PaymentTern_Lbl = 'Payment Terms';
        ShipmentMethod_Lbl = 'Shipment Method';
        PaymentMethod_Lbl = 'Payment Method';
        LineNo_Lbl = 'No.';
        Description_Lbl = 'Description';
        Quantity_Lbl = 'Quantity';
        LineDiscount_Lbl = 'Line Discount';
        LineAmt_Lbl = 'Line Amount';
        AmtWords_Lbl = 'Amount in Words';
        TotalLineAmt_Lbl = 'Total Line Amount';
        TotalLineDiscount_Lbl = 'Total Line Discount';
        AmtPayable_Lbl = 'Amount Payable';
        AmtinWords_Lbl = 'Amount in Words';
        Comments_Lbl = 'Comments';
        AutorizedSign_Lbl = 'Authorized Signatory';
        Paisa_Lbl = 'Paisa Only';
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CountryRegion: Record "Country/Region";
        ShipmentMethod: Record "Shipment Method";
        PaymentMetod: Record "Payment Method";
        PaymentTerm: Record "Payment Terms";
        BilltoCountry: Text;
        SelltoCountry: Text;
        CompanyCountry: Text;
        ShipmentMethodDesc: Text;
        PaymentMethodDesc: Text;
        PaymenttermDesc: Text;
        Counter: Integer;
}
