namespace Task.Task;

using Microsoft.Sales.Document;

query 50155 "TSE Sales Order By Quantity"
{
    Caption = 'TSE Sales Order By Quantity';
    QueryType = Normal;
    QueryCategory = 'Sales Order List';
    OrderBy = descending(SelltoCustomerNo);

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No; "No.")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(SelltoAddress; "Sell-to Address")
            {
            }
            column(SelltoEMail; "Sell-to E-Mail")
            {
            }
            column(SelltoContact; "Sell-to Contact")
            {
            }
            column(SelltoContactNo; "Sell-to Contact No.")
            {
            }
            column(SelltoCity; "Sell-to City")
            {
            }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = SalesHeader."Sell-to Customer No.";
                column(No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                    Method = Sum;
                }
                column(Amount; Amount)
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
