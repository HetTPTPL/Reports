report 50178 "Clean Ten. Med. Thumb. Batch"
{
    ApplicationArea = All;
    Caption = 'Clean Tenant Media Thumbnails Batch';
    UsageCategory = Administration;
    ProcessingOnly = true;
    Permissions = tabledata "Tenant Media Thumbnails" = RD;
    UseRequestPage = true;

    dataset
    {
        dataitem(TenantMediaThumbnails; "Tenant Media Thumbnails")
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
                    field(CompanyName_Filter; CompName)
                    {
                        ApplicationArea = All;
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
            Error('Company Name must be Selected.');

        if Date = 0D then
            Error('Date must be Selected.');
        StartDateTime := CreateDateTime(Date, 000000T);
        EndDateTime := CreateDateTime(Date, 235959T);
    end;

    var
        CompName: Text;
        Date: Date;
        StartDateTime: DateTime;
        EndDateTime: DateTime;
}
