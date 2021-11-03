tableextension 50025 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50000; "Prepared By"; Text[80])
        {
            Caption = 'Prepared By';
            TableRelation = User."Full Name";
            ValidateTableRelation = false;
        }
        field(50001; "Documents Attach Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Documents."No.";
            Caption = 'Document Attachment Code';
        }

    }

    var
        myInt: Integer;
        IsBlank: Boolean;

    trigger OnInsert()
    var
        UserRec: Record User;
        UserIdvar: Code[50];
    begin
        UserIdvar := UserId;
        UserRec.SetRange("User Name", UserIdvar);
        "Posting Description" := '';
        if UserRec.FindFirst() then
            "Prepared By" := UserRec."Full Name";
    end;

}