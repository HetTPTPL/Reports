table 50153 "TSE Xml Port"
{
    Caption = 'TSE Xml Port';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                if Amount < 0 then 
                    Error('Amount cannot be Negative');
            end;
        }
        field(4; "Date Inserted"; DateTime)
        {
            Caption = 'Date Inserted';
            Editable = false;
        }
        field(5; "Inserted By"; Code[50])
        {
            Caption = 'Inserted By';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "Date Inserted" := CurrentDateTime;
        "Inserted By" := FORMAT(UserId);
    end;
}
