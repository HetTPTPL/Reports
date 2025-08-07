query 50157 "TSE Sales Line By Inventory"
{
    Caption = 'TSE Sales Line By Inventory';
    QueryType = Normal;
    QueryCategory = 'Sales Order List';

    elements
    {
        dataitem(SalesLine; "Sales Line")
        {
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column("Type"; "Type")
            {
            }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = SalesLine."No.";
                column(Inventory;Inventory)
                {
                    Method = Sum;
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
