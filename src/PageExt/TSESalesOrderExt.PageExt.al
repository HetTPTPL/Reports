pageextension 50155 TSESalesOrderExt extends "Sales Order"
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

    actions
    {
        addlast(processing)
        {
            action("Sales Pro Formal Invoice")
            {
                ApplicationArea = all;
                ToolTip = 'Sales Pro Formal Invoice';
                Image = ViewPostedOrder;
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("Document Type", Rec."Document Type");
                    Rec.SetFilter("No.", Rec."No.");
                    Rec.SetFilter("Sell-to Customer No.", Rec."Sell-to Customer No.");
                    Report.RunModal(50164, true, true, Rec);
                end;
            }
        }
        addfirst("&Order Confirmation")
        {
            action("Print Pro Formal Invoice")
            {
                ApplicationArea = all;
                ToolTip = 'Pro Formal Invoice';
                Image = Print;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter("No.", Rec."No.");
                    Rec.SetFilter("Sell-to Customer No.", Rec."Sell-to Customer No.");
                    Report.RunModal(50171, true, true, Rec);
                end;
            }
            action("Custom Invoice")
            {
                ApplicationArea = all;
                Caption = 'Custom Invoice';
                ToolTip = 'Custom Invoice';
                Image = Print;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter("No.", Rec."No.");
                    Rec.SetFilter("Sell-to Customer No.", Rec."Sell-to Customer No.");
                    Report.RunModal(50176, true, true, Rec);
                end;
            }
        }

        addlast(Promoted)
        {
            actionref(SalesProFormalInvoice_Promoted; "Sales Pro Formal Invoice")
            {
            }
        }
        addfirst(Category_Category11)
        {
            actionref(PrintProFormalInvoice_Promoted; "Print Pro Formal Invoice")
            {
            }
            actionref(CustomInvoice_Promoted; "Custom Invoice")
            {
            }
        }
    }
}
