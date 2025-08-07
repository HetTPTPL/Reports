query 50152 "TSE Item Category Overview"
{
    Caption = 'TSE Item Category Overview';
    QueryType = Normal;
    QueryCategory = 'Item List';
    
    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(NetWeight; "Net Weight")
            {
            }
            column(ItemCategoryCode; "Item Category Code")
            {
            }
            dataitem(Item_Category;"Item Category")
            {
                DataItemLink = Code = Item."Item Category Code";
                SqlJoinType = InnerJoin;
                column(Code;Code)
                {
                }
                column(Description;Description)
                {
                }
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
        SetFilter(Inventory, '>0');
    end;
}
