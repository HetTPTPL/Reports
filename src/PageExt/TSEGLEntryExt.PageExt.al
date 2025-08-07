namespace Task.Task;

using Microsoft.Finance.GeneralLedger.Ledger;

pageextension 50168 "TSE G/L Entry Ext" extends "General Ledger Entries"
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
