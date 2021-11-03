tableextension 50028 SalesLineReportExt extends "Sales Line"
{
    fields
    {
        field(50000; "Extra Weight"; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "Document No.");
                SalesLine.SetRange("Extra Weight", false);
                SalesLine.SetFilter("Line No.", '<%1', "Line No.");
                if SalesLine.FindLast() then
                    "Unit Price" := SalesLine."Unit Price";
            end;
        }
        field(50001; "Extra Weight In Tons"; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "Document No.");
                SalesLine.SetRange("Extra Weight", false);
                SalesLine.SetFilter("Line No.", '<%1', "Line No.");
                SalesLine.SetFilter(Quantity, '<>%1', 0);
                if SalesLine.FindLast() then begin
                    validate("Unit Price", SalesLine."Unit Price In Tons");
                    validate("Unit Price In Tons", SalesLine."Unit Price In Tons");
                end;
            end;
        }
        field(50002; "Unit Price In Tons"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        modify("Description 2")
        {
            Caption = 'Description2';
        }

    }

    var
        myInt: Integer;
}