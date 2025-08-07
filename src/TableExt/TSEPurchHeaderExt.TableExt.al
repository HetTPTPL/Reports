namespace Task.Task;

using Microsoft.Purchases.Document;

tableextension 50161 "TSE Purch Header Ext" extends "Purchase Header"
{
    fields
    {
        field(50150; "Vendor Name 3"; Text[100])
        {
            Caption = 'Vendor Name 3';
            DataClassification = ToBeClassified;
        }
    }
}
