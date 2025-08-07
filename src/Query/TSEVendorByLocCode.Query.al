query 50158 "TSE Vendor By Loc Code"
{
    Caption = 'TSE Vendor By Loc Code';
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
            column(EMail; "E-Mail")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            dataitem(Location_Code;Location)
            {
                DataItemLink = Code = Vendor."Location Code";
                // SqlJoinType = RightOuterJoin;
                column(Code;Code)
                {
                }
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
