pageextension 50153 "TSE Chart of Accounts Ext" extends "Chart of Accounts"
{
    actions
    {
        addlast(Processing)
        {
            action("Copy to G/L Account Test")
            {
                Caption = 'Copy to G/L Account Test';
                ToolTip = 'Copy to G/L Account Test';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    GLAccountTest: Record "TSE G/L Account Test";
                    GLAccount: Record "G/L Account";
                begin
                    CurrPage.SetSelectionFilter(GLAccount);

                    if GLAccount.FindSet() then
                        repeat
                            GLAccount.CalcFields("Net Change", "Balance");

                            if GLAccountTest.Get(GLAccount."No.") then
                                GLAccountTest.Delete();

                            GLAccountTest.Init();
                            GLAccountTest."Code" := GLAccount."No.";
                            GLAccountTest."Name" := GLAccount.Name;
                            GLAccountTest."Net Change" := GLAccount."Net Change";
                            GLAccountTest."Balance" := GLAccount."Balance";
                            GLAccountTest.Insert();
                        until GLAccount.Next() = 0;

                    Page.Run(Page::"TSE G/L Account Test List",GLAccountTest);
                end;
            }
        }

        addlast(Promoted)
        {
            actionref(CopytoGLAccountTest_Promoted; "Copy to G/L Account Test")
            {

            }
        }
    }
}
