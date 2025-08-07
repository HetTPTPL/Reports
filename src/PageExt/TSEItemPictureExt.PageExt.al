namespace Task.Task;

using Microsoft.Inventory.Item.Picture;
using System.Environment;
using Microsoft.Inventory.Item;
using Microsoft.Foundation.Company;

pageextension 50176 "TSE Item Picture Ext" extends "Item Picture"
{
    actions
    {
        addafter(ExportFile)
        {
            action(CopyToOtherCompany)
            {
                ApplicationArea = all;
                Caption = 'CopyToOtherCompany';
                ToolTip = 'Executes the CopyToOtherCompany action.';
                Image = Copy;
                trigger OnAction()
                var
                    CompanyRec: Record Company;
                    ItemRec: Record Item;
                    ItemTenantMedia: Record "Tenant Media";
                    InStr: InStream;
                    FileName: Text;
                begin
                    CompanyRec.Reset();
                    if Page.RunModal(Page::Companies, CompanyRec) = Action::LookupOK then begin
                        ItemRec.Reset();
                        ItemRec.ChangeCompany(CompanyRec.Name);
                        if Page.RunModal(Page::"Item List", ItemRec) = Action::LookupOK then
                            if Rec.Picture.Count > 0 then begin
                                ItemTenantMedia.Get(Rec.Picture.Item(1));
                                ItemTenantMedia.CalcFields(Content);
                                ItemTenantMedia.Content.CreateInStream(InStr, TextEncoding::UTF8);
                                FileName := ItemRec.Description + '.png';
                                ItemRec.Picture.ImportStream(InStr, FileName);
                                ItemRec.Modify(true);
                                Message('Item picture copied successfully to company ' + CompanyRec.Name + ' Item No. ' + ItemRec."No.");
                            end;
                    end;
                end;
            }
        }
    }
}
