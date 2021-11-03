tableextension 50000 CustomerExt extends Customer
{
    fields
    {

        field(50002; "Business Registration No."; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Created From Portal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "NID"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Business Registraton No."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Statement"; boolean)
        {

        }
        // field(50002; NID; Code[14])
        // {
        // }
        // field(50003; BRN; text[30])
        // {

        // }
    }

    var
}