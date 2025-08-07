xmlport 50156 "TSE Item Import Xml Port"
{
    Caption = 'TSE Item Import Xml Port';
    Format = VariableText;
    Direction = Import;
    UseRequestPage = false;

    schema
    {
        textelement(ItemImport)
        {
            tableelement(Item; Item)
            {
                fieldelement(No; Item."No.")
                {
                }
                fieldelement(Description; Item.Description)
                {
                }
                fieldelement(Type; Item."Type")
                {
                }
                fieldelement(Inventory; Item.Inventory)
                {
                }
                fieldelement(SubstitutesExist; Item."Substitutes Exist")
                {
                }
                fieldelement(AssemblyBOM; Item."Assembly BOM")
                {
                }
                fieldelement(BaseUnitofMeasure; Item."Base Unit of Measure")
                {
                }
                fieldelement(UnitCost; Item."Unit Cost")
                {
                }
                fieldelement(UnitPrice; Item."Unit Price")
                {
                }
                fieldelement(VendorNo; Item."Vendor No.")
                {
                }
            }
        }
    }
}
