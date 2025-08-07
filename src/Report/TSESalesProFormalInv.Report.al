report 50164 "TSE Sales Pro Formal Inv"
{
    ApplicationArea = All;
    Caption = 'TSE Sales Pro Formal Inv';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where ("Document Type" = filter('Order'));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            column(SelltoAddress_SalesHeader; "Sell-to Address")
            {
                IncludeCaption = true;
            }
            column(SelltoCustomerName_SalesHeader; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(SelltoContact_SalesHeader; "Sell-to Contact")
            {
                IncludeCaption = true;
            }
            column(SelltoAddress2_SalesHeader; "Sell-to Address 2")
            {
                IncludeCaption = true;
            }
            column(SelltoPhoneNo_SalesHeader; "Sell-to Phone No.")
            {
                IncludeCaption = true;
            }
            column(SelltoCity_SalesHeader; "Sell-to City")
            {
                IncludeCaption = true;
            }
            column(SelltoCounty_SalesHeader; "Sell-to County")
            {
                IncludeCaption = true;
            }
            column(SelltoPostCode_SalesHeader; "Sell-to Post Code")
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
                IncludeCaption = true;
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
                IncludeCaption = true;
            }
            column(CompanyCity; CompanyInfo.City)
            {
                IncludeCaption = true;
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
                IncludeCaption = true;
            }
            column(CompanyCountry; CompanyInfo."Country/Region Code")
            {
                IncludeCaption = true;
            }
            column(VATRegistrationNo_SalesHeader; "VAT Registration No.")
            {
                IncludeCaption = true;
            }
            column(YourReference_SalesHeader; "Your Reference")
            {
                IncludeCaption = true;
            }
            column(ExternalDocumentNo_SalesHeader; "External Document No.")
            {
                IncludeCaption = true;
            }
            column(ShipmentMethodCode_SalesHeader; "Shipment Method Code")
            {
                IncludeCaption = true;
            }
            column(CurrencyCode_SalesHeader; "Currency Code")
            {
                IncludeCaption = true;
            }
            column(VatRegistrationNo_Company; CompanyInfo."VAT Registration No.")
            {
                IncludeCaption = true;
            }
            column(SalespersonCode_SalesHeader; "Salesperson Code")
            {
                IncludeCaption = true;
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
                IncludeCaption = true;
            }
            column(SalesLbl; SalesLbl)
            {

            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
                IncludeCaption = true;
            }
            column(Textlbl; TextLbl)
            {
            }
            column(Text2lbl; Text2Lbl)
            {
            }
            column(Text3lbl; Text3Lbl)
            {
            }
            column(Text4lbl; Text4Lbl)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");
                RequestFilterFields = "Document No.";
                column(Description_SalesLine; Description)
                {
                    IncludeCaption = true;
                }
                column(DocumentNo_SalesLine; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(Quantity_SalesLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(UnitPrice_SalesLine; "Unit Price")
                {
                    IncludeCaption = true;
                }
                column(NetWeight_SalesLine; "Net Weight")
                {
                    IncludeCaption = true;
                }
                column(VAT_SalesLine; "VAT %")
                {
                    IncludeCaption = true;
                }
                column(LineAmount_SalesLine; "Line Amount")
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord()
                var
                    SalesLine: Record "Sales Line";
                    TempSalesLine: Record "Sales Line" temporary;
                    FormatDoc: Codeunit "Format Document";
                begin
                    if MergeLineifSame then begin
                        SalesLine.SetRange("Document Type", "Sales Line"."Document Type");
                        SalesLine.SetRange("Document No.", "Sales Line"."Document No.");
                        SalesLine.SetRange("No.", "Sales Line"."No.");
                        if SalesLine.FindSet() then begin
                            TempSalesLine.Init();
                            TempSalesLine.TransferFields(SalesLine);
                            repeat
                                if TempSalesLine."Line No." <> SalesLine."Line No." then begin
                                    TempSalesLine.Quantity += SalesLine.Quantity;
                                    TempSalesLine."Line Amount" += SalesLine."Line Amount";
                                end;
                            until SalesLine.Next() = 0;
                            if "Line No." <> TempSalesLine."Line No." then
                                CurrReport.Skip();
                            Quantity := TempSalesLine.Quantity;
                            "Line Amount" := TempSalesLine."Line Amount";
                        end;
                    end;

                    if FormatDoc.HideDocumentLine(HideLinesWithZeroQuantity, "Sales Line", FieldNo("Qty. to Invoice")) then
                        CurrReport.Skip();
                end;

            }
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Option)
                {
                    field(HideLinesWithZeroQuantity_Filter; HideLinesWithZeroQuantity)
                    {
                        ApplicationArea = all;
                        Caption = 'Hide the line of quantity which has Zero.';
                        ToolTip = 'Hide the line of quantity which has Zero.';
                    }
                    field(MergeLineifSame_Filter; MergeLineifSame)
                    {
                        ApplicationArea = all;
                        Caption = 'Merge Line (Same Items)';
                        ToolTip = 'Specifies the value of the Merge Line field.';
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
            LayoutFile = './src/Layouts/Layout50164_SalesInvoice.rdl';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        SalesLbl: Label 'Sales Invoice';
        TextLbl: Label 'For customer purposes Only.';
        Text2Lbl: Label 'For and on behalf of the above named company:';
        Text3Lbl: Label 'Name (in print) Signature';
        Text4Lbl: Label 'Position in company';
        HideLinesWithZeroQuantity: Boolean;
        MergeLineifSame: Boolean;

}
