pageextension 50028 PostedSalesCrMemoSubformExt extends 135
{
    layout
    {
        addafter("Line Amount")
        {
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Description 2"; "Description 2") { ApplicationArea = all; }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}