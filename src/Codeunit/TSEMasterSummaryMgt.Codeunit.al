codeunit 50150 "TSE Master Summary Mgt."
{
    procedure CheckRecordExist(Type: Enum "TSE Master Type"; No: Code[20])
    var
        MasterSummaryRec: Record "TSE Master Summary";
    begin
        MasterSummaryRec.Reset();
        MasterSummaryRec.SetRange(Type, Type);
        MasterSummaryRec.SetRange("No.", No);
        if MasterSummaryRec.FindFirst() then
            DeleteExistingMasterData(MasterSummaryRec);
        InsertMasterSummary(Type, No);

    end;

    local procedure DeleteExistingMasterData(MasterSummaryPar: Record "TSE Master Summary")
    begin
        MasterSummaryPar.Delete();
    end;

    local procedure InsertMasterSummary(Typefilter: Enum "TSE Master Type"; NoFilter: Code[20])
    begin
        if Typefilter = Typefilter::Item then
            InsertMasterSummaryForItem(Typefilter, NoFilter)
        else if Typefilter = Typefilter::Customer then
            InsertMasterSummaryForCustomer(Typefilter, NoFilter)
        else if Typefilter = Typefilter::Vendor then
            InsertMasterSummaryForVendor(Typefilter, NoFilter)
        else if Typefilter = Typefilter::"G/L Account" then
            InsertMasterSummaryForGLAccount(Typefilter, NoFilter)
        else if Typefilter = Typefilter::"Fixed Asset" then
            InsertMasterSummaryForFixedAsset(Typefilter, NoFilter);
    end;

    local procedure InsertMasterSummaryForItem(Typefilter: Enum "TSE Master Type"; Nofilter: Code[20])
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        InsertMasterSummaryRec: Record "TSE Master Summary";
        LastMasterSummaryRec: Record "TSE Master Summary";
        SalesAmount: Decimal;
        PurchaseAmount: Decimal;
        EntryNo: Integer;
    begin
        SalesHeader.Reset();
        SalesHeader.SetFilter("Document Type", '%1|%2', SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);

        if SalesHeader.FindSet() then
            repeat
                SalesLine.Reset();
                SalesLine.SetFilter("Document Type", '%1|%2', SalesLine."Document Type"::Order, SalesLine."Document Type"::Invoice);
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("No.", Nofilter);
                SalesLine.SetRange(Type, SalesLine.Type::Item);
                if SalesLine.FindSet() then
                    repeat
                        SalesAmount += SalesLine.Amount;
                    until SalesLine.Next() = 0;
            until SalesHeader.Next() = 0;

        PurchaseHeader.Reset();
        PurchaseHeader.SetFilter("Document Type", '%1|%2', PurchaseHeader."Document Type"::Order, PurchaseHeader."Document Type"::Invoice);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);

        if PurchaseHeader.FindSet() then
            repeat
                PurchaseLine.Reset();
                PurchaseLine.SetFilter("Document Type", '%1|%2', PurchaseLine."Document Type"::Order, PurchaseLine."Document Type"::Invoice);
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("No.", Nofilter);
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                if PurchaseLine.FindSet() then
                    repeat
                        PurchaseAmount += PurchaseLine.Amount;
                    until PurchaseLine.Next() = 0;
            until PurchaseHeader.Next() = 0;

        LastMasterSummaryRec.Reset();
        if LastMasterSummaryRec.FindLast() then
            EntryNo := LastMasterSummaryRec."Entry No." + 1
        else
            EntryNo := 1;

        InsertMasterSummaryRec.Init();
        InsertMasterSummaryRec."Entry No." := EntryNo;
        InsertMasterSummaryRec.Type := Typefilter;
        InsertMasterSummaryRec.Validate("No.", Nofilter);
        InsertMasterSummaryRec."Sales total" := SalesAmount;
        InsertMasterSummaryRec."Purchase Total" := PurchaseAmount;
        InsertMasterSummaryRec.Insert();
    end;

    local procedure InsertMasterSummaryForCustomer(Typefilter: Enum "TSE Master Type"; Nofilter: Code[20])
    var
        SalesHeader: Record "Sales Header";
        InsertMasterSummaryRec: Record "TSE Master Summary";
        LastMasterSummaryRec: Record "TSE Master Summary";
        SalesAmount: Decimal;
        EntryNo: Integer;
    begin
        SalesHeader.Reset();
        SalesHeader.SetFilter("Document Type", '%1|%2', SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetRange("Sell-to Customer No.", Nofilter);
        if SalesHeader.FindSet() then
            repeat
                SalesHeader.CalcFields(Amount);
                SalesAmount += SalesHeader.Amount;
            until SalesHeader.Next() = 0;

        LastMasterSummaryRec.Reset();
        if LastMasterSummaryRec.FindLast() then
            EntryNo := LastMasterSummaryRec."Entry No." + 1
        else
            EntryNo := 1;

        InsertMasterSummaryRec.Init();
        InsertMasterSummaryRec."Entry No." := EntryNo;
        InsertMasterSummaryRec.Type := Typefilter;
        InsertMasterSummaryRec.Validate("No.", Nofilter);
        InsertMasterSummaryRec."Sales total" := SalesAmount;
        InsertMasterSummaryRec.Insert();
    end;

    local procedure InsertMasterSummaryForVendor(Typefilter: Enum "TSE Master Type"; Nofilter: Code[20])
    var
        PurchaseHeader: Record "Purchase Header";
        InsertMasterSummaryRec: Record "TSE Master Summary";
        LastMasterSummaryRec: Record "TSE Master Summary";
        PurchaseAmount: Decimal;
        EntryNo: Integer;
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.SetFilter("Document Type", '%1|%2', PurchaseHeader."Document Type"::Order, PurchaseHeader."Document Type"::Invoice);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);
        PurchaseHeader.SetRange("Buy-from Vendor No.", Nofilter);
        if PurchaseHeader.FindSet() then
            repeat
                PurchaseHeader.CalcFields(Amount);
                PurchaseAmount += PurchaseHeader.Amount;
            until PurchaseHeader.Next() = 0;

        LastMasterSummaryRec.Reset();
        if LastMasterSummaryRec.FindLast() then
            EntryNo := LastMasterSummaryRec."Entry No." + 1
        else
            EntryNo := 1;

        InsertMasterSummaryRec.Init();
        InsertMasterSummaryRec."Entry No." := EntryNo;
        InsertMasterSummaryRec.Type := Typefilter;
        InsertMasterSummaryRec.Validate("No.", Nofilter);
        InsertMasterSummaryRec."Purchase Total" := PurchaseAmount;
        InsertMasterSummaryRec.Insert();
    end;

    local procedure InsertMasterSummaryForGLAccount(Typefilter: Enum "TSE Master Type"; Nofilter: Code[20])
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        InsertMasterSummaryRec: Record "TSE Master Summary";
        LastMasterSummaryRec: Record "TSE Master Summary";
        SalesAmount: Decimal;
        PurchaseAmount: Decimal;
        EntryNo: Integer;
    begin
        SalesHeader.Reset();
        SalesHeader.SetFilter("Document Type", '%1|%2', SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);

        if SalesHeader.FindSet() then
            repeat
                SalesLine.Reset();
                SalesLine.SetFilter("Document Type", '%1|%2', SalesLine."Document Type"::Order, SalesLine."Document Type"::Invoice);
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("No.", Nofilter);
                SalesLine.SetRange(Type, SalesLine.Type::"G/L Account");
                if SalesLine.FindSet() then
                    repeat
                        SalesAmount += SalesLine.Amount;
                    until SalesLine.Next() = 0;
            until SalesHeader.Next() = 0;

        PurchaseHeader.Reset();
        PurchaseHeader.SetFilter("Document Type", '%1|%2', PurchaseHeader."Document Type"::Order, PurchaseHeader."Document Type"::Invoice);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);

        if PurchaseHeader.FindSet() then
            repeat
                PurchaseLine.Reset();
                PurchaseLine.SetFilter("Document Type", '%1|%2', PurchaseLine."Document Type"::Order, PurchaseLine."Document Type"::Invoice);
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("No.", Nofilter);
                PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                if PurchaseLine.FindSet() then
                    repeat
                        PurchaseAmount += PurchaseLine.Amount;
                    until PurchaseLine.Next() = 0;
            until PurchaseHeader.Next() = 0;

        LastMasterSummaryRec.Reset();
        if LastMasterSummaryRec.FindLast() then
            EntryNo := LastMasterSummaryRec."Entry No." + 1
        else
            EntryNo := 1;

        InsertMasterSummaryRec.Init();
        InsertMasterSummaryRec."Entry No." := EntryNo;
        InsertMasterSummaryRec.Type := Typefilter;
        InsertMasterSummaryRec.Validate("No.", Nofilter);
        InsertMasterSummaryRec."Sales total" := SalesAmount;
        InsertMasterSummaryRec."Purchase Total" := PurchaseAmount;
        InsertMasterSummaryRec.Insert();
    end;

    local procedure InsertMasterSummaryForFixedAsset(Typefilter: Enum "TSE Master Type"; Nofilter: Code[20])
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        InsertMasterSummaryRec: Record "TSE Master Summary";
        LastMasterSummaryRec: Record "TSE Master Summary";
        EntryNo: Integer;
        SalesAmount: Decimal;
        PurchaseAmount: Decimal;
    begin
        SalesHeader.Reset();
        SalesHeader.SetFilter("Document Type", '%1|%2', SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);

        if SalesHeader.FindSet() then
            repeat
                SalesLine.Reset();
                SalesLine.SetFilter("Document Type", '%1|%2', SalesLine."Document Type"::Order, SalesLine."Document Type"::Invoice);
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("No.", Nofilter);
                SalesLine.SetRange(Type, SalesLine.Type::"Fixed Asset");
                if SalesLine.FindSet() then
                    repeat
                        SalesAmount += SalesLine.Amount;
                    until SalesLine.Next() = 0;
            until SalesHeader.Next() = 0;

        PurchaseHeader.Reset();
        PurchaseHeader.SetFilter("Document Type", '%1|%2', PurchaseHeader."Document Type"::Order, PurchaseHeader."Document Type"::Invoice);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);

        if PurchaseHeader.FindSet() then
            repeat
                PurchaseLine.Reset();
                PurchaseLine.SetFilter("Document Type", '%1|%2', PurchaseLine."Document Type"::Order, PurchaseLine."Document Type"::Invoice);
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("No.", Nofilter);
                PurchaseLine.SetRange(Type, PurchaseLine.Type::"Fixed Asset");
                if PurchaseLine.FindSet() then
                    repeat
                        PurchaseAmount += PurchaseLine.Amount;
                    until PurchaseLine.Next() = 0;
            until PurchaseHeader.Next() = 0;

        LastMasterSummaryRec.Reset();
        if LastMasterSummaryRec.FindLast() then
            EntryNo := LastMasterSummaryRec."Entry No." + 1
        else
            EntryNo := 1;

        InsertMasterSummaryRec.Init();
        InsertMasterSummaryRec."Entry No." := EntryNo;
        InsertMasterSummaryRec.Type := Typefilter;
        InsertMasterSummaryRec.Validate("No.", Nofilter);
        InsertMasterSummaryRec."Sales total" := SalesAmount;
        InsertMasterSummaryRec."Purchase Total" := PurchaseAmount;
        InsertMasterSummaryRec.Insert();
    end;


}
