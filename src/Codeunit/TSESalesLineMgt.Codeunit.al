codeunit 50151 "TSE Sales Line Mgt"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'No.', true, true)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(Rec."No.") then
            Rec."Description 3" := ItemRec."Description 3";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'No.', true, true)]
    local procedure OnAfterValidateEventSalesLine(var Rec: Record "Sales Line")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(Rec."No.") then
            Rec."My Description 3" := ItemRec."My Description 3";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnInsertShipmentLineOnAfterInitQuantityFields, '', false, false)]
    local procedure OnInsertShipmentLineOnAfterInitQuantityFields(var SalesShptLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line")
    begin
        SalesShptLine."My Description 3" := SalesLine."My Description 3";
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnItemQtyPostingOnBeforeApplyItemLedgEntry, '', false, false)]
    // local procedure OnItemQtyPostingOnBeforeApplyItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry")
    // var
    //     SalesShptLine: Record "Sales Shipment Line";
    // begin
    //     if SalesShptLine.Get(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.") then
    //         ItemLedgerEntry."My Description 3" := SalesShptLine."My Description 3";
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromSalesLine, '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine."My Description 3" := SalesLine."My Description 3"
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."My Description 3" := ItemJournalLine."My Description 3";
    end;
}