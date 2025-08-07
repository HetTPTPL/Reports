report 50161 "TSE Top Customer By Query"
{
    ApplicationArea = All;
    Caption = 'TSE Top Customer By Query';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Word;

    dataset
    {
        dataitem(Integer; "Integer")
        {
            column(Number; Number)
            {
            }
            column(CustNo; CustNo)
            {
            }
            column(CustName; CustName)
            {
            }
            column(CustCity; CustCity)
            {
            }
            column(CustSales; CustSales)
            {
            }
            column(TopLbl; TopLbl)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(UserID; UserId)
            {
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TopN);
                TopNCust.TopNumberOfRows(TopN);
                TopNCust.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if TopNCust.Read() then begin
                    CustNo := TopNCust.No;
                    CustName := TopNCust.Name;
                    CustCity := TopNCust.City;
                    CustSales := TopNCust.Sales_LCY;
                end
                else
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(TopN; TopN)
                    {
                        Caption = 'Top Record which you like to generate';
                        ToolTip = 'Top Record which you like to generate';
                        ApplicationArea = all;
                    }
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
        layout(Word)
        {
            Type = Word;
            LayoutFile = './src/Layouts/Layout50161_TopCustusingQurey.docx';
        }
    }

    trigger OnInitReport()
    begin
        TopN := 5;
    end;

    var
        TopNCust: Query "Top Customer Overview";
        TopN: Integer;
        TopLbl: Label 'Top Customer Report';
        CustNo: Code[20];
        CustName: Text[100];
        CustCity: Text[30];
        CustSales: Decimal;
}
