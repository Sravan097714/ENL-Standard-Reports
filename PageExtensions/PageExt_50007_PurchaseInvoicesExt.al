pageextension 50007 PurchaseInvoicesExt extends 9308
{
    layout
    {
        addafter(Amount)
        {
            field("Prepared By"; "Prepared By")
            {
                ApplicationArea = all;
                Editable = false;
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