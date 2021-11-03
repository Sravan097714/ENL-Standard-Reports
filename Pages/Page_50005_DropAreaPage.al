page 50005 "Drop Area FactBox"
{
    Caption = 'Documents Drop Area';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    //SourceTable = Documents;
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            usercontrol(DropArea; "Drop Area Control AddIn")
            {
                ApplicationArea = all;
                trigger AddInReady()
                begin
                end;

                trigger FileDropBegin(filename: Text)
                begin
                    Clear(DropAreaMgt);
                    DropAreaMgt.FileDropBegin(filename);
                    CurrPage.DropArea.ReadyForData(filename);
                end;

                trigger FileDrop(data: Text)
                begin
                    DropAreaMgt.FileDrop(data);
                    CurrPage.DropArea.ReadyForData(DropAreaMgt.GetCurrentFilename());
                end;

                trigger FileDropEnd()
                var
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(VariantGVar);
                    if RecRef.Number = Database::Documents then
                        DropAreaMgt.FileDropEnd2()
                    else
                        DropAreaMgt.FileDropEndBasePages(VariantGVar);
                    CurrPage.UPDATE(FALSE);
                    /*
                    DropAreaMgt.FileDropEndContract();
                    DropAreaMgt.MarkUploadedDocument(UploadedDocument);
                    CurrPage.Update(false);
                    */
                end;

                trigger AllFilesUploaded()
                var
                //CheckDocumentRules: Codeunit "Check Document Rules";
                begin
                    /*
                    if CheckDocumentRules.ContractHasApprovalConditionsWithSupportingDocType(Rec) then begin
                        UploadedDocument.MarkedOnly(true);
                        Page.RunModal(Page::"Contract - Uploaded Documents", UploadedDocument);
                    end;

                    Clear(UploadedDocument);
                    */
                end;

            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        exit(not DropAreaMgt.IsFileDropInProgress());
    end;

    procedure SetTable(VariantPar: Variant)
    begin
        VariantGVar := VariantPar;
    end;

    var
        UploadedDocument: Record Documents;
        DropAreaMgt: Codeunit "Drop Area Management";
        VariantGVar: Variant;
}
