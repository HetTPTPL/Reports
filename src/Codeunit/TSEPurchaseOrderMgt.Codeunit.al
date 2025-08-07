codeunit 50155 "TSE Purchase Order Mgt"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterValidateEvent, 'Buy-from Vendor No.', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Purchase Header")
    var
        VendorRec : Record Vendor;
    begin
        if VendorRec.Get(Rec."Buy-from Vendor No.") then
        Rec."Vendor Name 3" := VendorRec."Vendor Name 3";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromVendLedgEntry(var GenJournalLine: Record "Gen. Journal Line"; PurchaseHeader: Record "Purchase Header")
    begin
        GenJournalLine."Vendor Name 3" := PurchaseHeader."Vendor Name 3";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", OnAfterCopyVendLedgerEntryFromGenJnlLine, '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."Vendor Name 3" := GenJournalLine."Vendor Name 3";
    end;
}
