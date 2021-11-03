pageextension 50020 PurchaseInvoiceExt extends 51
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
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Caption = 'Department Approver';
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