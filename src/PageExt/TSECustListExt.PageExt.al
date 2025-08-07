pageextension 50170 "TSE Cust List Ext." extends "Customer List"
{
    actions
    {
        addafter("&Customer")
        {
            group(query1)
            {
                action("Download JSON")
                {
                    ApplicationArea = all;
                    ToolTip = 'Download JSON';
                    Image = Download;
                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        TopCustReview: Query "TSE Top Cust Overview";
                        Otstream: OutStream;
                        Istream: InStream;
                        FileName: Text;
                    begin
                        FileName := 'Top Customer Overview.json';
                        TempBlob.CreateOutStream(Otstream);
                        TopCustReview.SaveAsJson(Otstream);
                        TempBlob.CreateInStream(Istream);
                        DownloadFromStream(Istream, '', '', '', FileName)
                    end;
                }

                action("Download CSV")
                {
                    ApplicationArea = all;
                    ToolTip = 'Download CSV';
                    Image = Download;
                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        TopCustReview: Query "TSE Top Cust Overview";
                        Otstream: OutStream;
                        Istream: InStream;
                        FileName: Text;
                    begin
                        FileName := 'Top Customer Overview.csv';
                        TempBlob.CreateOutStream(Otstream);
                        TopCustReview.SaveAsCsv(Otstream);
                        TempBlob.CreateInStream(Istream);
                        DownloadFromStream(Istream, '', '', '', FileName)
                    end;
                }
                action("Download XML")
                {
                    ApplicationArea = all;
                    ToolTip = 'Download XML';
                    Image = Download;
                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        TopCustReview: Query "TSE Top Cust Overview";
                        Otstream: OutStream;
                        Istream: InStream;
                        FileName: Text;
                    begin
                        FileName := 'Top Customer Overview.xml';
                        TempBlob.CreateOutStream(Otstream);
                        TopCustReview.SaveAsXml(Otstream);
                        TempBlob.CreateInStream(Istream);
                        DownloadFromStream(Istream, '', '', '', FileName)
                    end;
                }

                action("Top Customer")
                {
                    ApplicationArea = all;
                    ToolTip = 'Top Customer';
                    Image = Action;
                    RunObject = codeunit "TSE Top Cust Review Mgt.";
                }
                action("Column Captions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Column Captions';
                    Image = Info;
                    trigger OnAction()
                    var
                        CustomerQuery: Query "TSE Top Cust Overview";
                        ColumnCaption1: Text;
                    begin
                        ColumnCaption1 := CustomerQuery.ColumnCaption(No);
                        Message('Column Caption: %1', ColumnCaption1);
                    end;
                }
                action("Column Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Column Name';
                    Image = Info;
                    trigger OnAction()
                    var
                        CustomerQuery: Query "TSE Top Cust Overview";
                        ColumnName: Text;
                    begin
                        ColumnName := CustomerQuery.ColumnName(No);
                        Message('Column Name: %1', ColumnName);
                    end;
                }
                action("Column No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Column No';
                    Image = Info;
                    trigger OnAction()
                    var
                        CustomerQuery: Query "TSE Top Cust Overview";
                        ColumnNo1: Integer;
                    begin
                        ColumnNo1 := CustomerQuery.ColumnNo(Name);
                        Message('Column No: %1', ColumnNo1);
                    end;
                }

            }
            group(XML)
            {
                action("Import")
                {
                    ApplicationArea = all;
                    Image = Import;
                    ToolTip = 'Import';
                    RunObject = xmlport "TSE Customer List Import";
                }
                action("Export")
                {
                    ApplicationArea = all;
                    Image = Export;
                    ToolTip = 'Export';
                    RunObject = xmlport "TSE Customer Export";
                    // trigger OnAction()
                    // begin
                    //     Xmlport.Run(50159, true , false);
                    // end;
                }
                action("Export Inventory")
                {
                    ApplicationArea = all;
                    Image = Export;
                    ToolTip = 'Export Inventory';
                    RunObject = xmlport "TSE Customer to Inventory";
                }

            }
        }
        addlast(Promoted)
        {
            group(Query)
            {
                actionref(DownloadJSON_Promoted; "Download JSON")
                {
                }
                actionref(DownloadCSV; "Download CSV")
                {
                }
                actionref(DownloadXML_promoted; "Download XML")
                {
                }
                actionref(TopCustomer_promoted; "Top Customer")
                {
                }

            }
            group(XMLPort)
            {
                actionref(Import_Promoted; Import)
                {
                }
                actionref(Export_promoted; Export)
                {
                }
                actionref(ExportInventory_promoted; "Export Inventory")
                {
                }

            }
        }
    }
}
