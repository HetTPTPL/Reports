pageextension 50156 TSEPostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Name 3"; Rec."Name 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Name 3 field.', Comment = '%';
            }
        }
    }
}
