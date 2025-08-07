pageextension 50164 "TSE Vend Ledg Entry Ext" extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Vendor Name")
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
            action(Export)
            {
                ApplicationArea = all;
                Image = Export;
                ToolTip = 'Export';
                RunObject = xmlport "TSE Detail Vendor Ledger Entry";
            }
        }
    }    
}
