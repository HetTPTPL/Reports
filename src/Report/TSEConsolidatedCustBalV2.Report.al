report 50174 "TSE Consolidated Cust Bal V2"
{
    ApplicationArea = All;
    Caption = 'TSE Consolidated Cust Bal V2';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(CompanyLoop; Company)
        {
            DataItemTableView = sorting(Name);

            column(Name; Name)
            {
            }

            dataitem(Customer; Customer)
            {
                RequestFilterFields = "No.";
                DataItemTableView = SORTING("No.");
                column(CustomerNo; "No.")
                {
                }
                column(CustomerName; Name)
                {
                }
                column(CustomerPostingGroup; "Customer Posting Group")
                {
                }
                column(CustomerBalance; "Balance")
                {
                }
                column(AppliedFilterCust; AppliedFilterCust)
                {
                }


                dataitem(CustLedgerEntry; "Cust. Ledger Entry")
                {
                    DataItemLink = "Customer No." = field("No.");
                    column(Entry_No_; "Entry No.")
                    {
                    }
                    column(PostingDate; "Posting Date")
                    {
                    }
                    column(DocumentType; "Document Type")
                    {
                    }
                    column(DocumentNo; "Document No.")
                    {
                    }
                    column(Amount; Amount)
                    {
                    }
                    column(Remaining_Amount; "Remaining Amount")
                    {
                    }
                    column(AppliedFilterCLE; AppliedFilterCLE)
                    {
                    }
                    column(DateFilter;DateFilter)
                    {
                    }
                    column(StartDate; StartDate)
                    {
                    }
                    column(EndDate; EndDate)
                    {
                    }
                    
                    trigger OnPreDataItem()
                    begin
                        ChangeCompany(CompanyLoop.Name); // Change context to current company
                        if (StartDate <> 0D) and (EndDate <> 0D) then begin
                            SetRange("Posting Date", StartDate, EndDate);
                            DateFilter := 'Posting Date: ' + Format(StartDate) + ' - ' + Format(EndDate);
                        end
                        else
                        DateFilter := '';
                    end;
                }
                trigger OnPreDataItem()
                begin
                    ChangeCompany(CompanyLoop.Name); // Change context to current company
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Filter")
                {
                    field(StartDate_filter; StartDate)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Enter the start date';
                        Caption = 'From Date';
                    }
                    field(EndDate_filter; EndDate)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Enter the end date';
                        Caption = 'To Date';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50174_ConsolidatedCustBalance_v2.rdl';
        }
    }

    labels
    {
        Report_Lbl = 'Consolidated Customer Balance';
        CustNo_Lbl = 'Customer No.';
        CustName_Lbl = 'Customer Name';
        PostingGrp_Lbl = 'Posting Group';
        Balance_Lbl = 'Balance';
        PostingDate_Lbl = 'Posting Date';
        DocType_Lbl = 'Document Type';
        DocumentNo_Lbl = 'Document No.';
        Amt_Lbl = 'Amount';
        RemainingAmt_Lbl = 'Remaining Amount';
        CompanyBalance_Lbl = 'Company wise Customer Balance';
        ReportFilter_Lbl = 'Report Filter - ';
        DateFilter_Lbl = 'Date Filter: ';
    }

    trigger OnPreReport()
    var
        LocalFormatDocument: Codeunit "Format Document";
    begin
        AppliedFilterCLE := LocalFormatDocument.GetRecordFiltersWithCaptions(CustLedgerEntry);
        AppliedFilterCust := LocalFormatDocument.GetRecordFiltersWithCaptions(Customer);
    end;

    var
        StartDate: Date;
        EndDate: Date;
        AppliedFilterCLE: Text;
        AppliedFilterCust: Text;
        DateFilter: Text;

}
