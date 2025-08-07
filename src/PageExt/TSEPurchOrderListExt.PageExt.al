pageextension 50173 "TSE Purch Order List Ext" extends "Purchase Order List"
{
    actions
    {
        addlast(processing)
        {
            action("Export")
            {
                ApplicationArea = all;
                Image = Export;
                ToolTip = 'Export';
                RunObject = xmlport "TSE Purchase Order";
            }
        }

        addlast(Promoted)
        {
            actionref(Export_promoted; "Export")
            {
            }
        }
    }
}
