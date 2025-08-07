codeunit 50152 "TSE Item Card Ext Mgt."
{
    procedure ShowSalesCreditLines(var ItemRec: Record Item)
    var
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        SalesLine_New: Record "Sales Line";
    begin
        // SalesLine.Reset();
        // SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Credit Memo");
        // SalesLine.SetRange("No.", ItemRec."No.");
        // SalesLine.SetRange("Line Amount", 100, 500);

        // if SalesLine.FindSet() then
        //     repeat
        //         SalesHeader.Reset();
        //         if SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.") then
        //             if (SalesHeader.Status = SalesHeader.Status::Released) then
        //                 SalesLine.Mark(true);
        //     until SalesLine.Next() = 0;

        // SalesLine.MarkedOnly(true);
        // Page.Run(Page::"Sales Lines", SalesLine);

        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Credit Memo");
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);

        if SalesHeader.FindSet() then
            repeat
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Credit Memo");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange(Type, SalesLine.Type::Item);
                SalesLine.SetRange("No.", ItemRec."No.");
                SalesLine.SetRange("Line Amount", 100, 500);

                if SalesLine.FindSet() then
                    repeat
                        SalesLine_New := SalesLine;
                        SalesLine_New.Mark(true);
                    until SalesLine.Next() = 0;

            until SalesHeader.Next() = 0;

        SalesLine_New.MarkedOnly(true);
        Page.Run(Page::"Sales Lines", SalesLine_New);
    end;

}
