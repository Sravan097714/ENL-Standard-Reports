tableextension 50069 SalesPersonPurchaseTable extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; "Requisition Approver"; Boolean)
        {
            Editable = true;
            Caption = 'Requisition Approver';
        }
    }

    var
        myInt: Integer;
}