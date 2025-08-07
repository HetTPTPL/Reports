namespace Task.Task;

using Microsoft.Sales.Customer;

xmlport 50157 "TSE Customer List Import"
{
    Caption = 'TSE Customer List Import';
    Format = VariableText;

    schema
    {
        textelement(CustomerImport)
        {
            tableelement(customer; customer)
            {

                fieldelement(No; customer."No.")
                {
                }
                fieldelement(Name; customer.Name)
                {
                }
                fieldelement(LocationCode; customer."Location Code")
                {
                }
                fieldelement(Contact; customer.Contact)
                {
                }
                fieldelement(BalanceLCY; customer."Balance (LCY)")
                {
                }
                fieldelement(BalanceDueLCY; customer."Balance Due (LCY)")
                {
                }
                fieldelement(SalesLCY; customer."Sales (LCY)")
                {
                }
                fieldelement(PaymentsLCY; customer."Payments (LCY)")
                {
                }
                trigger OnBeforeInsertRecord()
                begin
                    if customer.Name = '' then
                        Error('Customer can not be Empty');
                end;
            }
        }
    }
}