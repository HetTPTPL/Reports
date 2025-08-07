xmlport 50158 "TSE Sales Order Export"
{
    Caption = 'TSE Sales Order Export';
    Direction = Export;
    UseRequestPage = false;

    schema
    {
        textelement(SalesOrderExport)
        {
            tableelement(SalesHeader; "Sales Header")
            {
                fieldelement(No; SalesHeader."No.")
                {
                }
                fieldelement(SelltoCustomerNo; SalesHeader."Sell-to Customer No.")
                {
                }
                fieldelement(CustomerName; SalesHeader."Sell-to Customer Name")
                {
                }
                fieldelement(LocationCode; SalesHeader."Location Code")
                {
                }
                fieldelement(DocumentDate; SalesHeader."Document Date")
                {
                }
                fieldelement(Status; SalesHeader.Status)
                {
                }
                fieldelement(Amount; SalesHeader.Amount)
                {
                }
                fieldelement(AmountIncludingVAT; SalesHeader."Amount Including VAT")
                {
                }
            }    
        }
    }
}
