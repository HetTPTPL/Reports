pageextension 50159 "TSE Posted Sales Shpt. Sub Ext" extends "Posted Sales Shpt. Subform"
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
