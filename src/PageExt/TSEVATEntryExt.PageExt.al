pageextension 50174 "TSE VAT Entry Ext" extends "VAT Entries"
{
    actions
    {
        addlast(processing)
        {
            action("Export List")
            {
                ApplicationArea = all;
                Image = Export;
                ToolTip = 'Export List';
                RunObject = xmlport "TSE VAT Entry";
            }
            
        }

        addlast(Promoted)
        {
            actionref(Export_promoted; "Export List")
            {
            }
        }
    }
}
