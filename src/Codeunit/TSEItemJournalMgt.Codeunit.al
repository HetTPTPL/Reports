codeunit 50158 "TSE Item Journal Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterValidateEvent, 'Item No.', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Item Journal Line")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(Rec."Item No.") then
            Rec."My Description 3" := ItemRec."My Description 3";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."My Description 3" := ItemJournalLine."My Description 3";
    end;
}
