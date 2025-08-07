namespace Task.Task;

using Microsoft.Bank.BankAccount;
using Microsoft.Foundation.Address;

query 50161 "TSE Bank Account by Country"
{
    Caption = 'TSE Bank Account by Country';
    QueryType = Normal;
    QueryCategory = 'Bank Account List';
    
    elements
    {
        dataitem(BankAccount; "Bank Account")
        {
            column(No; "No.")
            {
            }
            column(BankAccName; Name)
            {
            }
            column(BankBranchNo; "Bank Branch No.")
            {
            }
            column(BankAccountNo; "Bank Account No.")
            {
            }
            column(Address; Address)
            {
            }
            column(Contact; Contact)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            dataitem(Country_Region;"Country/Region")
            {
                DataItemLink = Code = BankAccount."Country/Region Code";
                column(Name;Name)
                {
                }
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    
    end;
}
