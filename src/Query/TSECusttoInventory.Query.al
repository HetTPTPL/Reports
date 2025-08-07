namespace Task.Task;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;

query 50162 "TSE Cust to Inventory"
{
    Caption = 'TSE Cust to Inventory';
    QueryType = Normal;
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(City; City)
            {
            }
            // dataitem(Sales_Header; "Sales Header")
            // {
            //     DataItemLink = "Sell-to Customer No." = Customer."No.";
            //     column(Sell_to_Contact; "Sell-to Contact")
            //     {
            //     }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                column(No_; "No.")
                {
                }
                column(Document_Type; "Document Type")
                {
                    ColumnFilter = Document_Type = filter('Order');
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                    // Method = Sum;
                }
                column(Line_Amount; "Line Amount")
                {
                }
                dataitem(Item; Item)
                {
                    DataItemLink = "No." = Sales_Line."No.";
                    column(Inventory; Inventory)
                    {
                    }
                }
            }
        }
    }
}

    

