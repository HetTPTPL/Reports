pageextension 50161 "TSE Vendor Card Ext" extends "Vendor Card"
{
    layout
    {
        addafter(Name)
        {
            field("Vendor Name 3"; Rec."Vendor Name 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Name 3 field.', Comment = '%';
            }
        }
    }       
}
