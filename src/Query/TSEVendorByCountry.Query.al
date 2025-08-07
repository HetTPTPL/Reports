query 50156 "TSE Vendor By Country"
{
    Caption = 'TSE Vendor By Country';
    QueryType = Normal;
    QueryCategory = 'Vendor List';
    
    elements
    {
        dataitem(Vendor; Vendor)
        {
            column(No; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            dataitem(Country_Region;"Country/Region")
            {
                // DataItemLink = Code = Vendor."Country/Region Code";
                SqlJoinType = CrossJoin;
                column(Name;Name)
                {
                }
                column(Code;Code)
                {
                }
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    
    end;
}
