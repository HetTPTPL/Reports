pageextension 50152 "TSE Payment Journal Page Ext" extends "Payment Journal"
{

    actions
    {
        addlast(processing)
        {
            action("Go to Account")
            {
                Caption = 'Go to Account';
                ToolTip = 'Go to Account';
                ApplicationArea = All;
                Image = View;

                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                    VendorRec: Record Vendor;
                    GLAccountRec: Record "G/L Account";
                    BankAccountRec: Record "Bank Account";
                    EmployeeRec: Record "Employee";
                    FixedAssestRec: Record "Fixed Asset";
                    ICPartnerRec: Record "IC Partner";
                    AllocationAccountRec: Record "Allocation Account";
                begin
                    // AccountType := Rec."Account Type";
                    // AccountNo := Rec."Account No.";
                    case Rec."Account Type" of
                        Rec."Account Type"::Customer:
                                if CustomerRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"Customer Card", CustomerRec);
                            
                        
                        Rec."Account Type"::Vendor:
                                if VendorRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"Vendor Card", VendorRec);
                            
                        
                        Rec."Account Type"::"Bank Account":
                                if BankAccountRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"Bank Account Card", BankAccountRec);
                            
                        
                        Rec."Account Type"::"G/L Account":
                                if GLAccountRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"G/L Account Card", GLAccountRec);
                            
                        
                        Rec."Account Type"::Employee:
                                if EmployeeRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"Employee Card", EmployeeRec);
                            

                        Rec."Account Type"::"Fixed Asset":
                                if FixedAssestRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"Fixed Asset Card", FixedAssestRec);
                            

                        Rec."Account Type"::"Allocation Account":
                                if AllocationAccountRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"Allocation Account", AllocationAccountRec);
                            

                        Rec."Account Type"::"IC Partner":
                                if ICPartnerRec.Get(Rec."Account No.") then
                                    Page.Run(Page::"IC Partner Card", ICPartnerRec);
                            
                    end;
                end;
            }
        }
        addlast(Promoted)
        {
            actionref(GoToAccount_Promoted; "Go to Account")
            {

            }
        }
    }
    
}