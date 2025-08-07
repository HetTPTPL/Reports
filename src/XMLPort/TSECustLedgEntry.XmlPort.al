xmlport 50160 "TSE Cust.Ledg. Entry"
{
    Caption = 'TSE Cust.Ledg. Entry';
    Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    TableSeparator = '';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Integer;Integer)
            {
                SourceTableView = sorting(Number) where(Number = const(1));
                textelement(CustNo)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustNo := CustLedgerEntry.FieldCaption("Customer No.");
                    end;
                }
                textelement(CustName)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustName := CustLedgerEntry.FieldCaption("Customer Name");
                    end;
                }
                textelement(CustDocNo)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustDocNo := CustLedgerEntry.FieldCaption("Document No.");
                    end;
                }
                textelement(CustDesc)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustDesc := CustLedgerEntry.FieldCaption("Description");
                    end;
                }
                textelement(CustAmt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustAmt := CustLedgerEntry.FieldCaption("Amount (LCY)");
                    end;
                }
                textelement(CustBalance)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustBalance := Customer.FieldCaption("Balance (LCY)");
                    end;
                }
            }
            tableelement(CustLedgerEntry; "Cust. Ledger Entry")
            {
                fieldelement(CustomerNo; CustLedgerEntry."Customer No.")
                {
                }
                fieldelement(CustomerName; CustLedgerEntry."Customer Name")
                {
                }
                fieldelement(DocumentNo; CustLedgerEntry."Document No.")
                {
                }
                fieldelement(Description; CustLedgerEntry.Description)
                {
                }
                fieldelement(AmountLCY; CustLedgerEntry."Amount (LCY)")
                {
                }
                tableelement(Customer;Customer)
                {
                    LinkTable = CustLedgerEntry;
                    LinkFields = "No." = field("Customer No.");

                    fieldelement(BalanceLCY; Customer."Balance (LCY)")
                    {
                    }
                }
            }    
        }
    }
}
