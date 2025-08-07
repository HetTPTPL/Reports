report 50150 "TSE Customer Report"
{
    ApplicationArea = All;
    Caption = 'TSE Customer Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Word;
    // AdditionalSearchTerms = 'Balance Doc';
    // WordLayout = 'Customer Report.docx';
    // DefaultLayout = Word;
    // ShowPrintStatus = false;
    // UseRequestPage = false;

    dataset
    {
        dataitem(Customer; Customer)
        {
            // PrintOnlyIfDetail = true;
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Contact; Contact)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(SalesLCY; "Sales (LCY)")
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
        layout(Word)
        {
            Type = Word;
            LayoutFile = 'Customer Report.docx';
        }
    }
}
