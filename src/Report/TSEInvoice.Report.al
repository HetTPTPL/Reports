report 50176 "TSE Invoice"
{
    ApplicationArea = All;
    Caption = 'TSE Invoice';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLC;
    dataset
    {
        dataitem(Integer; "Integer")
        {
            DataItemTableView = sorting(Number);

            column(Number; Number)
            {
            }
            dataitem(SalesHeader; "Sales Header")
            {
                DataItemTableView = sorting("No.", "Document Type") where("Document Type" = filter(Order));
                RequestFilterFields = "No.";
                column(No_SalesHeader; "No.")
                {
                }
                column(Posting_Date_SalesHeader; "Posting Date")
                {
                }
                column(ShiptoName_SalesHeader; "Ship-to Name")
                {
                }
                column(ShiptoContact_SalesHeader; "Ship-to Contact")
                {
                }
                column(ShiptoPhoneNo_SalesHeader; "Ship-to Phone No.")
                {
                }
                column(ShiptoAddress_SalesHeader; "Ship-to Address")
                {
                }
                column(ShiptoCity_SalesHeader; "Ship-to City")
                {
                }
                column(ShiptoPostCode_SalesHeader; "Ship-to Post Code")
                {
                }
                column(ShiptoCountry_SalesHeader; ShiptoCountry)
                {
                }
                column(BilltoName_SalesHeader; "Bill-to Name")
                {
                }
                column(BilltoAddress_SalesHeader; "Bill-to Address")
                {
                }
                column(BilltoContact_SalesHeader; "Bill-to Contact")
                {
                }
                column(BilltoContactNo_SalesHeader; "Bill-to Contact No.")
                {
                }
                column(BilltoPostCode_SalesHeader; "Bill-to Post Code")
                {
                }
                column(BilltoCity_SalesHeader; "Bill-to City")
                {
                }
                column(BilltoCountry_SalesHeader; BilltoCountry)
                {
                }
                column(SelltoCustomerName_SalesHeader; "Sell-to Customer Name")
                {
                }
                column(SelltoContact_SalesHeader; "Sell-to Contact")
                {
                }
                column(SelltoContactNo_SalesHeader; "Sell-to Contact No.")
                {
                }
                column(SelltoCity_SalesHeader; "Sell-to City")
                {
                }
                column(SelltoPostCode_SalesHeader; "Sell-to Post Code")
                {
                }
                column(SelltoAddress_SalesHeader; "Sell-to Address")
                {
                }
                column(SelltoCountry_SalesHeader; SelltoCountry)
                {
                }
                column(PaymentMethodDesc_SalesHeader; PaymentMethodDesc)
                {
                }
                column(PaymenttermDesc_SalesHeader; PaymenttermDesc)
                {
                }
                column(ShipmentMethodDesc_SalesHeader; ShipmentMethodDesc)
                {
                }
                column(CurrencyDesc_SalesHeader; CurrencyDesc)
                {
                }
                column(CompanyName_Company; CompanyInfo.Name)
                {
                }
                column(CompanyAddress_Company; CompanyInfo.Address)
                {
                }
                column(CompanyAddress2_Company; CompanyInfo."Address 2")
                {
                }
                column(CompanyCity_Company; CompanyInfo.City)
                {
                }
                column(CompanyPostCode_Company; CompanyInfo."Post Code")
                {
                }
                column(CompanyCountry_Company; CompanyCountry)
                {
                }
                column(CompanyEmail_Company; CompanyInfo."E-Mail")
                {
                }
                column(CompanyPhone_Company; CompanyInfo."Phone No.")
                {
                }
                dataitem(SalesLine; "Sales Line")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                    DataItemTableView = sorting("Document No.", "Line No.");
                    column(No_SalesLine; "No.")
                    {
                    }
                    column(Type_SalesLine; "Type")
                    {
                    }
                    column(Description_SalesLine; Description)
                    {
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                    }
                    column(UnitofMeasure_SalesLine; "Unit of Measure")
                    {
                    }
                    column(UnitPrice_SalesLine; "Unit Price")
                    {
                    }
                    column(LineDiscountAmount_SalesLine; "Line Discount Amount")
                    {
                    }
                    column(InvDiscountAmount_SalesLine; "Inv. Discount Amount")
                    {
                    }
                    column(LineAmount_SalesLine; "Line Amount")
                    {
                    }
                    column(AmountSL; AmountSL)
                    {
                    }
                    column(TotalAmount; TotalAmount)
                    {
                    }
                    column(TotalLineDiscount; TotalLineDiscount)
                    {
                    }
                    column(TotalInvoiceDiscount; TotalInvoiceDiscount)
                    {
                    }
                    column(TotalPayable; TotalPayable)
                    {
                    }
                    column(Counter; Counter)
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        Counter := 0;
                        AmountSL := 0;
                    end;

                    trigger OnAfterGetRecord()
                    var
                        FormatDoc: Codeunit "Format Document";
                    begin

                        AmountSL := SalesLine.Quantity * SalesLine."Unit Price";
                        TotalAmount := TotalAmount + AmountSL;
                        TotalLineDiscount := TotalLineDiscount + SalesLine."Line Discount Amount";
                        TotalInvoiceDiscount := TotalInvoiceDiscount + SalesLine."Inv. Discount Amount";
                        TotalPayable := TotalAmount - TotalLineDiscount - TotalInvoiceDiscount;

                        if FormatDoc.HideDocumentLine(HideLinesWithZeroQuantity, SalesLine, FieldNo("Qty. to Invoice")) then begin
                            CurrReport.Skip();
                            Counter += 1;
                        end
                        else
                            Counter += 1;
                    end;

                }
                dataitem(BlankLine; Integer)
                {
                    DataItemTableView = sorting(Number);
                    column(IsBlankLine; Number)
                    {
                    }
                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, MaxBlankLine - (Counter MOD MaxBlankLine));
                    end;
                }

                trigger OnPreDataItem()
                begin
                    CompanyInfo.Get();
                end;

                trigger OnAfterGetRecord()
                begin
                    if CountryRegion.Get("Bill-to Country/Region Code") then
                        BilltoCountry := CountryRegion.Name;
                    if CountryRegion.Get("Sell-to Country/Region Code") then
                        SelltoCountry := CountryRegion.Name;
                    if CountryRegion.Get("Ship-to Country/Region Code") then
                        ShiptoCountry := CountryRegion.Name;
                    if CountryRegion.Get(CompanyInfo."Country/Region Code") then
                        CompanyCountry := CountryRegion.Name;
                    if ShipmentMethod.Get("Shipment Method Code") then
                        ShipmentMethodDesc := ShipmentMethod.Description;
                    if PaymentMetod.Get("Payment Method Code") then
                        PaymentMethodDesc := PaymentMetod.Description;
                    if PaymentTerm.Get("Payment Terms Code") then
                        PaymenttermDesc := PaymentTerm.Description;
                    if Currency.Get("Currency Code") then
                        CurrencyDesc := Currency.Description;

                    TotalAmount := 0;
                    TotalLineDiscount := 0;
                    TotalInvoiceDiscount := 0;
                    TotalPayable := 0;
                    MaxBlankLine := 32;
                end;
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, NoOfCopies + 1);
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("No of Copies"; NoOfCopies)
                    {
                        ApplicationArea = all;
                        Caption = 'No of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(HideLinesWithZeroQuantity_Filter; HideLinesWithZeroQuantity)
                    {
                        ApplicationArea = all;
                        Caption = 'Hide the line of quantity which has Zero.';
                        ToolTip = 'Hide the line of quantity which has Zero.';
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
            LayoutFile = './src/Layouts/Layout50176_CustomInvoice_V2.rdl';
        }
    }

    labels
    {
        Report_Lbl = 'Invoice';
        InvoiceDate_Lbl = 'Invoice Date';
        CONSIGNEE_Lbl = 'CONSIGNEE';
        BUYER_Lbl = 'BUYER';
        NOTIFY_Lbl = 'NOTIFY';
        EXPORTER_Lbl = 'EXPORTER';
        PaymentMethod_Lbl = 'Payment Method';
        PaymentTerm_Lbl = 'Payment Terms';
        ShipmentMethod_Lbl = 'Shipment Method';
        Currency_Lbl = 'Currency';
        Sr_Lbl = 'Sr.';
        ItemNo_Lbl = 'Item No.';
        Desc_Lbl = 'Description';
        Quantity_Lbl = 'Quantity';
        UOM_Lbl = 'Unit of Measure';
        Rate_Lbl = 'Rate';
        Amt_Lbl = 'Amount';
        AmtinWords_Lbl = 'Amount in Words';
        TotalAmt_Lbl = 'Total Amount';
        TotalLineDis_Lbl = 'Total Line Discount';
        TotalInvoiceDis_Lbl = 'Total Invoice Discount';
        TotalPayable_Lbl = 'Total Payable';
        Paisa_Lbl = 'Paisa Only';
    }

    var

        CompanyInfo: Record "Company Information";
        CountryRegion: Record "Country/Region";
        ShipmentMethod: Record "Shipment Method";
        PaymentMetod: Record "Payment Method";
        PaymentTerm: Record "Payment Terms";
        Currency: Record Currency;
        BilltoCountry: Text;
        SelltoCountry: Text;
        ShiptoCountry: Text;
        CompanyCountry: Text;
        ShipmentMethodDesc: Text;
        PaymentMethodDesc: Text;
        PaymenttermDesc: Text;
        CurrencyDesc: Text;
        NoOfCopies: Integer;
        TotalAmount: Decimal;
        TotalLineDiscount: Decimal;
        TotalInvoiceDiscount: Decimal;
        TotalPayable: Decimal;
        AmountSL: Decimal;
        Counter: Integer;
        MaxBlankLine: Integer;
        HideLinesWithZeroQuantity: Boolean;

}
