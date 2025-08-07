query 50153 "TSE Cust Sales By Quantity"
{
    Caption = 'TSE Cust Sales By Quantity';
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
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            dataitem(Sales_Line;"Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = LeftOuterJoin;
                column(Quantity;Quantity)
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
