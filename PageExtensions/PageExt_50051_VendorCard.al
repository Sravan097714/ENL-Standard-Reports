pageextension 50051 VendorCardExt extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("Business Registraton No."; "Business Registraton No.")
            {
                Editable = false;
                ApplicationArea = all;
            }
            field("Search Name "; "Search Name")
            {
                ApplicationArea = all;
            }
        }
        moveafter("Business Registraton No."; "VAT Registration No.")
        addafter(Name)
        {
            /* field(Payee; Payee)
            {
                ApplicationArea = all;
            } */
        }
        //DropArea1.0 >>
        addafter(VendorStatisticsFactBox)
        {
            part("Documents Drop Box"; "Drop Area FactBox")
            {
                ApplicationArea = All;
                Caption = 'Documents Drop Box';
            }
        }
        //DropArea1.0 <<
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
        CurrPage."Documents Drop Box".Page.SetTable(Rec); //DropArea1.0 
    end;

    var



}