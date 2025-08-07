xmlport 50152 "TSE Xml Port Import By Xml"
{
    Caption = 'TSE Xml Port Import By Xml';
    schema
    {
        textelement(ImportByXml)
        {
            tableelement(TSEXmlPort; "TSE Xml Port")
            {
                fieldattribute(No; TSEXmlPort."No.")
                {
                }
                fieldattribute(Description; TSEXmlPort.Description)
                {
                }
                fieldattribute(Amount; TSEXmlPort.Amount)
                {
                }
            }
        }
    }

}
