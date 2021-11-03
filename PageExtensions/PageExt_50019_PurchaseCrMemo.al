pageextension 50019 PurchaseCrMemo extends "Purchase Credit Memo"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Prepared By"; "Prepared By")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
        //DropArea1.0 >>
        addbefore(IncomingDocAttachFactBox)
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