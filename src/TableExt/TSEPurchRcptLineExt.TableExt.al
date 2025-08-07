tableextension 50165 "TSE Purch Rcpt Line Ext" extends "Purch. Rcpt. Line"
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
