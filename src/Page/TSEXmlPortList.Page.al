page 50154 "TSE Xml Port List"
{
    ApplicationArea = All;
    Caption = 'TSE Xml Port List';
    PageType = List;
    SourceTable = "TSE Xml Port";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Date Inserted"; Rec."Date Inserted")
                {
                    ToolTip = 'Specifies the value of the Date Inserted field.', Comment = '%';
                }
                field("Inserted By"; Rec."Inserted By")
                {
                    ToolTip = 'Specifies the value of the Inserted By field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Import/Export")
            {
                ApplicationArea = all;
                ToolTip = 'Import/Export';
                Image = Import;
                RunObject = xmlport "TSE Xml Port";
            }
            action("Export XML")
            {
                ApplicationArea = all;
                ToolTip = 'Export XML';
                Image = Export;
                RunObject = xmlport "TSE Xml Port Export to XML";
            }
            action("Import from XML")
            {
                ApplicationArea = all;
                ToolTip = 'Export from XML';
                Image = Import;
                RunObject = xmlport "TSE Xml Port Import By Xml";
            }
            action("Import from XML 2")
            {
                ApplicationArea = all;
                ToolTip = 'Export from XML 2';
                Image = Import;
                RunObject = xmlport "TSE Xml Port Import by XML 2";
            }
            action("Import/Export by Fixed")
            {
                ApplicationArea = all;
                ToolTip = 'Import/Export by Fixed';
                Image = Import;
                RunObject = xmlport "TSE Xml Port Fixed Text";
            }

        }
        area(Promoted)
        {
            actionref(Import_Promoted; "Import/Export")
            {   
            }
            actionref(Export_promoted; "Export XML")
            {
            }
            actionref(ImportXML_promoted; "Import from XML")
            {
            }
            actionref(ImportXML2_promoted; "Import from XML 2")
            {
            }
            actionref(ImportExport_promoted; "Import/Export by Fixed")
            {
            }
        }
    }
}
