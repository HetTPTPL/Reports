xmlport 50162 "TSE Customer to Inventory"
{
    Caption = 'TSE Customer to Inventory';
    // Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    // TableSeparator = '';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Customer; Customer)
            {

                fieldelement(No; Customer."No.")
                {
                }
                fieldelement(Name; Customer.Name)
                {
                }
                fieldelement(Address; Customer.Address)
                {
                }
                fieldelement(Contact; Customer.Contact)
                {
                }
                fieldelement(EMail; Customer."E-Mail")
                {
                }
                fieldelement(BalanceLCY; Customer."Balance (LCY)")
                {
                }
                tableelement(Salesline; "Sales Line")
                {
                    LinkTable = Customer;
                    LinkFields = "Sell-to Customer No." = field("No.");


                    fieldelement(Type; Salesline."Type")
                    {
                    }
                    fieldelement(No; Salesline."No.")
                    {
                    }
                    fieldelement(Description; Salesline.Description)
                    {
                    }
                    tableelement(Item; Item)
                    {
                        LinkTable = Salesline;
                        LinkFields = "No." = field("No.");
                        fieldelement(Inventory; Item.Inventory)
                        {
                        }
                    }

                    trigger OnPreXmlItem()
                    begin
                        Salesline.SetRange("Document Type", Salesline."Document Type"::Order);
                        Salesline.SetRange(Type, Salesline.Type::Item);
                    end;
                }
            }
        }
    }
}
