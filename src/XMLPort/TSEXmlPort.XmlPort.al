xmlport 50150 "TSE Xml Port"
{
    Caption = 'TSE Xml Port';
    Format = VariableText;
    // RecordSeparator = ',';
    // Direction = Import;
    // TableSeparator = ':';
    // TextEncoding = UTF16;
    

    schema
    {
        textelement(XmlPort)
        {
            NamespacePrefix = 'TSE';
            tableelement(TSEXmlPort; "TSE Xml Port")
            {
                AutoSave = true;
                AutoUpdate = true;
                RequestFilterFields = "No.",Amount;
                RequestFilterHeading = 'Enter the Filters';
                SourceTableView = order(descending);


                fieldelement(No; TSEXmlPort."No.")
                {
                    // trigger OnAfterAssignField()
                    // begin
                    //     Message('Field Assigned!!');
                    // end;
                    // trigger OnBeforePassField()
                    // begin
                    //     Message('Field Pass!!');
                    // end;
                }
                fieldelement(Description; TSEXmlPort.Description)
                {
                    // MinOccurs = Once;
                    // MaxOccurs = Once;
                }
                fieldelement(Amount; TSEXmlPort.Amount)
                {
                    // FieldValidate = Yes;
                }

                // trigger OnAfterInitRecord()
                // begin
                //     Message('After Init Record!!');
                // end;

                // trigger OnBeforeInsertRecord()
                // begin
                //     Message('Before Insert Record!!');
                // end;

                // trigger OnAfterInsertRecord()
                // begin
                //     Message('After Insert Record!!');
                // end;

                // trigger OnBeforeModifyRecord()
                // begin
                //     Message('Before Modify Record!!');
                // end;

                // trigger OnAfterModifyRecord()
                // begin
                //     Message('After Modify Record!!');
                // end;

                // trigger OnPreXmlItem()
                // begin
                //     Message('Pre Xml Item!!');
                // end;

                // trigger OnAfterGetRecord()
                // begin
                //     Message('After Get Record!!');
                // end;
            }

            // trigger OnAfterAssignVariable()
            // begin
            //     Message('Variable Assign!!');
            // end;

            // trigger OnBeforePassVariable()
            // begin
            //     Message('Variable Passed!!');
            // end;
        }
    }

    // trigger OnInitXmlPort()
    // begin
    //     Message('Init Xml Port!!');
    // end;

    // trigger OnPreXmlPort()
    // begin
    //     Message('Pre Xml Port!!');
    // end;

    // trigger OnPostXmlPort()
    // begin
    //     Message('Post Xml Port!!');
    // end;
}


