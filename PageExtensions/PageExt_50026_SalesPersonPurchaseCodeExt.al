pageextension 50026 SalesPersonPurchaseCodeExt extends 5116
{
    layout
    {
        addafter("Commission %")
        {
            field("PrivacyBlocked"; "Privacy Blocked")
            {
                Caption = 'PO Approver';
                Editable = true;
            }
        }
        addlast(General)
        {
            field("Requisition Approver"; "Requisition Approver")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    /*trigger OnOpenPage()
    var
        salespersonpurchaserec: Record "Salesperson/Purchaser";
    begin
        salespersonpurchaserec.Reset();
        salespersonpurchaserec.SetRange("Privacy Blocked", true);


    end;
    */
}