report 50159 "TSE Customer Multiple Tables"
{
    ApplicationArea = All;
    Caption = 'TSE Customer Multiple Tables';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";

            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Address; Address)
            {
                IncludeCaption = true;
            }
            column(EMail; "E-Mail")
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName)
            {
            }
            column(CustLbl; CustLbl)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                column(EntryNo_CustLedgerEntry; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(CustomerNo_CustLedgerEntry; "Customer No.")
                {
                    IncludeCaption = true;
                }
                column(PostingDate_CustLedgerEntry; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(DocumentNo_CustLedgerEntry; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(DocumentType_CustLedgerEntry; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(Description_CustLedgerEntry; Description)
                {
                    IncludeCaption = true;
                }
                column(CurrencyCode_CustLedgerEntry; "Currency Code")
                {
                    IncludeCaption = true;
                }
                column(Amount_CustLedgerEntry; Amount)
                {
                    IncludeCaption = true;
                }
                column(OriginalAmtLCY_CustLedgerEntry; "Original Amt. (LCY)")
                {
                    IncludeCaption = true;
                }
                column(RemainingAmtLCY_CustLedgerEntry; "Remaining Amt. (LCY)")
                {
                    IncludeCaption = true;
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Cust. Ledger Entry No." = field("Entry No."), "Customer No." = field("Customer No.");
                    column(EntryNo_DetailedCustLedgEntry; "Entry No.")
                    {
                        IncludeCaption = true;
                    }
                    column(EntryType_DetailedCustLedgEntry; "Entry Type")
                    {
                        IncludeCaption = true;
                    }
                    column(PostingDate_DetailedCustLedgEntry; "Posting Date")
                    {
                        IncludeCaption = true;
                    }
                    column(DocumentType_DetailedCustLedgEntry; "Document Type")
                    {
                        IncludeCaption = true;
                    }
                    column(DocumentNo_DetailedCustLedgEntry; "Document No.")
                    {
                        IncludeCaption = true;
                    }
                    column(AmountLCY_DetailedCustLedgEntry; "Amount (LCY)")
                    {
                        IncludeCaption = true;
                    }
                    column(TransactionNo_DetailedCustLedgEntry; "Transaction No.")
                    {
                        IncludeCaption = true;
                    }
                    column(JournalBatchName_DetailedCustLedgEntry; "Journal Batch Name")
                    {
                        IncludeCaption = true;
                    }
                    column(DebitAmountLCY_DetailedCustLedgEntry; "Debit Amount (LCY)")
                    {
                        IncludeCaption = true;
                    }
                    column(CreditAmountLCY_DetailedCustLedgEntry; "Credit Amount (LCY)")
                    {
                        IncludeCaption = true;
                    }

                }
            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = field("No.");
                column(Document_Type_SalesHeader; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(No_SalesHeader; "No.")
                {
                    IncludeCaption = true;
                }
                column(Posting_Date_SalesHeader; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(Prices_Including_VAT_SalesHeader; "Prices Including VAT")
                {
                    IncludeCaption = true;
                }
                column(Amount_SalesHeader; Amount)
                {
                    IncludeCaption = true;
                }
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
            LayoutFile = './src/Layouts/Layout50159_MultipleTables.RDL';
        }
    }


    var
        CustLbl: Label 'Customer & Detailed Customer Ledger Report';
}
