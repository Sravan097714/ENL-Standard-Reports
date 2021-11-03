tableextension 50005 SalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "Documents Attach Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Documents."No.";
            Caption = 'Document Attachment Code';
        }
    }

    var
        myInt: Integer;
}