pageextension 50004 "Posted Sales Invoice Line" extends 143
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("OrderNo."; "Order No.")
            {
                ApplicationArea = all;
            }
            field("User ID"; "User ID")
            {
                ApplicationArea = all;
            }
        }
        modify("Sell-to Customer No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify(Control1)
        {
            FreezeColumn = "Sell-to Customer Name";

        }
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
                PromotedCategory = Category7;
                Visible = visibility;
                trigger OnAction()
                var
                    SalesInvoiceHeaderRec: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeaderRec.SetRange("No.", Rec."No.");
                    SalesInvoiceHeaderRec.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                    Report.RunModal(Report::VATDebitNote, true, false, SalesInvoiceHeaderRec);
                end;
            }
            action(PrintSalesInvoice)
            {
                Caption = 'Sales Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category7;
                Visible = visibility;
                trigger OnAction()
                var
                    SalesInvoiceHeaderRec: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeaderRec.SetRange("No.", Rec."No.");
                    SalesInvoiceHeaderRec.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                    Report.RunModal(Report::"Sales Invoice", true, false, SalesInvoiceHeaderRec);
                end;
            }

            action(PrintCreditNote)
            {
                Caption = 'Print Credit Note';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category7;
                trigger OnAction()
                var
                    SalesInvoiceHeaderRec: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeaderRec.SetRange("No.", Rec."No.");
                    SalesInvoiceHeaderRec.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                    Report.RunModal(Report::"Credit Note", true, false, SalesInvoiceHeaderRec);
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

    var
        visibility: boolean;
}