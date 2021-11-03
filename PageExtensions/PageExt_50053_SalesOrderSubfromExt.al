pageextension 50053 SalesSubformExt extends "Sales Order Subform"
{

    layout
    {
        addafter(Description)
        {
            field("Extra Weight"; "Extra Weight")
            {
                ApplicationArea = all;
            }
            field("Extra Weight In Tons"; "Extra Weight In Tons")
            {
                ApplicationArea = all;
            }

        }
        modify("Unit Price")
        {
            Editable = not "Extra Weight";
        }
        addafter("Unit Price")
        {
            field("Unit Price In Tons"; "Unit Price In Tons")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {


    }

    var
        myInt: Integer;
}