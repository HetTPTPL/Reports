xmlport 50161 "TSE Detail Vendor Ledger Entry"
{
    Caption = 'TSE Detail Vendor Ledger Entry';
    Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    TableSeparator = '';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(DetailedVendorLedgEntry; "Detailed Vendor Ledg. Entry")
            {
                XmlName = 'DetailedVendorLedgEntry';
                fieldelement(EntryNo; DetailedVendorLedgEntry."Entry No.")
                {
                }
                fieldelement(EntryType; DetailedVendorLedgEntry."Entry Type")
                {
                }
                fieldelement(DocumentNo; DetailedVendorLedgEntry."Document No.")
                {
                }
                fieldelement(DocumentType; DetailedVendorLedgEntry."Document Type")
                {
                }
                fieldelement(VendorNo; DetailedVendorLedgEntry."Vendor No.")
                {
                }
                fieldelement(AmountLCY; DetailedVendorLedgEntry."Amount (LCY)")
                {
                }
                tableelement(Vendor;Vendor)
                {
                    LinkTable = DetailedVendorLedgEntry;
                    LinkFields = "No." = field("Vendor No.");

                    fieldelement(BalanceLCY; Vendor."Balance (LCY)")
                    {
                    }
                    fieldelement(PaymentsLCY; Vendor."Payments (LCY)")
                    {
                    }
                }
            }
        }
    }
}
