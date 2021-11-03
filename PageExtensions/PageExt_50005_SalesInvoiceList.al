pageextension 50005 "Sales Invcoie List" extends 9301
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Post)
        {
            action(PostNPrintNVI)
            {
                Caption = 'Post and Print Notary VAT Invoice';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesHeaderRec: Record "Sales Header";
                begin
                    PostDocument(CODEUNIT::"Sales-Post (Yes/No)", "Navigate After Posting"::"Posted Document", 'Notary');
                end;
            }
            action(PostNPrintDebitNote)
            {
                Caption = 'Post and Print Debit Note';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesHeaderRec: Record "Sales Header";
                begin
                    PostDocument(CODEUNIT::"Sales-Post (Yes/No)", "Navigate After Posting"::"Posted Document", 'Debit');
                end;
            }
            action(PostNPrintCreditNote)
            {
                Caption = 'Post and Print Credit Note';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesHeaderRec: Record "Sales Header";
                begin
                    PostDocument(CODEUNIT::"Sales-Post (Yes/No)", "Navigate After Posting"::"Posted Document", 'Credit');
                end;
            }
        }
    }

    local procedure PostDocument(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting"; PostingType: Text[50])
    var
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceHeaderRec: Record "Sales Invoice Header";
        OfficeMgt: Codeunit "Office Management";
        InstructionMgt: Codeunit "Instruction Mgt.";
        PreAssignedNo: Code[20];
        IsScheduledPosting: Boolean;
    begin
        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
            LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
        PreAssignedNo := "No.";

        SendToPosting(PostingCodeunitID);

        IsScheduledPosting := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        DocumentIsPosted := (not SalesHeader.Get("Document Type", "No.")) or IsScheduledPosting;
        OnPostOnAfterSetDocumentIsPosted(SalesHeader, IsScheduledPosting, DocumentIsPosted);

        if IsScheduledPosting then
            CurrPage.Close;
        CurrPage.Update(false);

        if PostingCodeunitID <> CODEUNIT::"Sales-Post (Yes/No)" then
            exit;

        ShowPostedConfirmationMessage(PreAssignedNo, PostingType);
    end;

    local procedure ShowPostedConfirmationMessage(PreAssignedNo: Code[20]; PostingType: Text[50])
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        InstructionMgt: Codeunit "Instruction Mgt.";
    begin
        SalesInvoiceHeader.SetCurrentKey("Pre-Assigned No.");
        SalesInvoiceHeader.SetRange("Pre-Assigned No.", PreAssignedNo);
        if SalesInvoiceHeader.FindFirst then
            if InstructionMgt.ShowConfirm(StrSubstNo(OpenPostedSalesInvQst, SalesInvoiceHeader."No."),
                 InstructionMgt.ShowPostedConfirmationMessageCode)
            then
                PAGE.Run(PAGE::"Posted Sales Invoice", SalesInvoiceHeader);

        SalesInvoiceHeader.SetRange("No.", SalesInvoiceHeader."No.");
        SalesInvoiceHeader.SetRange("Bill-to Customer No.", SalesInvoiceHeader."Bill-to Customer No.");
        case PostingType of
            'Notary':
                Report.RunModal(Report::VATDebitNote, true, false, SalesInvoiceHeader);
            'Debit':
                Report.RunModal(Report::"Debit Note", true, false, SalesInvoiceHeader);
            'Credit':
                Report.RunModal(Report::"Credit Note", true, false, SalesInvoiceHeader);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPostOnAfterSetDocumentIsPosted(SalesHeader: Record "Sales Header"; var IsScheduledPosting: Boolean; var DocumentIsPosted: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPostOnBeforeSalesHeaderInsert(var SalesHeader: Record "Sales Header")
    begin
    end;

    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        DocumentIsPosted: Boolean;
        OpenPostedSalesInvQst: Label 'The invoice is posted as number %1 and moved to the Posted Sales Invoices window.\\Do you want to open the posted invoice?', Comment = '%1 = posted document number';


}