pageextension 50169 "TSE Item Journal Ext" extends "Item Journal"
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
