pageextension 50154 TSECustCardExt extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Name 3"; Rec."Name 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Name 3 field.', Comment = '%';
            }
        }
    }
}