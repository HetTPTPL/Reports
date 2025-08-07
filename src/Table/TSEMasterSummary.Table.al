table 50150 "TSE Master Summary"
{
    Caption = 'Master Summary ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Type"; Enum "TSE Master Type")
        {
            Caption = 'Type ';
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No. ';
            trigger OnValidate()
            var
                CustomerRec: Record Customer;
                VendorRec: Record Vendor;
                ItemRec: Record Item;
                FixedAssetRec: Record "Fixed Asset";
                GlAccountRec: Record "G/L Account";
            begin
                if Type = Type::Customer then begin
                    if CustomerRec.Get("No.") then
                        Name := CustomerRec.Name
                end else if Type = Type::Vendor then begin
                    if VendorRec.Get("No.") then
                        Name := VendorRec.Name
                end else if Type = Type::Item then begin
                    if ItemRec.Get("No.") then
                        Name := ItemRec.Description
                end else if Type = Type::"Fixed Asset" then begin
                    if FixedAssetRec.Get("No.") then
                        Name := FixedAssetRec.Description
                end else if Type = Type::"G/L Account" then begin
                    if GlAccountRec.Get("No.") then
                        Name := GlAccountRec.Name;
                end;
            end;
        }
        field(4; "Name"; Text[50])
        {
            Caption = 'Name ';
        }
        field(5; "Sales total"; Decimal)
        {
            Caption = 'Sales total';
        }
        field(6; "Purchase Total"; Decimal)
        {
            Caption = 'Purchase Total';
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;

        }
    }
}
