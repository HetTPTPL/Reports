// codeunit 50155 "TSE Sales Post Ext Mgt"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeInsertPostedHeaders, '', false, false)]
//     local procedure OnBeforeInsertPostedHeaders(var SalesHeader: Record "Sales Header")
//     var
//         SalesInvHeaderRec: Record "Sales Invoice Header";
//         CustLedgEntryRec: Record "Cust. Ledger Entry";
//     begin
//         SalesInvHeaderRec."Name 3" := SalesHeader."Name 3";
//         CustLedgEntryRec."Name 3" := SalesHeader."Name 3";
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostCustomerEntry, '', false, false)]
//     local procedure OnAfterPostCustomerEntry(var SalesHeader: Record "Sales Header")
//     var
//         CustLedgEntryRec: Record "Cust. Ledger Entry";
//     begin
//         CustLedgEntryRec."Name 3" := SalesHeader."Name 3";
//     end;
// }
