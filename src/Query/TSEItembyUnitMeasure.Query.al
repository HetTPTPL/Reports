namespace Task.Task;

using Microsoft.Inventory.Item;
using Microsoft.Foundation.UOM;

query 50160 "TSE Item by Unit Measure"
{
    Caption = 'TSE Item by Unit Measure';
    QueryType = Normal;
    QueryCategory = 'Item List';

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(UnitPrice; "Unit Price")
            {
            }
            column(BaseUnitofMeasure; "Base Unit of Measure")
            {
            }

            dataitem(Unit_of_Measure; "Unit of Measure")
            {
                DataItemLink = Code = Item."Base Unit of Measure";
                column(Description; Description)
                {

                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
