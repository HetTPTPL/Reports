xmlport 50153 "TSE Xml Port Import by XML 2"
{
    Caption = 'TSE Xml Port by XML Element';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(TSEXmlPort; "TSE Xml Port")
            {
                fieldelement(No; TSEXmlPort."No.")
                {
                }
                fieldelement(Description; TSEXmlPort.Description)
                {
                }
                fieldelement(Amount; TSEXmlPort.Amount)
                {
                }
            }
        }
    }
}
