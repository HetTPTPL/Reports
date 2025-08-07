namespace Task.Task;

using Microsoft.Finance.GeneralLedger.Ledger;

report 50175 "TSE G/L Register"
{
    ApplicationArea = All;
    Caption = 'TSE G/L Register';
    UsageCategory = ReportsAndAnalysis;

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
}
