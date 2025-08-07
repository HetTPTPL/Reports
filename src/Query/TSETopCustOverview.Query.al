query 50150 "TSE Top Cust Overview"
{
    Caption = 'TSE Top Cust Review';
    QueryType = Normal;
    QueryCategory = 'Customer List';
    OrderBy = descending("SalesLCY");
    // TopNumberOfRows = 3;
    // UsageCategory = ReportsAndAnalysis;
    // DataAccessIntent = ReadOnly;
    // HelpLink = 'https://www.google.com/';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {
            }
            column(No; "No.")
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
                Method = Sum;
                ColumnFilter = SalesLCY = filter(>2000000);
            }
            column(ProfitLCY; "Profit (LCY)")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(City; City)
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            dataitem(Sales_Purchaser; "Salesperson/Purchaser")
            {
                DataItemLink = Code = Customer."Salesperson Code";
                // SqlJoinType = FullOuterJoin;
                column(SalesPersonName; Name)
                {
                }
                dataitem(Country; "Country/Region")
                {
                    DataItemLink = Code = Customer."Country/Region Code";
                    column(CountryName; Name)
                    {
                    }
                }
            }
        }
    }

    // trigger OnBeforeOpen()
    // begin
    //     SetFilter(SalesLCY, '>5000000');
    // end;
}
