page 50152 "TSE G/L Account Test List"
{
    ApplicationArea = All;
    Caption = 'G/L Account Test List';
    PageType = List;
    SourceTable = "TSE G/L Account Test";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Net Change"; Rec."Net Change")
                {
                    ToolTip = 'Specifies the value of the Net Change field.', Comment = '%';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Filter using RecRef")
            {
                ApplicationArea = all;
                ToolTip = 'Filter using RecRef';
                Image = Action;
                trigger OnAction()
                var
                GLAccountTestCU: Codeunit "TSE G/L Account Test Mgt";
                begin
                    GLAccountTestCU.FilterUsingRecRef();
                end;
            }
        }

        area(Promoted)
        {
            actionref(FilterusingRecRef_Promoted; "Filter using RecRef")
            {

            }
        }
    }

    
}
