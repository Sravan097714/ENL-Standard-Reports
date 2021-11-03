codeunit 50001 "GetMultipleRecords Template"
{

    trigger OnRun()
    begin
    end;

    var
        tmpItem: Record 27 temporary;
        tmpCustomer: Record 18 temporary;
        tmpVendor: Record 23 temporary;
        tmpSalesperson: Record 13 temporary;

    procedure GetItem(var OrecItem: Record 27; IblnErrorIfNotFound: Boolean; IcodItemNo: Code[20]) OblnRecordFound: Boolean
    var
        LrecItem: Record 27;
    begin
        OblnRecordFound :=
          (tmpItem."No." = IcodItemNo);

        IF NOT OblnRecordFound THEN
            OblnRecordFound := tmpItem.GET(IcodItemNo);

        IF NOT OblnRecordFound THEN BEGIN
            CLEAR(tmpItem);
            IF IblnErrorIfNotFound THEN BEGIN
                LrecItem.GET(IcodItemNo);
                OblnRecordFound := TRUE;
            END
            ELSE
                OblnRecordFound := LrecItem.GET(IcodItemNo);

            IF OblnRecordFound THEN BEGIN
                tmpItem := LrecItem;
                tmpItem.INSERT(FALSE);
            END;
        END;

        OrecItem := tmpItem;
    end;

    procedure GetCustomer(var OrecCustomer: Record 18; IblnErrorIfNotFound: Boolean; IcodCustomerNo: Code[20]) OblnRecordFound: Boolean
    var
        LrecCustomer: Record 18;
    begin
        OblnRecordFound :=
          (tmpCustomer."No." = IcodCustomerNo);

        IF NOT OblnRecordFound THEN
            OblnRecordFound := tmpCustomer.GET(IcodCustomerNo);

        IF NOT OblnRecordFound THEN BEGIN
            CLEAR(tmpCustomer);
            IF IblnErrorIfNotFound THEN BEGIN
                IF LrecCustomer.GET(IcodCustomerNo) THEN
                    OblnRecordFound := TRUE
                ELSE
                    OblnRecordFound := FALSE;
            END
            ELSE
                OblnRecordFound := LrecCustomer.GET(IcodCustomerNo);

            IF OblnRecordFound THEN BEGIN
                tmpCustomer := LrecCustomer;
                tmpCustomer.INSERT(FALSE);
            END;
        END;

        OrecCustomer := tmpCustomer;
    end;

    procedure GetVendor(var OrecVendor: Record 23; IblnErrorIfNotFound: Boolean; IcodVendorNo: Code[20]) OblnRecordFound: Boolean
    var
        LrecVendor: Record 23;
    begin
        OblnRecordFound :=
          (tmpVendor."No." = IcodVendorNo);

        IF NOT OblnRecordFound THEN
            OblnRecordFound := tmpVendor.GET(IcodVendorNo);

        IF NOT OblnRecordFound THEN BEGIN
            CLEAR(tmpVendor);
            IF IblnErrorIfNotFound THEN BEGIN
                IF LrecVendor.GET(IcodVendorNo) THEN
                    OblnRecordFound := TRUE
                ELSE
                    OblnRecordFound := FALSE;
            END
            ELSE
                OblnRecordFound := LrecVendor.GET(IcodVendorNo);

            IF OblnRecordFound THEN BEGIN
                tmpVendor := LrecVendor;
                tmpVendor.INSERT(FALSE);
            END;
        END;

        OrecVendor := tmpVendor;
    end;

    procedure GetSalesperson(var OrecSalesperson: Record 13; IblnErrorIfNotFound: Boolean; IcodSalespersonCode: Code[20]) OblnRecordFound: Boolean
    var
        LrecSalesperson: Record 13;
    begin
        OblnRecordFound :=
          (tmpSalesperson.Code = IcodSalespersonCode);

        IF NOT OblnRecordFound THEN
            OblnRecordFound := tmpSalesperson.GET(IcodSalespersonCode);

        IF NOT OblnRecordFound THEN BEGIN
            CLEAR(tmpSalesperson);
            IF IblnErrorIfNotFound THEN BEGIN
                IF LrecSalesperson.GET(IcodSalespersonCode) THEN
                    OblnRecordFound := TRUE
                ELSE
                    OblnRecordFound := FALSE;
            END
            ELSE
                OblnRecordFound := LrecSalesperson.GET(IcodSalespersonCode);

            IF OblnRecordFound THEN BEGIN
                tmpSalesperson := LrecSalesperson;
                tmpSalesperson.INSERT(FALSE);
            END;
        END;

        OrecSalesperson := tmpSalesperson;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnBeforeValidateEvent', 'Quantity', false, false)]
    procedure updateUnitprice(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        SalesLine: Record "Sales Line";
    begin
        if Rec."Extra Weight" then begin
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."Document No.");
            SalesLine.SetRange("Extra Weight", false);
            //SalesLine.SetFilter("Line No.", '<%1', Rec."Line No.");
            if SalesLine.FindLast() then begin
                Rec.validate("Unit Price", SalesLine."Unit Price");
            end;
        end;
        if Rec."Extra Weight In Tons" then begin
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."Document No.");
            SalesLine.SetRange("Extra Weight In Tons", false);
            //SalesLine.SetFilter("Line No.", '<%1', Rec."Line No.");
            if SalesLine.FindLast() then begin
                Rec.validate("Unit Price", SalesLine."Unit Price In Tons");
                Rec.validate("Unit Price In Tons", SalesLine."Unit Price In Tons");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterInsertEvent', '', false, false)]
    procedure updateInitUnitprice(var Rec: Record "Sales Line"; RunTrigger: Boolean)
    var
        SalesLine: Record "Sales Line";
        SalesHead: Record "Sales Header";
    begin
        if Rec."Document Type" = Rec."Document Type"::Order then begin
            SalesHead.Get(Rec."Document Type", Rec."Document No.");
            if SalesHead.Status = SalesHead.Status::Open then begin
                if Rec."Extra Weight" then begin
                    SalesLine.Reset();
                    SalesLine.SetRange("Document Type", Rec."Document Type");
                    SalesLine.SetRange("Document No.", Rec."Document No.");
                    SalesLine.SetRange("Extra Weight", false);
                    SalesLine.SetFilter("Line No.", '<%1', Rec."Line No.");
                    if SalesLine.FindLast() then begin
                        Rec.validate("Unit Price", SalesLine."Unit Price");
                        Rec.Modify(true);
                    end;
                end;
                if Rec."Extra Weight In Tons" then begin
                    SalesLine.Reset();
                    SalesLine.SetRange("Document Type", Rec."Document Type");
                    SalesLine.SetRange("Document No.", Rec."Document No.");
                    SalesLine.SetRange("Extra Weight In Tons", false);
                    SalesLine.SetFilter("Line No.", '<%1', Rec."Line No.");
                    if SalesLine.FindLast() then begin
                        Rec.validate("Unit Price", SalesLine."Unit Price In Tons");
                        Rec.validate("Unit Price In Tons", SalesLine."Unit Price In Tons");
                        Rec.Modify(true);
                    end;
                end;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 260, 'OnBeforeSendEmail', '', false, false)]
    local procedure OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20]; var HideDialog: Boolean; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var IsHandled: Boolean; EmailDocName: Text[250]; SenderUserID: Code[50]; EmailScenario: Enum "Email Scenario")
    var
        txtCRLF: array[2] of Text;
        companyinformationrec: Record "Company Information";
        documentattachmentrec: Record Documents;
        SalesInvHdr: Record "Sales Invoice Header";
        attachmentrec: Record Attachment;
        outStream: OutStream;
        inStream: instream;
        i: Integer;
        officemgmt: Codeunit "Office Management";
        tempblobcodeunit: Codeunit "Temp Blob";
    //Mail: Codeunit "SMTP Mail Setup";
    begin
        if EmailDocName = 'Purchase Order' then begin
            txtCRLF[1] := '10';
            txtCRLF[2] := '12';
            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'La Place du Village Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Purchase Order Mail-Body";
            // TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on tbhoyroo@enl.mu; dchummun@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Tej Bhoyroo');


            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'Courchamps Properties Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Purchase Order Mail-Body";

            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on ahofthed@enl.mu; mvencatapillay@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Anne Sophie Hofthed');


            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'Moka Residential Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Purchase Order Mail-Body";
            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on mlabour@enl.mu; mvencatapillay@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Melissa Labour');

            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'Moka City Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Purchase Order Mail-Body";
            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on mlabour@enl.mu; mvencatapillay@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Melissa Labour');
        end;
        if EmailDocName = 'Sales Invoice' then begin
            txtCRLF[1] := '10';
            txtCRLF[2] := '12';
            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'La Place du Village Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Sales Invoice Mail-Body";
            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on tbhoyroo@enl.mu; dchummun@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Tej Bhoyroo');


            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'Courchamps Properties Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Sales Invoice Mail-Body";
            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on ahofthed@enl.mu; mvencatapillay@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Anne Sophie Hofthed');


            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'Moka Residential Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Sales Invoice Mail-Body";
            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on mlabour@enl.mu; mvencatapillay@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Melissa Labour');

            companyinformationrec.Reset();
            companyinformationrec.SetRange(Name, 'Moka City Limited');
            if companyinformationrec.FindFirst then
                TempEmailItem.SetBodyText := companyinformationrec."Sales Invoice Mail-Body";
            //TempEmailItem.SetBodyText('Dear Collaborator,' + '<br><br>' + 'Please find enclosed requested Purchase Order for your further handling.' + '<br><br>' + 'Kindly send the corresponding invoice on mlabour@enl.mu; mvencatapillay@enl.mu.' + '<br><br>' + 'Do not hesitate to contact us if you need any additional information.' + '<br><br>' + 'Regards,' + '<br><br>' + 'Melissa Labour');
            if not SalesInvHdr.Get(PostedDocNo) then
                exit;
            documentattachmentrec.Reset();
            documentattachmentrec.SetRange("No.", SalesInvHdr."Documents Attach Code");
            if documentattachmentrec.FindSet then begin
                repeat
                    if documentattachmentrec."Document Reference ID".HasValue then begin
                        tempblobcodeunit.CreateOutStream(outStream);
                        documentattachmentrec."Document Reference ID".ExportStream(outStream);
                        tempblobcodeunit.CreateInStream(inStream);
                        TempEmailItem.AddAttachment(inStream, documentattachmentrec."File Name" + '.' + documentattachmentrec."File Extension");
                    end;
                until documentattachmentrec.Next() = 0;
            end;
        end;
    end;
}

