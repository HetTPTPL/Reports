codeunit 50153 "TSE G/L Account Test Mgt"
{
    procedure FilterUsingRecRef()
    var
        
        RecRef: RecordRef;
        Fref: FieldRef;
        RecordRef: Variant;
    begin
        RecRef.Open(Database::"Sales Header");
        Fref := RecRef.Field(3);
        Fref.SetRange('101001', '101004');

        Fref := RecRef.Field(120);
        Fref.SetFilter('Released');

        RecordRef := RecRef;
        Page.Run(0, RecordRef);
    end;
}
