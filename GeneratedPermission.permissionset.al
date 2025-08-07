namespace Permission;

permissionset 50150 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "TSE G/L Account Test"=RIMD,
        tabledata "TSE Master Summary"=RIMD,
        tabledata "TSE Xml Port" = RIMD,
        tabledata "TSE Consolidated Cust Balance" = RIMD,
        table "TSE G/L Account Test"=X,
        table "TSE Master Summary"=X,
        codeunit "TSE G/L Account Test Mgt"=X,
        codeunit "TSE Item Card Ext Mgt."=X,
        codeunit "TSE Master Summary Mgt."=X,
        codeunit "TSE Sales Line Mgt"=X,
        page "TSE G/L Account Test List"=X,
        page "TSE Master Summary Worksheet"=X;
}