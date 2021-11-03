tableextension 50004 PurchaseHdrExt extends "Purchase Header"
{
    fields
    {
        field(50028; "Prepared By"; Text[80])
        {
            Caption = 'Prepared By';
            TableRelation = User."Full Name";
            ValidateTableRelation = false;
        }
        field(50029; ApprovedBy; Code[50])
        {
            FieldClass = FlowField;
            Caption = 'Approved By';
            CalcFormula = lookup("Approval Entry"."Approver ID" where("Document No." = field("No.")));
        }
        modify("Purchaser Code")
        {
            Caption = 'Department Approver';
        }
    }

    trigger OnInsert()
    var
        UserRec: Record User;
        UserIdvar: Code[50];
    begin
        "Posting Description" := '';
        UserIdvar := UserId;
        UserRec.SetRange("User Name", UserIdvar);
        if UserRec.FindFirst() then
            "Prepared By" := UserRec."Full Name";
    end;
}