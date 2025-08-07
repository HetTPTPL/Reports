pageextension 50157 TSECustLedgEntryExt extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer Name")
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
            action(Export)
            {
                ApplicationArea = all;
                Image = Export;
                ToolTip = 'Export';
                RunObject = xmlport "TSE Cust.Ledg. Entry";
            }
        }
    }
}