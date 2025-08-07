xmlport 50155 "TSE Item Export Xml Port"
{
    Caption = 'TSE Item Export Xml Port';
    Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    FileName = 'Item List.txt';

    schema
    {
        textelement(ItemExport)
        {
            tableelement(Integer;Integer)
            {
                SourceTableView = sorting(Number) where (Number = const(1));
                textelement(ItemNo)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemNo := Item.FieldCaption("No.");
                    end;
                }
                textelement(ItemDescription)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemDescription := Item.FieldCaption(Description);
                    end;
                }
                textelement(ItemType)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemType := Item.FieldCaption(Type);
                    end;
                }
                textelement(ItemInventory)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemInventory := Item.FieldCaption(Inventory);
                    end;
                }
                textelement(ItemSubstituteExist)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemSubstituteExist := Item.FieldCaption("Substitutes Exist");
                    end;
                }
                textelement(ItemAssemblyBOM)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemAssemblyBOM := Item.FieldCaption("Assembly BOM");
                    end;
                }
                textelement(ItemMeasure)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemMeasure := Item.FieldCaption("Base Unit of Measure");
                    end;
                }
                textelement(ItemUnitCost)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemUnitCost := Item.FieldCaption("Unit Cost");
                    end;
                }
                textelement(ItemUnitPrice)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemUnitPrice := Item.FieldCaption("Unit Price");
                    end;
                }
                textelement(ItemVendorNo)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemVendorNo := Item.FieldCaption("Vendor No.");
                    end;
                }
                
            }
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
