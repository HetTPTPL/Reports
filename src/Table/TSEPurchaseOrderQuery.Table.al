table 50152 "TSE Purchase Order Query"
{
    Caption = 'TSE Purchase Order Query';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; RowNo; Integer)
        {
            Caption = 'Row No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Buy-from Vendor Name"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }
        // field(5; "Currency Code"; Code[10])
        // {
        //     Caption = 'Currency Code';
        //     TableRelation = Currency;
        //     DataClassification = ToBeClassified;
        // }
        field(6; "Amount Including VAT"; Decimal)
        {
            // AutoFormatExpression = "Currency Code";
            // AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            DataClassification = ToBeClassified;
        }
        field(7; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            // DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            // AutoFormatExpression = "Currency Code";
            // AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(11; Inventory; Decimal)
        {
            Caption = 'Inventory';
            // DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; RowNo)
        {
            Clustered = true;
        }
    }
}
