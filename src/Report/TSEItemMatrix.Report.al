report 50157 "TSE Item Matrix"
{
    ApplicationArea = All;
    Caption = 'TSE Item Matrix';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(Profit__; "Profit %")
            {
                DecimalPlaces = 0 : 2;
            }
            column(Type_Item; "Type")
            {
            }
            column(UnitPrice_Item; "Unit Price")
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(ItemReportLbl; ItemReportLbl)
            {
            }
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
            LayoutFile = './src/Layouts/Layout50157_Item.RDL';
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        ItemReportLbl: Label 'Item Report';
}
