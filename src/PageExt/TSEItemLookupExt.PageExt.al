namespace Task.Task;

using Microsoft.Inventory.Item;
using System.Environment;

pageextension 50175 "TSE Item Lookup Ext" extends "Item Lookup"
{
    layout
    {
        modify("Search Description")
        {
            Visible = true;
        }
    }
}
