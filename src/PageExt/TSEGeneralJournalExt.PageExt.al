pageextension 50167 "TSE General Journal Ext" extends "General Journal"
{
    layout
    {
        addafter("Document Type")
        {
            field(Details; Rec.Details)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Details field.', Comment = '%';
            }
        }
    }    
}
