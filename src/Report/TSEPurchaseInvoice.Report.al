report 50166 "TSE Purchase Invoice"
{
    ApplicationArea = All;
    Caption = 'TSE Purchase Invoice';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            column(PaytoContact; "Pay-to Contact")
            {
                IncludeCaption = true;
            }
            column(PaytoName; "Pay-to Name")
            {
                IncludeCaption = true;
            }
            column(PaytoAddress; "Pay-to Address")
            {
                IncludeCaption = true;
            }
            column(PaytoCity; "Pay-to City")
            {
                IncludeCaption = true;
            }
            column(PaytoPostCode; "Pay-to Post Code")
            {
                IncludeCaption = true;
            }
            column(PaytoCountryRegionCode; "Pay-to Country/Region Code")
            {
                IncludeCaption = true;
            }
            column(ShiptoContact; "Ship-to Contact")
            {
                IncludeCaption = true;
            }
            column(ShiptoName; "Ship-to Name")
            {
                IncludeCaption = true;
            }
            column(ShiptoAddress; "Ship-to Address")
            {
                IncludeCaption = true;
            }
            column(ShiptoCity; "Ship-to City")
            {
                IncludeCaption = true;
            }
            column(ShiptoCountryRegionCode; "Ship-to Country/Region Code")
            {
                IncludeCaption = true;
            }
            column(ShiptoPostCode; "Ship-to Post Code")
            {
                IncludeCaption = true;
            }
            column(PaytoVendorNo; "Pay-to Vendor No.")
            {
                IncludeCaption = true;
            }
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(OrderNo; "Order No.")
            {
                IncludeCaption = true;
            }
            column(DocumentDate; "Document Date")
            {
                IncludeCaption = true;
            }
            column(PostingDate; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(DueDate; "Due Date")
            {
                IncludeCaption = true;
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
                IncludeCaption = true;
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
                IncludeCaption = true;
            }
            column(ShipmentMethodCode_PurchInvHeader; "Shipment Method Code")
            {
                IncludeCaption = true;
            }
            column(PricesIncludingVAT; "Prices Including VAT")
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
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
                IncludeCaption = true;
            }
            column(VatRegistrationNo_Company; CompanyInfo."VAT Registration No.")
            {
                IncludeCaption = true;
            }
            column(GiroNo_Company; CompanyInfo."Giro No.")
            {
                IncludeCaption = true;
            }
            column(BankName_Company; CompanyInfo."Bank Name")
            {
                IncludeCaption = true;
            }
            column(BankAccountNo_Company; CompanyInfo."Bank Account No.")
            {
                IncludeCaption = true;
            }
            column(PurchInvLbl; PurchInvLbl)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(VATLbl; VATLbl)
            {
            }
            column(ShipLbl; ShipLbl)
            {
            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No_PurchInvLine; "No.")
                {
                    IncludeCaption = true;
                }
                column(Description_PurchInvLine; Description)
                {
                    IncludeCaption = true;
                }
                column(Quantity_PurchInvLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(UnitofMeasure_PurchInvLine; "Unit of Measure")
                {
                    IncludeCaption = true;
                }
                column(DirectUnitCost_PurchInvLine; "Direct Unit Cost")
                {
                    IncludeCaption = true;
                }
                column(LineDiscount_PurchInvLine; "Line Discount %")
                {
                    IncludeCaption = true;
                }
                column(AllowInvoiceDisc_PurchInvLine; "Allow Invoice Disc.")
                {
                    IncludeCaption = true;
                }
                column(VATIdentifier_PurchInvLine; "VAT Identifier")
                {
                    IncludeCaption = true;
                }
                column(Amount_PurchInvLine; Amount)
                {
                    IncludeCaption = true;
                }
                column(VAT_PurchInvLine; "VAT %")
                {
                    IncludeCaption = true;
                }
                column(LineAmount_PurchInvLine; "Line Amount")
                {
                    IncludeCaption = true;
                }
                column(InvDiscountAmount_PurchInvLine; "Inv. Discount Amount")
                {
                    IncludeCaption = true;
                }
                column(VATBaseAmount_PurchInvLine; "VAT Base Amount")
                {
                    IncludeCaption = true;
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
            LayoutFile = './src/Layouts/Layout50166_PurchaseInvoice.rdl';
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        PurchInvLbl: Label 'Purchase - Invoice';
        VATLbl: Label 'VAT Amount Specification';
        ShipLbl: Label 'Ship-to Address';
}
