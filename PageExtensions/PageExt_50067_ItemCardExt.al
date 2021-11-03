pageextension 50067 ItemCardExt extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        //DropArea1.0 >>
        addafter(ItemPicture)
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
        myInt: Integer;
}