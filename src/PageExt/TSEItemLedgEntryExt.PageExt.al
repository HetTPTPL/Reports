pageextension 50160 "TSE Item Ledg Entry Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("My Description 3"; Rec."My Description 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the My Description 3 field.', Comment = '%';
            }
        }
    }
}
