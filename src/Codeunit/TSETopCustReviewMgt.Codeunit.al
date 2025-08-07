codeunit 50159 "TSE Top Cust Review Mgt."
{
    trigger OnRun()
    var
        CustQuery: Query "TSE Top Cust Overview";
        // Filter: Text;
    begin
        // CustQuery.SetFilter(SalesLCY, '>500000');
        // CustQuery.SetRange(SalesLCY, 3000000, 4000000);
        // CustQuery.SetFilter(Name, 'Deerfield Graphics Company');
        CustQuery.Open();
        while CustQuery.Read() do
            Message('Customer Name: %1 & Sales LCY: %2', CustQuery.Name, CustQuery.SalesLCY);
        // Filter := CustQuery.GetFilters;
        // Message('The Filter is %1',Filter);
        CustQuery.Close();
    end;
}
