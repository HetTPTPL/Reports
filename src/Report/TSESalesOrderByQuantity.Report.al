namespace Task.Task;

using Microsoft.Sales.Document;
using System.Utilities;

report 50163 "TSE Sales Order By Quantity"
{
    ApplicationArea = All;
    Caption = 'TSE Sales Order By Quantity';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;
    dataset
    {
        dataitem(Integer; Integer)
        {
            column(Number_Integer; Number)
            {
            }
            column(CustNo; CustNo)
            {
            }
            column(CustName; CustName)
            {
            }
            column(No; No)
            {
            }
            column(SalesLineNo; SalesLineNo)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Qty; Qty)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(SalesLbl; SalesLbl)
            {
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TopN);
                SObyQty.TopNumberOfRows(TopN);
                SObyQty.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if SObyQty.Read() then begin
                    CustNo := SObyQty.SelltoCustomerNo;
                    CustName := SObyQty.SelltoCustomerName;
                    No := SObyQty.No;
                    SalesLineNo := SObyQty.No_;
                    Desc := SObyQty.Description;
                    Qty := SObyQty.Quantity;
                end;
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
                    field(TopN; TopN)
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
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = './src/Layouts/Layout50163_SalesOrderReport.rdl';
        }
    }

    trigger OnInitReport()
    begin
        TopN := 5
    end;

    var
        SObyQty: Query "TSE Sales Order By Quantity";
        TopN: Integer;
        CustNo: Code[20];
        No: Code[20];
        CustName: Text[100];
        SalesLineNo: Code[20];
        Desc: Text[100];
        Qty: Decimal;
        SalesLbl: Label 'Sales Order Report';
}
