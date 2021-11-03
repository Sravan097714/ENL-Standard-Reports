pageextension 50027 SalesPersonPOApprover extends 14
{
    layout
    {
        addafter("Privacy Blocked")
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

    var
        myInt: Integer;
}