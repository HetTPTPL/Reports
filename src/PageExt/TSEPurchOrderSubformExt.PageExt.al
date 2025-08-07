pageextension 50165 "TSE Purch Order Subform Ext" extends "Purchase Order Subform"
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
