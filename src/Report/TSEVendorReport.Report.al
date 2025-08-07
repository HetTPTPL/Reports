report 50151 "TSE Vendor Report"
{
    ApplicationArea = All;
    Caption = 'TSE Vendor Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Excel;
    // ExecutionTimeout = '00:00:30';
    // MaximumDatasetSize = 5;
    // PreviewMode = PrintLayout;
    // ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            // MaxIteration = 1;
            // RequestFilterFields = "No.","Balance (LCY)","Payments (LCY)";
            // RequestFilterHeading = 'Vendor Report';

            column(No_Vendor; "No.")
            {
                // IncludeCaption = true;
            }
            column(Name_Vendor; Name)
            {
            }
            column(Contact_Vendor; Contact)
            {
            }
            column(BalanceLCY_Vendor; "Balance (LCY)")
            {
            }
            column(PaymentsLCY_Vendor; "Payments (LCY)")
            {
            }

            // trigger OnPreDataItem()
            // begin
            //     Message('Under Process of dataitem!!');
            // end;

            // trigger OnAfterGetRecord()
            // begin
            //     Message('Record Found');
            // end;

            // trigger OnPostDataItem()
            // begin
            //     Message('Process Completed of DataItem!!');
            // end;
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

        trigger OnInit()
        begin
            Message('Initialized!!');
        end;
        trigger OnOpenPage()
        begin
            Message('Page Opened!!');
        end;
        trigger OnAfterGetRecord()
        begin
            Message('Record Got!!');
        end;
        trigger OnAfterGetCurrRecord()
        begin
            Message('After getting Current Record!!');
        end;
    }

    rendering
    {
        layout(Excel)
        {
            Type = Excel;
            LayoutFile = './src/Layouts/Layout50151_VendorReport.xlsx';
        }
    }

    // trigger OnInitReport()
    // begin
    //     Message('Report Initialized!!');
    // end;

    // trigger OnPreReport()
    // begin
    //     Message('Under Process!!');
    // end;

    // trigger OnPostReport()
    // begin
    //     Message('Process Completed!!');
    // end;
}
