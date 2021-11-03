table 50000 "Cheque Remittance"
{

    fields
    {
        field(1; "No."; Integer)
        {

        }
        field(2; Name; Text[100])
        {
        }
        field(4; Addr1; Text[30])
        {
        }
        field(5; Addr2; Text[30])
        {
        }
        field(6; City; Text[30])
        {
        }
        field(7; Country; Text[30])
        {
        }
        field(8; ExtDocNo; Text[30])
        {
        }
        field(9; Date; Date)
        {
        }
        field(10; Details; Text[100])
        {
        }
        field(11; Amount; Decimal)
        {
        }
        field(12; PrintDate; Text[30])
        {
        }
        field(13; DocNo; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
        key(Key2; DocNo)
        {
        }
    }

    fieldgroups
    {
    }
}

