tableextension 50151 "TSE Sales Line Ext" extends "Sales Line"
{
    fields
    {
        // modify("No.")
        // {
        //     trigger OnAfterValidate()
        //     var
        //         ItemRec: Record Item;
        //     begin
        //         if ItemRec.Get(Rec."No.") then
        //             Rec."Description 3" := ItemRec."Description 3";
        //         // Rec.Modify(true);
        //     end;
        // }
        field(50100; "Description 3"; Text[50])
        {
            Caption = 'Description 3';
            DataClassification = ToBeClassified;
        }
        field(50101;"My Description 3"; Text[100])
        {
            Caption = 'My Description 3';
            DataClassification = ToBeClassified;
        }
    }
}
