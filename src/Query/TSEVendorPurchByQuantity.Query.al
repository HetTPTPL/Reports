query 50154 "TSE Vendor Purch By Quantity"
{
    Caption = 'TSE Vendor Purch By Quantity';
    QueryType = Normal;
    QueryCategory = 'Vendor List';
    
    elements
    {
        dataitem(Vendor; Vendor)
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
            column(PostCode; "Post Code")
            {
            }
            dataitem(Post_Code;"Post Code")
            {
                DataItemLink = Code = Vendor."Post Code";
                SqlJoinType = RightOuterJoin;
                column(City;City)
                {
                }
                column(Country_Region_Code;"Country/Region Code")
                {
                }
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    
    end;
}
