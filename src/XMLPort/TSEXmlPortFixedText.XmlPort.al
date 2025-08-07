namespace Task.Task;

xmlport 50154 "TSE Xml Port Fixed Text"
{
    Caption = 'TSE Xml Port Fixed Text';
    Format = FixedText;
    Direction = Both;
    FileName = 'Hello.txt';


    schema
    {
        textelement(FixedText)
        {

            tableelement(TSEXmlPort; "TSE Xml Port")
            {
                AutoUpdate = true;
                AutoReplace = true;

                fieldelement(No; TSEXmlPort."No.")
                {
                    Width = 20;
                }
                fieldelement(Description; TSEXmlPort.Description)
                {
                    Width = 100;
                }
                fieldelement(Amount; TSEXmlPort.Amount)
                {
                    Width = 20;
                }
            }
        }
    }
}
