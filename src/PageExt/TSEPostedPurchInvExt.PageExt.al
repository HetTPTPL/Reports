pageextension 50163 "TSE Posted Purch Inv Ext" extends "Posted Purchase Invoice"
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
    actions
    {
        addlast(processing)
        {
            action("Posted Purch Invoice")
            {
                ApplicationArea = all;
                ToolTip = 'Sales Pro Formal Invoice';
                Image = ViewPostedOrder;
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter("No.", Rec."No.");
                    Rec.SetFilter("Buy-from Vendor No.", Rec."Buy-from Vendor No.");
                    Report.RunModal(50166, true, true, Rec);
                end;
            }
        }

        addlast(Promoted)
        {
            actionref(PostedPurchInvoice_Promoted; "Posted Purch Invoice")
            {

            }
        }
    }
}