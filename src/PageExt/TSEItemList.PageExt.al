pageextension 50171 "TSE Item List" extends "Item List"
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
                RunObject = xmlport "TSE Item Export Xml Port";
            }
            action("Import")
            {
                ApplicationArea = all;
                Image = Import;
                ToolTip = 'Import';
                RunObject = xmlport "TSE Item Import Xml Port";
            }
        }

        addlast(Promoted)
        {
            actionref(Export_promoted; "Export List")
            {
            }
            actionref(Import_promoted; Import)
            {
            }
        }
    }
}
