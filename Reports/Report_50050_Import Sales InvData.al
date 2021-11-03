report 50050 "Import Sales Inv Data"
{

    Caption = 'ENL - Import Sales Invoice Data';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean;
        begin
            IF CloseAction = ACTION::OK THEN BEGIN
                ServerFileNme := FileMgt.UploadFile(Text000, ExcelExtensionTok);
                IF ServerFileNme = '' THEN
                    EXIT(FALSE);

                SheetName := ExcelBuf.SelectSheetsName(ServerFileNme);
                IF SheetName = '' THEN
                    EXIT(FALSE);




            END;
        end;
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        ExcelBuf.LOCKTABLE;
        ExcelBuf.OpenBook(ServerFileNme, SheetName);
        ExcelBuf.ReadSheet;
        GetLastRowandColumn;

        FOR X := 2 TO TotalRows DO
            InsertData(X);

        ExcelBuf.DELETEALL;

        MESSAGE('Import Completed');
    end;

    var
        ExcelBuf: Record "Excel Buffer";
        ServerFileNme: Text[250];
        SheetName: Text[250];
        TotalColumns: Integer;
        TotalRows: Integer;
        X: Integer;
        ExcelBuf1: Record "Excel Buffer";
        FileMgt: Codeunit "File Management";
        Text000: Label 'Import Data';
        ExcelExtensionTok: Text[250];
        SalesLine: Record "Sales Line";
        SalesHdr: Record "Sales Header";
        Qty: Decimal;
        UnitPrice: Decimal;
        DateGVar: Date;

    procedure GetLastRowandColumn();
    begin
        ExcelBuf.SETRANGE(ExcelBuf."Row No.", 1);
        TotalColumns := ExcelBuf.COUNT;

        ExcelBuf.RESET;
        IF ExcelBuf.FINDLAST THEN
            TotalRows := ExcelBuf."Row No.";
    end;

    procedure InsertData(RowNo: Integer);
    var
        SalesHdrLRec: Record "Sales Header";
    begin
        Clear(Qty);
        Clear(UnitPrice);
        if GetValueAtCell(RowNo, 1) <> '' then
            Evaluate(DateGVar, GetValueAtCell(RowNo, 1));
        IF (GetValueAtCell(RowNo, 2) = '') or ((GetValueAtCell(RowNo, 3) = '')) then
            exit;
        SalesHdrLRec.Reset();
        SalesHdrLRec.SetRange("External Document No.", GetValueAtCell(RowNo, 2));
        if not SalesHdrLRec.FindFirst() then begin
            SalesHdr.Init();
            SalesHdr."Document Type" := SalesHdr."Document Type"::Invoice;
            SalesHdr."No." := '';
            SalesHdr.Insert(true);
            SalesHdr.Validate("Sell-to Customer No.", GetValueAtCell(RowNo, 3));
            SalesHdr.Validate("Posting Date", DateGVar);
            SalesHdr.Validate("External Document No.", GetValueAtCell(RowNo, 2));
            SalesHdr.Validate("Posting Description", GetValueAtCell(RowNo, 4));
            SalesHdr.Validate("Shortcut Dimension 1 Code", 'COR');
            SalesHdr.Validate("Shortcut Dimension 2 Code", 'CORPORATE');
            SalesHdr.Modify(true);

            InsertLine(RowNo, SalesHdr);

        end else
            InsertLine(RowNo, SalesHdrLRec);
    end;


    procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text;
    begin
        IF ExcelBuf1.GET(RowNo, ColNo) THEN
            EXIT(ExcelBuf1."Cell Value as Text");
    end;

    local procedure InsertLine(RowNo: Integer; SalesHdrPar: Record "Sales Header")
    var
        Type: Integer;
        SalesLineLRec: Record "Sales Line";
        DimMgt: Codeunit DimensionManagement;
    begin
        Clear(Type);
        SalesLineLRec.SetRange("Document Type", SalesHdrPar."Document Type"::Invoice);
        SalesLineLRec.SetRange("Document No.", SalesHdrPar."No.");
        if SalesLineLRec.FindLast() then;

        SalesLine.Init();
        SalesLine.Validate("Document Type", SalesHdrPar."Document Type"::Invoice);
        SalesLine.Validate("Document No.", SalesHdrPar."No.");
        SalesLine.Validate("Line No.", SalesLineLRec."Line No." + 10000);
        SalesLine.Insert(true);
        if GetValueAtCell(RowNo, 5) <> '' then
            Evaluate(Type, GetValueAtCell(RowNo, 5));
        case Type of
            2:
                SalesLine.Validate(Type, SalesLine.Type::Item);
            1:
                SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
            5:
                SalesLine.Validate(Type, SalesLine.Type::"Charge (Item)");
            4:
                SalesLine.Validate(Type, SalesLine.Type::"Fixed Asset");
            3:
                SalesLine.Validate(Type, SalesLine.Type::Resource);
        end;
        SalesLine.Validate("No.", GetValueAtCell(RowNo, 6));
        if GetValueAtCell(RowNo, 7) <> '' then
            SalesLine.Validate(Description, GetValueAtCell(RowNo, 7));
        if GetValueAtCell(RowNo, 8) <> '' then
            SalesLine.Validate("Description 2", GetValueAtCell(RowNo, 8));
        if GetValueAtCell(RowNo, 9) <> '' then
            Evaluate(Qty, GetValueAtCell(RowNo, 9));
        SalesLine.Validate(quantity, Qty);
        if GetValueAtCell(RowNo, 10) <> '' then
            Evaluate(UnitPrice, GetValueAtCell(RowNo, 10));
        SalesLine.Validate("Unit Price", UnitPrice);
        if SalesLine."Gen. Prod. Posting Group" = '' then
            SalesLine.Validate("Gen. Prod. Posting Group", GetValueAtCell(RowNo, 11));
        if SalesLine."VAT Prod. Posting Group" = '' then
            SalesLine.Validate("VAT Prod. Posting Group", GetValueAtCell(RowNo, 12));
        SalesLine.Validate("Shortcut Dimension 1 Code", GetValueAtCell(RowNo, 13));
        SalesLine.Validate("Shortcut Dimension 2 Code", GetValueAtCell(RowNo, 14));
        SalesLine.Modify(true);
    end;
}

