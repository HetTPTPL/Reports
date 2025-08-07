table 50154 "TSE Consolidated Cust Balance"
{
    Caption = 'TSE Consolidated Cust Balance';
    DataClassification = ToBeClassified;
    TableType = Temporary;
    
    fields
    {
        field(1; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
        }
        field(9; "Customer Balance"; Decimal)
        {
            Caption = 'Customer Balance';
        }
        field(10; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
        }
        field(11; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }
    keys
    {
        key(PK; "Company Name", "Customer No.", "Posting Date", "Document No.", "Entry No.")
        {
            Clustered = true;
        }
    }
}
