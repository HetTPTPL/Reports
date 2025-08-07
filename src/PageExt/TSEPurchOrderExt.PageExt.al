pageextension 50162 "TSE Purch Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Vendor Name 3"; Rec."Vendor Name 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Name 3 field.', Comment = '%';
            }
        }
    }
}
