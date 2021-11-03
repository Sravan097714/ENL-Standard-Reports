pageextension 50029 PostedPurchCrMemoSubformExt extends 141
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
        addafter("Deferral Code")
        {
            field("ShortcutDimension 1 Code"; "Shortcut Dimension 1 Code")
            {
                ApplicationArea = all;
            }
            field("ShortcutDimension 2 Code"; "Shortcut Dimension 2 Code")
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