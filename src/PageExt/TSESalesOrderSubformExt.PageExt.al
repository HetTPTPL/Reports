pageextension 50158 "TSE Sales Order Subform Ext" extends "Sales Order Subform"
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