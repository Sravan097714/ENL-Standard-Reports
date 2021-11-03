pageextension 50003 "Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        //LS300621-Start
        modify(General)
        {
            Editable = false;
        }
        addafter(Closed)
        {
            field("Documents Attach Code"; Rec."Documents Attach Code")
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'ENL-Document Attachments';
            }

            field(documentdescription; documentdescription)
            {
                ApplicationArea = all;
                Editable = false;
                //Visible = false;
                Caption = 'ENL-Document Description';
            }


        }



        //LS300621-End
    }

    actions
    {
        modify(Print)
        {
            Caption = 'Print VAT Invoice';
        }
        addafter(Print)
        {
            action(PrintNotaryVATInvoice)
            {
                Caption = 'Print Notary VAT Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = visibility;
                trigger OnAction()
                var
                    SalesInvoiceHeaderRec: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeaderRec.SetRange("No.", Rec."No.");
                    SalesInvoiceHeaderRec.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                    Report.RunModal(Report::VATDebitNote, false, false, SalesInvoiceHeaderRec);
                end;
            }
            action(PrintSalesInvoice)
            {
                Caption = 'Sales Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = visibility;
                trigger OnAction()
                var
                    SalesInvoiceHeaderRec: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeaderRec.SetRange("No.", Rec."No.");
                    SalesInvoiceHeaderRec.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                    Report.RunModal(Report::"Sales Invoice", false, false, SalesInvoiceHeaderRec);
                end;
            }
            action(PrintCreditNote)
            {
                Caption = 'Print Credit Note';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                trigger OnAction()
                var
                    SalesInvoiceHeaderRec: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeaderRec.SetRange("No.", Rec."No.");
                    SalesInvoiceHeaderRec.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                    Report.RunModal(Report::"Credit Note", false, false, SalesInvoiceHeaderRec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        CompanyInfoRec: Record "Company Information";
        CompanyName: Text[100];
    begin
        CompanyName := Rec.CurrentCompany;
        CompanyInfoRec.Reset();
        CompanyInfoRec.SetRange(Name, CompanyName);
        if CompanyInfoRec.FindFirst() then
            if CompanyInfoRec.NotaryInvoiceVisible = true then
                visibility := true;

    end;

    trigger OnAfterGetRecord()
    var
        documentsrec: Record Documents;
    begin


        begin
            documentsrec.Reset();
            documentsrec.SetRange("No.", Rec."Documents Attach Code");
            if documentsrec.FindFirst then
                documentdescription := documentsrec.Description
            else
                documentdescription := 'No Attachments Found';
        end;
    end;

    var
        visibility: boolean;
        documentdescription: Text[100];


}