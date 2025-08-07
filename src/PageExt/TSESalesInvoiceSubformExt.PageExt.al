pageextension 50151 "TSE Sales Invoice Subform Ext" extends "Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Description 3"; Rec."Description 3")
            {
                ToolTip = 'Description 3';
                ApplicationArea = All;
            }
        }
    }          
}
