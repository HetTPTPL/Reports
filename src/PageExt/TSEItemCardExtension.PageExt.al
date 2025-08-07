
pageextension 50150 "TSE Item Card Extension" extends "Item Card"
{
    layout
    {
        modify("Description 2")
        {
            Visible = true;
            ApplicationArea = All;
        }

        addafter("Description 2")
        {
            field("Description 3"; Rec."Description 3")
            {
                ToolTip = 'Description 3';
                ApplicationArea = All;
                Caption = 'Description 3';
            }
        }
        addafter("Description 3")
        {
            field("My Description 3"; Rec."My Description 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the My Description 3 field.', Comment = '%';
                Caption = 'My Description 3';
            }
        }
        addbefore(GTIN)
        {
            field("Blob Picture"; Rec."Blob Picture")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Blob Picture field.';
                Caption = 'Blob Picture';
            }
        }
    }


    actions
    {
        addlast(processing)
        {
            action("Show Sales Credit Lines")
            {
                ApplicationArea = all;
                Caption = 'Show Sales Credit Lines';
                ToolTip = 'Show Sales Credit Lines';
                Image = View;
                trigger OnAction()
                var
                    ItemCardExtMgt: Codeunit "TSE Item Card Ext Mgt.";
                begin
                    ItemCardExtMgt.ShowSalesCreditLines(Rec);
                end;
            }
            action(Reset)
            {
                ApplicationArea = all;
                Caption = 'Reset';
                Image = Delete;
                ToolTip = 'Executes the Reset action.';
                trigger OnAction()
                begin
                    if Rec."Blob Picture".HasValue then begin
                        Clear(Rec."Blob Picture");
                        CurrPage.SaveRecord();
                    end;
                end;
            }
            action(CopyBlobPicturetoPicture)
            {
                Caption = 'CopyBlobPicturetoPicture';
                ToolTip = 'Executes the CopyBlobPicturetoPicture action.';
                ApplicationArea = all;
                Image = Import;
                trigger OnAction()
                var
                    InStr: InStream;
                    FileName: Text;
                begin
                    if rec."Blob Picture".HasValue then begin
                        FileName := Rec."No." + '.png';
                        Rec."Blob Picture".CreateInStream(InStr);
                        Clear(Rec.Picture);
                        Rec.Picture.ImportStream(InStr, FileName);
                        Rec.Modify(true);
                    end;
                end;
            }
            action(CopyPicturetoBlobPicture)
            {
                ApplicationArea = all;
                Image = Import;
                ToolTip = 'Executes the CopyPicturetoBlobPicture action.';
                Caption = 'CopyPicturetoBlobPicture';
                trigger OnAction()
                var
                    ItemTenantMedia: Record "Tenant Media";
                    InStr: InStream;
                    OutStr: OutStream;
                begin
                    if Rec.Picture.Count > 0 then begin
                        ItemTenantMedia.Get(Rec.Picture.Item(1));
                        ItemTenantMedia.CalcFields(Content);
                        ItemTenantMedia.Content.CreateInStream(InStr);
                        Rec."Blob Picture".CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                        Rec.Modify(true);
                    end;
                end;
            }
        }

        addlast(Promoted)
        {
            actionref(ShowSaleCreditLine_Promoted; "Show Sales Credit Lines")
            {
            }
            actionref(Reset_Promoted; Reset)
            {
            }
            actionref(CopyBlobPicturetoPicture_Promoted; CopyBlobPicturetoPicture)
            {
            }
            actionref(CopyPicturetoBlobPicture_Promoted; CopyPicturetoBlobPicture)
            {
            }
        }
    }
}