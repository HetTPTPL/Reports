page 50153 "TSE Purchase Order Query List"
{
    ApplicationArea = All;
    Caption = 'TSE Purchase Order Query List';
    PageType = List;
    SourceTable = "TSE Purchase Order Query";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field(RowNo; Rec.RowNo)
                {
                    ApplicationArea = All;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = All;
                }
                // field("Currency Code"; Rec."Currency Code")
                // {
                //     ApplicationArea = All;
                // }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        PurchaseOrderQuery: Query "TSE Purchase Order Query";
    begin
        if PurchaseOrderQuery.Open() then begin
            while PurchaseOrderQuery.Read() do begin
                Rec.Init();
                Rec.RowNo := Rec.RowNo + 1;
                Rec."Buy-from Vendor No." := PurchaseOrderQuery.Buy_from_Vendor_No_;
                Rec."Buy-from Vendor Name" := PurchaseOrderQuery.Buy_from_Vendor_Name;
                // Rec."Currency Code" := PurchaseOrderQuery.Currency_Code;
                Rec."Amount Including VAT" := PurchaseOrderQuery.Amount_Including_VAT;
                Rec."Order Date" := PurchaseOrderQuery.Order_Date;
                Rec."No." := PurchaseOrderQuery.No_;
                Rec.Description := PurchaseOrderQuery.Description;
                Rec.Quantity := PurchaseOrderQuery.Quantity;
                Rec.Amount := PurchaseOrderQuery.Amount;
                Rec.Inventory := PurchaseOrderQuery.Inventory;
                Rec.Insert();
            end;
            PurchaseOrderQuery.Close();
        end;
    end;
}
