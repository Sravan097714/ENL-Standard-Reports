tableextension 50002 CompanyInfoExt extends "Company Information"
{
    fields
    {
        field(50006; "Business Registration No."; Code[20])
        {

        }
        field(50007; "Include Company Title"; Boolean)
        {

        }
        field(50008; "Email Address - MRA"; Text[80])
        {

        }
        field(50009; "Picture Statement"; Blob)
        {

        }
        field(50010; "Title Statement"; Boolean)
        {

        }
        field(50011; "PO Instruction"; Text[250])
        {

        }
        field(50012; "Document Footer"; Text[100])
        {

        }
        field(50013; "VAT Payer Tan"; Code[20])
        {

        }
        field(50014; "VAT BRN No."; Code[20])
        {

        }
        field(50015; "Vat Payer Name"; Text[100])
        {

        }
        field(50016; "Telephone Number"; Text[20])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(50017; "Vat Mobile Number"; Text[20])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(50018; "Name of VAT Declarant"; Text[100])
        {

        }
        field(50019; "VAT Email Address"; Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(50020; "MNS"; Code[20])
        {

        }
        field(50021; "VT03"; Code[20])
        {

        }
        field(50022; "V1.0"; Code[20])
        {

        }

        field(50023; "Payment Terms 1"; Text[150])
        {

        }
        field(50024; "Payment Terms 2"; Text[150])
        {

        }
        field(50025; "Payment Terms 3"; Text[150])
        {

        }
        field(50026; "Payment Terms 4"; Text[150])
        {

        }
        field(50027; "Beneficiary Name"; Text[150])
        {
            Caption = 'Beneficiary Name';
        }
        field(50028; "Beneficiary Address"; Text[150])
        {
            Caption = 'Beneficiary Address';
        }
        field(50029; "Bank Address"; Text[150])
        {
            Caption = 'Bank Address';
        }
        field(50030; "Account No"; Text[150])
        {
            Caption = 'Account No';
        }
        field(50031; "Not Bank Name"; Text[150])
        {
            Caption = 'Bank Name';
        }
        field(50032; "Not IBAN"; Code[150])
        {
            Caption = 'IBAN';
        }
        field(50033; "Not SWIFT Code"; Code[20])
        {
            Caption = 'SWIFT Code';
            TableRelation = "SWIFT Code".Code;
        }
        field(50034; "Company Bank Address"; Text[200])
        {
            Caption = 'Bank Address';
        }
        field(50035; "CoverLetterAdminName"; Text[100])
        {
            Caption = 'Name';
        }

        field(50036; "CoverLetterAdminTitle"; Text[100])
        {
            Caption = 'Title';
        }

        field(50037; "NotaryInvoiceVisible"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Notary Invoice Visible';
        }
        field(50038; "Purchase Order Mail-Body"; Text[1000])
        {
            DataClassification = ToBeClassified;

        }
        field(50039; "Sales Invoice Mail-Body"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }

        // field(50037; CoverLetterPicture; BLOB)
        // {
        //     Caption = 'Picture';
        //     SubType = Bitmap;

        //     trigger OnValidate()
        //     begin
        //         PictureUpdated := true;
        //     end;
        // }

    }

    var
        PictureUpdated: Boolean;


}