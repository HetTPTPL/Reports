tableextension 50150 "TSE Item Extension" extends "Item"
{
    fields
    {
        field(50100; "Description 3"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "My Description 3"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Blob Picture"; Blob)
        {
            Subtype = Bitmap;
            DataClassification = ToBeClassified;
        }
    }
    fieldgroups
    {
        addlast(DropDown; "Search Description", "Vendor No.")
        {
        }
    }
}
