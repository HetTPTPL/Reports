tableextension 50156 "TSE Sales Shipment Line Ext" extends "Sales Shipment Line"
{
    fields
    {
        field(50150; "My Description 3"; Text[100])
        {
            Caption = 'My Description 3';
            DataClassification = ToBeClassified;
        }
    }
}
