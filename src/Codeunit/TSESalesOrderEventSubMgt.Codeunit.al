codeunit 50154 "TSE Sales Order Event Sub Mgt"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, 'Sell-to Customer No.', true, true)]
    local procedure OnAfterValidateEventSalesHeader(var Rec: Record "Sales Header")
    var
        CustomerRec: Record Customer;
    begin
        if CustomerRec.Get(Rec."Sell-to Customer No.") then
            Rec."Name 3" := CustomerRec."Name 3";
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeInsertPostedHeaders, '', false, false)]
    // local procedure OnBeforeInsertPostedHeaders(var SalesHeader: Record "Sales Header")
    // var
    //     SalesInvHeaderRec: Record "Sales Invoice Header";
    // begin
    //     SalesInvHeaderRec."Name 3" := SalesHeader."Name 3";
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    begin
        GenJournalLine."Name 3" := SalesHeader."Name 3";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", OnAfterCopyCustLedgerEntryFromGenJnlLine, '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."Name 3" := GenJournalLine."Name 3";
    end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeCustLedgEntryInsert, '', true, true)]
    // local procedure OnBeforeCustLedgEntryInsert(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
    // var
    //     Customer: Record Customer;
    // begin
    //     if Customer.Get(GenJournalLine."Account No.") then
    //         CustLedgerEntry."Name 3" := Customer."Name 3";
    // end;

}
