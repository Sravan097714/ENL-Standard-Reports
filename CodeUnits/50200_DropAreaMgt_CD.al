codeunit 50004 "Drop Area Management"
{
    // FM1 - new func FileDropAPIServiceDocument()
    // FM2 - new func FileDropEndCreditLine


    // JL191211 - Document primary key property "AutoIncrement" set to yes.


    trigger OnRun()
    begin
    end;

    var
        ReadAsDataUrlHeader: Label 'data:';
        ProgressText: Label 'File upload in progress...\#1########################################\@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';
        CurrentFilename: Text;
        FromMemoryStream: DotNet MemoryStream;
        FileDropInProgress: Boolean;
        Attachment: Record Attachment;
        FileMgt: Codeunit "File Management";
        //Document: Record Document;


        "-FM1-LO201104": Integer;
    //ProcessServiceAPIRequest: Codeunit "Process Service API Request";

    procedure FromBase64Transform(var SourceMemoryStream: DotNet MemoryStream; var DestinationMemoryStream: DotNet MemoryStream): Integer
    var
        FromBase64Transform: DotNet FromBase64Transform;
        FromBase64TransformMode: DotNet FromBase64TransformMode;
        InputBuffer: DotNet Array;
        OutputBuffer: DotNet Array;
        Byte: DotNet Byte;
        BytesRead: Integer;
        BytesWritten: Integer;
        InputLength: Integer;
    begin
        FromBase64Transform := FromBase64Transform.FromBase64Transform(FromBase64TransformMode.IgnoreWhiteSpaces);

        OutputBuffer := OutputBuffer.CreateInstance(GetDotNetType(Byte), FromBase64Transform.OutputBlockSize);
        InputBuffer := SourceMemoryStream.GetBuffer();

        BytesRead := 0;
        InputLength := SourceMemoryStream.Length();

        while ((InputLength - BytesRead) > 4) do begin
            BytesWritten := FromBase64Transform.TransformBlock(InputBuffer, BytesRead, 4, OutputBuffer, 0);
            BytesRead += 4;
            DestinationMemoryStream.Write(OutputBuffer, 0, BytesWritten);
        end;

        OutputBuffer := FromBase64Transform.TransformFinalBlock(InputBuffer, BytesRead, InputLength - BytesRead);
        DestinationMemoryStream.Write(OutputBuffer, 0, OutputBuffer.Length);

        FromBase64Transform.Clear();
    end;


    procedure Base64Decode(var SourceMemoryStream: DotNet MemoryStream; var DestinationMemoryStream: DotNet MemoryStream): Integer
    var
        Buffer: DotNet Array;
        Convert: DotNet Convert;
        Encoding: DotNet Encoding;
        String: DotNet String;
        InputLength: Integer;
    begin
        Encoding := Encoding.Default;
        Buffer := SourceMemoryStream.GetBuffer();

        InputLength := SourceMemoryStream.Length;
        String := Encoding.GetString(Buffer, 0, InputLength);

        Buffer := Convert.FromBase64String(String);

        InputLength := Buffer.Length;
        DestinationMemoryStream.Write(Buffer, 0, InputLength);
    end;


    procedure FileDropBegin(Filename: Text)
    begin
        FileDropInProgress := true;
        CurrentFilename := Filename;

        FromMemoryStream := FromMemoryStream.MemoryStream();
    end;


    procedure FileDrop(Data: Text)
    var
        Encoding: DotNet Encoding;
    begin
        if StrPos(Data, ReadAsDataUrlHeader) <> 0 then
            Data := CopyStr(Data, StrPos(Data, ',') + 1);

        Encoding := Encoding.Default;
        FromMemoryStream.Write(Encoding.GetBytes(Data), 0, StrLen(Data));
    end;


    procedure FileDropEnd()
    var
        ToMemoryStream: DotNet MemoryStream;
        FileStream: DotNet FileStream;
        FileMode: DotNet FileMode;
        FileAccess: DotNet FileAccess;
        OStream: OutStream;
    begin
        ToMemoryStream := ToMemoryStream.MemoryStream();
        Base64Decode(FromMemoryStream, ToMemoryStream);

        Attachment.INSERT(TRUE);
        Attachment."Attachment File".CREATEOUTSTREAM(OStream);
        ToMemoryStream.WriteTo(OStream);
        Attachment."File Extension" := COPYSTR(UPPERCASE(FileMgt.GetExtension(CurrentFilename)), 1, 250);
        //Attachment."S4L File Name" := CurrentFilename;
        Attachment.MODIFY;
        IF Attachment."File Extension" <> 'DOCX' THEN
            Attachment."Read Only" := TRUE
        ELSE
            Attachment."Read Only" := FALSE;

        ToMemoryStream.Close();
        FromMemoryStream.Close();

        CLEAR(OStream);
        CLEAR(CurrentFilename);
        FileDropInProgress := FALSE;
    end;


    procedure IsFileDropInProgress(): Boolean
    begin
        exit(FileDropInProgress);
    end;


    procedure GetCurrentFilename(): Text
    begin
        exit(CurrentFilename);
    end;


    procedure ImportAttachmentSilent(FileNameLPar: Text): Integer
    var
        Attachment: Record Attachment;
        AtachmentLRec: Record Attachment;
        NoLVar: Integer;
        FileInstream: InStream;
        AttachmentOutstream: OutStream;
        TempFile: File;
    begin
        if AtachmentLRec.FindLast then
            NoLVar := AtachmentLRec."No." + 1
        else
            NoLVar := 1;

        Attachment.Init;
        Attachment."No." := NoLVar;
        Attachment.Insert(true);


        TempFile.Open(FileNameLPar);//Open the PDF in the file datatype
        TempFile.CreateInStream(FileInstream);//Creating the instream of the file datatype


        Attachment."Attachment File".CreateOutStream(AttachmentOutstream);//Creating the outstream for the blob field attachment file
        CopyStream(AttachmentOutstream, FileInstream);//Copying the file from the instream to outstream



        Attachment."File Extension" := '.pdf';
        //Attachment."S4L File Name" := 'PDF BLOB';
        Attachment.Modify;
        Attachment."Read Only" := true;
        exit(Attachment."No.");
    end;


    procedure FileDropEndContract()
    var
        ToMemoryStream: DotNet MemoryStream;
        FileStream: DotNet FileStream;
        FileMode: DotNet FileMode;
        FileAccess: DotNet FileAccess;
        OStream: OutStream;
    //DocSelection: Record "Doc. Selection";
    //LeasingSetup: Record "Leasing Setup";
    begin
        //LeasingSetup.Get();

        ToMemoryStream := ToMemoryStream.MemoryStream();

        Base64Decode(FromMemoryStream, ToMemoryStream);
        Attachment.Insert(true);
        Attachment."Attachment File".CreateOutStream(OStream);
        ToMemoryStream.WriteTo(OStream);
        Attachment."File Extension" := CopyStr(UpperCase(FileMgt.GetExtension(CurrentFilename)), 1, 250);
        //Attachment."S4L File Name" := CurrentFilename;
        Attachment.Modify;
        if Attachment."File Extension" <> 'DOCX' then begin
            Attachment."Read Only" := true;
        end else begin
            Attachment."Read Only" := false;
        end;
        /*
        Document.Init;
        Document."Entry No." := 0; //JL191211
        Document.Insert(true);
        Document."Key Code 1" := Contract."Contract No.";
        Document."Table ID" := DATABASE::Contract;

        DocSelection.SetRange("Financial Product", Contract."Financial Product");
        if Contract."Individual/Business" = Contract."Individual/Business"::Business then begin
            DocSelection.SetRange("Individual/Business", DocSelection."Individual/Business"::Business);
            DocSelection.SetRange("Legal Form", Contract."Legal Form");
            if DocSelection.IsEmpty then
                DocSelection.SetRange("Legal Form", '');
        end;
        if Contract."Individual/Business" = Contract."Individual/Business"::Individual then
            DocSelection.SetRange("Individual/Business", DocSelection."Individual/Business"::Individual);
        if DocSelection.IsEmpty then
            DocSelection.SetRange("Individual/Business", DocSelection."Individual/Business"::Any);

        if DocSelection.FindFirst then
            Document."Document Type Code" := DocSelection."Drop Area Document Type"
        else begin
            DocSelection.SetRange("Financial Product", '');
            DocSelection.SetRange("Language Code", '');
            if Contract."Individual/Business" = Contract."Individual/Business"::Business then begin
                DocSelection.SetRange("Individual/Business", DocSelection."Individual/Business"::Business);
                DocSelection.SetRange("Legal Form", Contract."Legal Form");
                if DocSelection.IsEmpty then
                    DocSelection.SetRange("Legal Form", '');
            end;
            if Contract."Individual/Business" = Contract."Individual/Business"::Individual then
                DocSelection.SetRange("Individual/Business", DocSelection."Individual/Business"::Individual);
            if DocSelection.IsEmpty then
                DocSelection.SetRange("Individual/Business", DocSelection."Individual/Business"::Any);
            DocSelection.FindFirst;
            Document."Document Type Code" := DocSelection."Drop Area Document Type";
        end;

        if Document."Document Type Code" = '' then
            Document."Document Type Code" := LeasingSetup."Doc. Type for Uploaded Docs.";

        Document.Description := Attachment."S4L File Name";
        Document."Attachment No." := Attachment."No.";
        Document.Modify;
        */
        ToMemoryStream.Close();
        FromMemoryStream.Close();

        Clear(OStream);
        Clear(CurrentFilename);

        FileDropInProgress := false;
    end;

    local procedure "--FMI1-LO201104"()
    begin
    end;

    procedure FileDropEnd2()
    var
        ToMemoryStream: DotNet MemoryStream;
        FileStream: DotNet FileStream;
        FileMode: DotNet FileMode;
        FileAccess: DotNet FileAccess;
        OStream: OutStream;
        IStream: InStream;
        Document: Record Documents;
        TempBlob: Codeunit "Temp Blob";
    begin
        ToMemoryStream := ToMemoryStream.MemoryStream();

        Base64Decode(FromMemoryStream, ToMemoryStream);

        Document.Init();
        Document.ID := 0;
        Attachment."Attachment File".CreateInStream(IStream);
        ToMemoryStream.WriteTo(IStream);

        Document."Document Reference ID".ImportStream(IStream, '');
        Document.validate("File Extension", FileMgt.GetExtension(CurrentFilename));
        Document."File Name" := CopyStr(FileMgt.GetFileNameWithoutExtension(CurrentFilename), 1, 250);
        Document.Description := Document."File Name";
        Document."Attached Date" := CurrentDateTime;
        Document.INSERT(TRUE);

        ToMemoryStream.Close();
        FromMemoryStream.Close();

        CLEAR(OStream);
        CLEAR(CurrentFilename);

        FileDropInProgress := FALSE;

    end;

    procedure FileDropEndBasePages(VariantPar: Variant)
    var
        ToMemoryStream: DotNet MemoryStream;
        FileStream: DotNet FileStream;
        FileMode: DotNet FileMode;
        FileAccess: DotNet FileAccess;
        OStream: OutStream;
        IStream: InStream;
        TempBlob: Codeunit "Temp Blob";
        DocAtt: Record "Document Attachment";
        RecRef: RecordRef;
    begin
        ToMemoryStream := ToMemoryStream.MemoryStream();

        Base64Decode(FromMemoryStream, ToMemoryStream);

        RecRef.GetTable(VariantPar);
        Tempblob.CreateInStream(IStream);
        ToMemoryStream.WriteTo(IStream);
        DocAtt.SaveAttachmentFromStream(IStream, RecRef, CurrentFilename);

        ToMemoryStream.Close();
        FromMemoryStream.Close();

        CLEAR(IStream);
        CLEAR(CurrentFilename);

        FileDropInProgress := FALSE;

    end;

    procedure FileDropAPIServiceDocument()
    var
        ToMemoryStream: DotNet MemoryStream;
        FileStream: DotNet FileStream;
        FileMode: DotNet FileMode;
        FileAccess: DotNet FileAccess;
        OStream: OutStream;
        //DocSelection: Record "Doc. Selection";
        //ServiceAPIDoc: Record "Service API Document";
        ServiceAPIEntryNo: Integer;
    begin
        ToMemoryStream := ToMemoryStream.MemoryStream();

        Base64Decode(FromMemoryStream, ToMemoryStream);
        /*
        ServiceAPIEntryNo := 1;
        ServiceAPIDoc.RESET;
        IF ServiceAPIDoc.FINDLAST THEN
          ServiceAPIEntryNo := ServiceAPIDoc."Entry No." + 1;

        ServiceAPIDoc.INIT;
        ServiceAPIDoc."Entry No." := ServiceAPIEntryNo;
        ServiceAPIDoc.INSERT;
        */


        Attachment.INSERT(TRUE);
        Attachment."Attachment File".CREATEOUTSTREAM(OStream);
        ToMemoryStream.WriteTo(OStream);
        Attachment."File Extension" := COPYSTR(UPPERCASE(FileMgt.GetExtension(CurrentFilename)), 1, 250);
        //Attachment."S4L File Name" := CurrentFilename;
        Attachment.MODIFY;
        IF Attachment."File Extension" <> 'DOCX' THEN BEGIN
            Attachment."Read Only" := TRUE;
        END ELSE BEGIN
            Attachment."Read Only" := FALSE;
        END;

        /*
        Document.INIT;
        Document.INSERT(TRUE);
        Document."Entry No." := ServiceAPIDoc."Entry No.";
        Document."Table ID" := DATABASE::"Service API Document";
        Document."Document Type Code" := 'INBOUND';
        Document.Description := Attachment."File Name";
        Document."Attachment No." := Attachment."No.";
        Document.MODIFY;
        ServiceAPIDoc."Attachment No." := Attachment."No.";
        ServiceAPIDoc.MODIFY;
        */


        ToMemoryStream.Close();
        FromMemoryStream.Close();

        CLEAR(OStream);
        CLEAR(CurrentFilename);

        FileDropInProgress := FALSE;

        //ProcessServiceAPIRequest.RUN(Attachment);

    end;

    local procedure "--FM2"()
    begin
    end;

    internal procedure MarkUploadedDocument(var UploadedDocument: Record Customer)
    begin
        UploadedDocument := Document;
        UploadedDocument.Mark(true);
    end;

    var
        Document: Record Customer;
}
