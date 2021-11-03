tableextension 50029 SalesInvoiceLineReportExt extends "Sales Invoice Line"
{
    fields
    {
        field(50000; "Extra Weight"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Extra Weight In Tons"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "Unit Price In Tons"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}