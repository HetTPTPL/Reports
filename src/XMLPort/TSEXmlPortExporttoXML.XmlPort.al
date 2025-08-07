xmlport 50151 "TSE Xml Port Export to XML"
{
    Caption = 'TSE Xml Port Export to XML';
    Format = Xml;
    // TransactionType = Snapshot;
    // PreserveWhiteSpace = true;
    // UseDefaultNamespace = true;
    // DefaultNamespace = 'urn:microsoft-dynamics-nav/xmlports/x100';
    // UseLax = true;
    // Direction = Export;
    // UseRequestPage = false;


    schema
    {
        textelement(XmlFormatExport)
        {
            // TextType = BigText;
            
            tableelement(TSEXmlPort; "TSE Xml Port")
            {
                // XmlName = 'CreditNote';
                // Unbound = true;
                fieldelement(SystemId; TSEXmlPort.SystemId)
                {
                }
                textelement(General)
                {
                    // TextType = BigText;
                    fieldelement(No; TSEXmlPort."No.")
                    {
                        fieldattribute(Description; TSEXmlPort.Description)
                        {
                            Occurrence = Optional;
                        }
                    }
                    fieldelement(Amount; TSEXmlPort.Amount)
                    {
                    }
                }
                textelement(Logs)
                {
                    fieldelement(DateInserted; TSEXmlPort."Date Inserted")
                    {
                    }
                    fieldelement(InsertedBy; TSEXmlPort."Inserted By")
                    {
                    }
                }
            }
        }
    }
}

