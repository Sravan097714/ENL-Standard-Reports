pageextension 50021 PurchaseOrderList extends "Purchase Order List"
{
    layout
    {
        addafter("Posting Description")
        {
            field("Prepared By"; "Prepared By")
            {
                ApplicationArea = all;
            }
            field(ApprovedBy; ApprovedBy)
            {
                ApplicationArea = all;
            }


        }
        modify("Purchaser Code")
        {
            Caption = 'Department Approver';
        }
    }

    actions
    {
        addafter("Send IC Purchase Order")
        {
            action("Archive Document")
            {
                ApplicationArea = Suite;
                Caption = 'Archi&ve Document';
                Image = Archive;
                ToolTip = 'Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.';

                trigger OnAction()
                begin
                    ArchiveManagement.ArchivePurchDocument(Rec);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    var
        myInt: Integer;
        ArchiveManagement: Codeunit ArchiveManagement;
}