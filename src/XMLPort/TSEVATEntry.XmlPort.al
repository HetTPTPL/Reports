xmlport 50164 "TSE VAT Entry"
{
    Caption = 'TSE VAT Entry';
    Direction = Export;
    UseRequestPage = false;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(VATEntry; "VAT Entry")
            {
                fieldelement(EntryNo; VATEntry."Entry No.")
                {
                }
                fieldelement(VATReportingDate; VATEntry."VAT Reporting Date")
                {
                }
                fieldelement(PostingDate; VATEntry."Posting Date")
                {
                }
                fieldelement(DocumentNo; VATEntry."Document No.")
                {
                }
                fieldelement(DocumentType; VATEntry."Document Type")
                {
                    // trigger OnBeforePassField()
                    // begin
                    //     VATEntry.SetRange("Document Type", VATEntry."Document Type"::Payment);
                    // end;
                }
                fieldelement(Type; VATEntry."Type")
                {
                }
                fieldelement(Amount; VATEntry.Amount)
                {
                    // trigger OnBeforePassField()
                    // begin
                    //     VATEntry.SetFilter(Amount, '>0');
                    // end;
                }
                fieldelement(BilltoPaytoNo; VATEntry."Bill-to/Pay-to No.")
                {
                }
                trigger OnPreXmlItem()
                begin
                    VATEntry.SetRange("Document Type", VATEntry."Document Type"::Invoice);
                    VATEntry.SetFilter(Amount, '>0');
                end;
            }
        }
    }
}
