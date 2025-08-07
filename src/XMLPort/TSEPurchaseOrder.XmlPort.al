xmlport 50163 "TSE Purchase Order"
{
    Caption = 'TSE Purchase Order';
    // Format = VariableText;
    Direction = Export;
    UseRequestPage = false;

    schema
    {
        textelement(PurchaseOrder)
        {
            tableelement(Vendor; Vendor)
            {
                fieldelement(No; Vendor."No.")
                {
                }
                fieldelement(Name; Vendor.Name)
                {
                }
                fieldelement(LocationCode; Vendor."Location Code")
                {
                }
                fieldelement(Contact; Vendor.Contact)
                {
                }
                fieldelement(Address; Vendor.Address)
                {
                }
                fieldelement(BalanceLCY; Vendor."Balance (LCY)")
                {
                }
                tableelement(PurchaseHeader; "Purchase Header")
                {
                    LinkTable = Vendor;
                    LinkFields = "Buy-from Vendor No." = field("No.");
                    fieldelement(DocumentDate; PurchaseHeader."Document Date")
                    {
                    }
                    fieldelement(AmountIncludingVAT; PurchaseHeader."Amount Including VAT")
                    {
                    }
                    trigger OnPreXmlItem()
                    begin
                        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
                    end;
                }
            }
        }
    }
}
