report 50177 "Clean Tenant Media Batch"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Clean Tenant Media Batch';
    ProcessingOnly = true;
    Permissions = tabledata "Tenant Media" = RD;
    UseRequestPage = true;

    dataset
    {
        dataitem(TenantMedia; "Tenant Media")
        {
            DataItemTableView = sorting(ID);

            trigger OnPreDataItem()
            begin
                SetRange("Company Name", CompName);
                SetRange(SystemCreatedAt, StartDateTime, EndDateTime);
            end;

            trigger OnAfterGetRecord()
            begin
                Delete();
                Commit();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Option)
                {
                    field(CompName_Filter; CompName)
                    {
                        ApplicationArea = all;
                        Caption = 'Company Name';
                        ToolTip = 'Enter the name of the company to filter the report.';
                        TableRelation = System.Environment.Company.Name;
                    }
                    field(Date_Filter; Date)
                    {
                        ApplicationArea = all;
                        Caption = 'Date';
                        ToolTip = 'Enter the date to filter the report.';
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

    trigger OnPreReport()
    begin
        if CompName = '' then
            Error('Company Name must be selected.');

        if Date = 0D then
            Error('Date must be selected.');

        StartDateTime := CreateDateTime(Date, 000000T);
        EndDateTime := CreateDateTime(Date, 235959T);
    end;

    var
        CompName: Text;
        Date: Date;
        StartDateTime: DateTime;
        EndDateTime: DateTime;

}
