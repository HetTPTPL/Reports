page 50151 "TSE Master Summary Worksheet"
{
    PageType = Worksheet;
    SourceTable = "TSE Master Summary";
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Master Summary Worksheet';

    layout
    {
        area(content)
        {
            group(Filters)
            {
                field("Type Filter"; TypeFilter)
                {
                    Caption = 'Type Filter';
                    ToolTip = 'Type Filter';
                    trigger OnValidate()
                    begin
                        NoFilter := '';
                    end;
                }
                field("No. Filter"; NoFilter)
                {
                    Caption = 'No Filter';
                    ToolTip = 'No. Filter';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemRec: Record Item;
                        CustomerRec: Record Customer;
                        VendorRec: Record Vendor;
                        FixedAssetRec: Record "Fixed Asset";
                        GLAccountRec: Record "G/L Account";
                    begin
                        if TypeFilter = TypeFilter::" " then begin
                            Message('Please select a Type Filter first.');
                            exit(false);
                        end;

                        case TypeFilter of
                            TypeFilter::Item:
                                if PAGE.RunModal(PAGE::"Item List", ItemRec) = ACTION::LookupOK then begin
                                    Text := ItemRec."No.";
                                    exit(true);
                                end;

                            TypeFilter::Customer:
                                if PAGE.RunModal(PAGE::"Customer List", CustomerRec) = ACTION::LookupOK then begin
                                    Text := CustomerRec."No.";
                                    exit(true);
                                end;

                            TypeFilter::Vendor:
                                if PAGE.RunModal(PAGE::"Vendor List", VendorRec) = ACTION::LookupOK then begin
                                    Text := VendorRec."No.";
                                    exit(true);
                                end;

                            TypeFilter::"Fixed Asset":
                                if PAGE.RunModal(PAGE::"Fixed Asset List", FixedAssetRec) = ACTION::LookupOK then begin
                                    Text := FixedAssetRec."No.";
                                    exit(true);
                                end;

                            TypeFilter::"G/L Account":
                                if PAGE.RunModal(PAGE::"G/L Account List", GLAccountRec) = ACTION::LookupOK then begin
                                    Text := GLAccountRec."No.";
                                    exit(true);
                                end;

                            else
                                Message('Please select a valid Type Filter before choosing No Filter.');
                        end;

                        exit(false);
                    end;
                }

            }
            repeater(MasterData)
            {

                field("Type"; Rec."Type")
                {
                    ToolTip = 'Type';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Name"; Rec.Name)
                {
                    ToolTip = 'Name';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Sales Total"; Rec."Sales Total")
                {
                    ToolTip = 'Sales Total';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Purchase Total"; Rec."Purchase Total")
                {
                    ToolTip = 'Purchase Total';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Entry No.';
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }



    actions
    {
        area(processing)
        {
            action("Show Record")
            {
                Caption = 'Show Records';
                ToolTip = 'Show Record';
                ApplicationArea = All;
                Image = ShowChart;
                trigger OnAction()
                var
                    MasterSummaryMgt: Codeunit "TSE Master Summary Mgt.";
                begin
                    MasterSummaryMgt.CheckRecordExist(TypeFilter, NoFilter);
                    CurrPage.Update();
                end;
            }
            // action(ShowAllRecords)
            // {
            //     Caption = 'Show All';
            //     ApplicationArea = All;
            //     trigger OnAction()
            //     begin
            //         Rec.Reset();
            //         CurrPage.Update(false);
            //     end;
            // }
        }

        area(Promoted)
        {
            actionref(ShowRecord_Promoted; "Show Record")
            {

            }
            // actionref(Showall_Promoted; ShowAllRecords)
            // {

            // }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     // Initially, apply a filter that prevents any records from showing
    //     Rec.SetRange("Entry No.", 0);
    // end;

    var
        TypeFilter: Enum "TSE Master Type";
        NoFilter: Code[20];
}
//         action("Show Record")
//         {
//             Caption = 'Show Records';
//             ApplicationArea = All;
//             trigger OnAction()
//             begin
//                 Rec.Reset();

//                 if TypeFilter = TypeFilter::" " then begin
//                     Message('Please select a Type Filter.');
//                     exit;
//                 end;

//                 // Apply the filter to the current page
//                 Rec.SetRange("Type", TypeFilter);

//                 // if NoFilter <> '' then
//                 Rec.SetRange("No.", NoFilter);

//                 // Refresh the page to reflect the filters
//                 CurrPage.Update(false);
//             end;
//         }
//         action(ShowAllRecords)
//         {
//             Caption = 'Show All';
//             ApplicationArea = All;
//             trigger OnAction()
//             begin
//                 // Clear all filters
//                 Rec.Reset();

//                 // Refresh the page to show all records
//                 CurrPage.Update(false);
//             end;
//         }
//         action("Insert Record")
//         {
//             Caption = 'Insert Record';
//             ApplicationArea = All;
//             trigger OnAction()
//             var
//                 MasterSummaryRec: Record "Master Summary";
//                 CustRec: Record Customer;
//                 ItemRec: Record Item;
//                 VendorRec: Record Vendor;
//                 FixedAssetRec: Record "Fixed Asset";
//                 GLAccountRec: Record "G/L Account";
//             begin
//                 Rec.Reset();

//                 if TypeFilter = TypeFilter::" " then begin
//                     Message('Please select a Type Filter.');
//                     exit;
//                 end;

//                 MasterSummaryRec.SetRange(Type,TypeFilter);
//                 MasterSummaryRec.SetRange("No.",NoFilter);
//                 if MasterSummaryRec.FindFirst() then begin
//                     MasterSummaryRec.Delete();
//                     Message('Existing Record Deleted');
//                 end;

//                 case TypeFilter of
//                     TypeFilter::Item:
//                         begin
//                             ItemRec.Reset();
//                             if NoFilter <> '' then
//                                 ItemRec.SetRange("No.", NoFilter);

//                             if ItemRec.FindFirst() then begin
//                                 InsertIntoMasterSummary(ItemRec."No.", ItemRec.Description);
//                             end else
//                                 Message('No items found.');
//                         end;

//                     TypeFilter::Customer:
//                         begin
//                             CustRec.Reset();
//                             if NoFilter <> '' then
//                                 CustRec.SetRange("No.", NoFilter);

//                             if CustRec.FindFirst() then begin
//                                 InsertIntoMasterSummary(CustRec."No.", CustRec.Name);
//                             end else
//                                 Message('No customers found.');
//                         end;

//                     TypeFilter::Vendor:
//                         begin
//                             VendorRec.Reset();
//                             if NoFilter <> '' then
//                                 VendorRec.SetRange("No.", NoFilter);

//                             if VendorRec.FindFirst() then begin
//                                 InsertIntoMasterSummary(VendorRec."No.", VendorRec.Name);
//                             end else
//                                 Message('No vendors found.');
//                         end;

//                     TypeFilter::"Fixed Asset":
//                         begin
//                             FixedAssetRec.Reset();
//                             if NoFilter <> '' then
//                                 FixedAssetRec.SetRange("No.", NoFilter);

//                             if FixedAssetRec.FindFirst() then begin
//                                 InsertIntoMasterSummary(FixedAssetRec."No.", FixedAssetRec.Description);
//                             end else
//                                 Message('No fixed assets found.');
//                         end;

//                     TypeFilter::"G/L Account":
//                         begin
//                             GLAccountRec.Reset();
//                             if NoFilter <> '' then
//                                 GLAccountRec.SetRange("No.", NoFilter);

//                             if GLAccountRec.FindFirst() then begin
//                                 InsertIntoMasterSummary(GLAccountRec."No.", GLAccountRec.Name);
//                             end else
//                                 Message('No G/L accounts found.');
//                         end;
//                 end;

//                 Message('Filtered records added to Master Summary.');
//             end;
//         }
//     }
// }

// trigger OnOpenPage()
// begin
//     // Initially, apply a filter that prevents any records from showing
//     Rec.SetRange("Entry No.", 0);
// end;




// procedure InsertIntoMasterSummary(No: Code[20]; Name: Text[100])
// var
//     MasterSummaryRec: Record "Master Summary";
//     LastEntryNo: Integer;
//     SalesTotal, PurchaseTotal : Decimal;
// begin
//     // Check if the record already exists
//     MasterSummaryRec.Reset();
//     MasterSummaryRec.SetRange("Type", TypeFilter);
//     MasterSummaryRec.SetRange("No.", No);

//     if TypeFilter = TypeFilter::Customer then
//         SalesTotal := CalculateSalesAmount(No)
//     else
//         SalesTotal := 0;

//     if TypeFilter = TypeFilter::Vendor then
//         PurchaseTotal := CalculatePurchaseTotal(No)
//     else
//         PurchaseTotal := 0;

//     if not MasterSummaryRec.FindFirst() then begin
//         // Generate a unique Entry No.
//         MasterSummaryRec.Reset();
//         if MasterSummaryRec.FindLast() then
//             LastEntryNo := MasterSummaryRec."Entry No." + 1
//         else
//             LastEntryNo := 1;

//         // Insert new record
//         MasterSummaryRec.Init();
//         MasterSummaryRec."Entry No." := LastEntryNo;
//         MasterSummaryRec."Type" := TypeFilter;
//         MasterSummaryRec."No." := No;
//         MasterSummaryRec."Name" := Name;
//         MasterSummaryRec."Sales Total" := SalesTotal;
//         MasterSummaryRec."Purchase Order" := PurchaseTotal;
//         MasterSummaryRec.Insert();
//     end;
// end;

// procedure CalculateSalesAmount(CustomerNo: Code[20]): Decimal
// var
//     SalesLine: Record "Sales Line";
//     TotalSales: Decimal;
// begin
//     TotalSales := 0;
//     SalesLine.Reset();
//     SalesLine.SetRange("Sell-to Customer No.", CustomerNo);
//     SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order, SalesLine."Document Type"::Invoice);
//     // SalesLine.SetRange(Status,SalesLine.Status::Released);

//     if SalesLine.FindSet() then
//         repeat
//             TotalSales += SalesLine.Amount;
//         until SalesLine.Next() = 0;
//     exit(TotalSales);
// end;

// procedure CalculatePurchaseTotal(VendorNo: Code[20]): Decimal
// var
//     PurchaseLine: Record "Purchase Line";
//     TotalPurchase: Decimal;
// begin
//     TotalPurchase := 0;
//     PurchaseLine.Reset();
//     PurchaseLine.SetRange("Buy-from Vendor No.", VendorNo);
//     PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);

//     if PurchaseLine.FindSet() then
//         repeat
//             TotalPurchase += PurchaseLine.Amount;
//         until PurchaseLine.Next() = 0;
//     exit(TotalPurchase);
// end;


