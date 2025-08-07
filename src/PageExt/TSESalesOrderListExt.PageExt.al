pageextension 50172 "TSE Sales Order List Ext" extends "Sales Order List"
{
    actions
    {
        addlast(processing)
        {
            action(Export)
            {
                ApplicationArea = all;
                Image = Export;
                ToolTip = 'Export';
                RunObject = xmlport "TSE Sales Order Export";
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
                    Rec.Reset();
                    Rec.SetRange("Document Type", Rec."Document Type");
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
                    Rec.Reset();
                    Rec.SetRange("Document Type", Rec."Document Type");
                end;
            }
        }

        addlast(Promoted)
        {
            actionref(Export_promoted; Export)
            {
            }
        }
        addfirst(Category_Category8)
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
