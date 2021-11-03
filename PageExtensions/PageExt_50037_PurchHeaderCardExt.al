pageextension 50037 PurchHeaderCard extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Prepared By"; "Prepared By")
            {
                ApplicationArea = All;
                //LS29062021
                Editable = false;

            }
            field(ApprovedBy; ApprovedBy)
            {
                ApplicationArea = all;
            }
            field("PostingDescription"; "Posting Description")
            {
                ShowMandatory = NOT IsBlank;
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
    trigger OnAfterGetRecord()
    begin
        CurrPage."Documents Drop Box".Page.SetTable(Rec); //DropArea1.0 
    end;

    var
        IsBlank: Boolean;
}