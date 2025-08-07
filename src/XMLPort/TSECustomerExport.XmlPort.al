xmlport 50159 "TSE Customer Export"
{
    Caption = 'TSE Customer Export';
    Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Customer; Customer)
            {
                CalcFields = "Balance (LCY)";
                fieldelement(No; Customer."No.")
                {
                }
                fieldelement(Name; Customer.Name)
                {
                }
                fieldelement(Contact; Customer.Contact)
                {
                }
                fieldelement(EMail; Customer."E-Mail")
                {
                }
                fieldelement(Address; Customer.Address)
                {
                }
                fieldelement(BalanceLCY; Customer."Balance (LCY)")
                {
                    AutoCalcField = false;
                }
                tableelement(SalesHeader; "Sales Header")
                {
                    MaxOccurs = Once;
                    LinkTable = "Customer";
                    LinkFields = "Sell-to Customer No." = field("No.");
                    CalcFields = Amount;

                    fieldelement(Amount; SalesHeader.Amount)
                    {
                        // MaxOccurs = Once;
                        AutoCalcField = false;
                    }
                }
            }
        }
    }
}