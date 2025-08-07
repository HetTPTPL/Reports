codeunit 50156 "TSE Purchase Line Mgt"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, 'No.', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Purchase Line")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(Rec."No.") then
            Rec."My Description 3" := ItemRec."My Description 3";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine."My Description 3" := PurchLine."My Description 3";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure OnAfterInitVendLedgEntry(var ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."My Description 3" := ItemJournalLine."My Description 3";
    end;
}
