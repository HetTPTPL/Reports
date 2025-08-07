report 50162 "TSE Cust to Item using query"
{
    ApplicationArea = All;
    Caption = 'TSE Cust to Item using query';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Word;

    dataset
    {
        dataitem(Integer; "Integer")
        {
            column(Number; Number)
            {
            }
            column(CustNo; CustNo)
            {
            }
            column(CustName; CustName)
            {
            }
            column(SalesLineNo; SalesLineNo)
            {
            }
            column(SalesLineDocType; SalesLineDocType)
            {
            }
            column(SalesLineQty; SalesLineQty)
            {
            }
            column(ItemInvt; ItemInvt)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(UserID; UserId)
            {
            }
            column(CustInvtLbl; CustInvtLbl)
            {
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TopN);
                CustItem.TopNumberOfRows(TopN);
                CustItem.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if CustItem.Read() then begin
                    CustNo := CustItem.No;
                    CustName := CustItem.Name;
                    SalesLineNo := CustItem.No_;
                    SalesLineDocType := CustItem.Document_Type;
                    SalesLineQty := CustItem.Quantity;
                    ItemInvt := CustItem.Inventory;
                end
                else
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(TopCust; TopN)
                    {
                        Caption = 'Enter No. of Record you want';
                        ToolTip = 'Enter No. of Record you want';
                        ApplicationArea = all;
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout(Word)
        {
            Type = Word;
            LayoutFile = './src/Layouts/Layout50162_CusttoItem.docx';
        }
    }

    trigger OnInitReport()
    begin
        TopN := 5;
    end;

    var
        CustItem: Query "TSE Cust to Inventory";
        CustNo: Code[20];
        CustName: Text[100];
        SalesLineNo: Code[20];
        SalesLineDocType: Enum "Sales Document Type";
        SalesLineQty: Decimal;
        ItemInvt: Decimal;
        TopN: Integer;
        CustInvtLbl: Label 'Customer Inventory Report';

}
