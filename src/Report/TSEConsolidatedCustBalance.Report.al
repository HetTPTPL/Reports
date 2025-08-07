report 50173 "TSE Consolidated Cust Balance"
{
    ApplicationArea = All;
    Caption = 'TSE Consolidated Cust Balance';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;
    dataset
    {
        dataitem(TSEConsolidatedCustBalance; "TSE Consolidated Cust Balance")
        {
            column(Entry_No_; "Entry No.")
            {
            }
            column(CompanyName; "Company Name")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
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
            column(CustomerBalance; "Customer Balance")
            {
            }
            column(Amount; Amount)
            {
            }
            column(RemainingAmount; "Remaining Amount")
            {
            }
            column(PostingGroup_TSEConsolidatedCustBalance; "Posting Group")
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
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
                group(Filter)
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = all;
                        ToolTip = 'Enter the start start date';
                        Caption = 'From Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = all;
                        ToolTip = 'Enter the start end date';
                        Caption = 'To Date';
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
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50173_ConsolidatedCustBalance.rdl';
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
    begin
        GetDataFromAllCompanies();
    end;

    local procedure GetDataFromAllCompanies()
    var
        Companies: Record Company;
        Cust: Record Customer;
        CustLedg: Record "Cust. Ledger Entry";
        TempRec: Record "TSE Consolidated Cust Balance" temporary;
    begin
        if Companies.FindSet() then
            repeat
                Cust.ChangeCompany(Companies.Name);
                CustLedg.ChangeCompany(Companies.Name);

                if Cust.FindSet() then
                    repeat
                        Cust.CalcFields("Balance (LCY)");
                        CustLedg.SetRange("Customer No.", Cust."No.");

                        if CustLedg.FindSet() then
                            repeat
                                CustLedg.CalcFields("Remaining Amount", Amount);
                                if (StartDate <> 0D) and (EndDate <> 0D) then
                                    CustLedg.SetRange("Posting Date", StartDate, EndDate);

                                TempRec.Init();
                                TempRec."Entry No." := CustLedg."Entry No.";
                                TempRec."Company Name" := Companies.Name;
                                TempRec."Customer No." := Cust."No.";
                                TempRec."Customer Name" := Cust.Name;
                                TempRec."Posting Group" := Cust."Customer Posting Group";
                                TempRec."Posting Date" := CustLedg."Posting Date";
                                TempRec."Document Type" := CustLedg."Document Type";
                                TempRec."Document No." := CustLedg."Document No.";
                                TempRec."Amount" := CustLedg.Amount;
                                TempRec."Remaining Amount" := CustLedg."Remaining Amount";
                                TempRec."Customer Balance" := Cust."Balance (LCY)";
                                TempRec.Insert();
                            until CustLedg.Next() = 0;
                    until Cust.Next() = 0;
            until Companies.Next() = 0;

        // Transfer data from TempRec to the actual dataset
        TempRec.FindSet();
        repeat
            TSEConsolidatedCustBalance.Copy(TempRec);
            TSEConsolidatedCustBalance.Insert();

        until TempRec.Next() = 0;
    end;

    var
        StartDate: Date;
        EndDate: Date;
}
