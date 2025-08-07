report 50152 "TSE Item Report"
{
    ApplicationArea = All;
    Caption = 'TSE Item Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(Profit; "Profit %")
            {
            }
            column(UnitCost; "Unit Cost")
            {
            }
            column(BarCode;EnocodedText)
            {
            }
            trigger OnAfterGetRecord()
            var
                BarcodeString : Text;
                BarcodeSymbology : Enum "Barcode Symbology 2D";
                BarcodeFontProvider : Interface "Barcode Font Provider 2D";
            begin
                BarcodeFontProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarcodeSymbology := Enum::"Barcode Symbology 2D"::"QR-Code";
                BarcodeString := "No.";
                EnocodedText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50152_ItemReport.RDL';
        }
    }

    var
        EnocodedText: Text;
}
