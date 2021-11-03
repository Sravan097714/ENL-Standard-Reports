pageextension 50052 CompanyInfoExt extends "Company Information"
{
    layout
    {
        addafter("User Experience")
        {
            group(Notary)
            {
                field("Beneficiary Name"; "Beneficiary Name")
                {
                    ApplicationArea = all;
                }
                field("Beneficiary Address"; "Beneficiary Address")
                {
                    ApplicationArea = all;
                }
                field("Not Bank Name"; "Not Bank Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Address"; "Bank Address")
                {
                    ApplicationArea = all;
                }
                field("Account No"; "Account No")
                {
                    ApplicationArea = all;
                }
                field("Not IBAN"; "Not IBAN")
                {
                    ApplicationArea = all;
                }
                field("Not SWIFT Code"; "Not SWIFT Code")
                {
                    ApplicationArea = all;
                }
            }
        }

        addafter(Notary)
        {
            group(CoverLetterInfo)
            {
                Caption = 'Cover Letter Information';

                field("CoverLetterAdminName"; "CoverLetterAdminName") { ApplicationArea = all; }
                field(CoverLetterAdminTitle; CoverLetterAdminTitle) { ApplicationArea = all; }


            }
            group("Email-Body")
            {
                Caption = 'Email-Body';
                field("Purchase Order Mail-Body"; "Purchase Order Mail-Body") { ApplicationArea = all; MultiLine = true; }
                field(Note; 'Note: Please Insert "<br><br>" to insert new line') { ApplicationArea = all; ShowMandatory = true; ShowCaption = false; }
                field("Sales Invoice Mail-Body"; "Sales Invoice Mail-Body") { ApplicationArea = all; MultiLine = true; }
            }

        }


        addlast(General)
        {
            field("Business Registration No."; "Business Registration No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("PO Instruction"; "PO Instruction")
            {
                ApplicationArea = all;
            }
            field("Document Footer"; "Document Footer")
            {
                ApplicationArea = all;
            }

            field(NotaryInvoiceVisible; NotaryInvoiceVisible)
            {
                ApplicationArea = all;
            }

        }
        addafter(Communication)
        {
            group("VAT Info")
            {
                field(MNS; MNS)
                {
                    ApplicationArea = all;
                }
                field(VT03; VT03)
                {
                    ApplicationArea = all;
                }
                field("V1.0"; "V1.0")
                {
                    ApplicationArea = all;
                }
                field("VAT Payer Tan"; "VAT Payer Tan")
                {
                    ApplicationArea = all;
                }
                field("VAT BRN No."; "VAT BRN No.")
                {
                    ApplicationArea = all;
                }
                field("Vat Payer Name"; "Vat Payer Name")
                {
                    ApplicationArea = all;
                }
                field("Telephone Number"; "Telephone Number")
                {
                    ApplicationArea = all;
                }
                field("Vat Mobile Number"; "Vat Mobile Number")
                {
                    ApplicationArea = all;
                }
                field("Name of VAT Declarant"; "Name of VAT Declarant")
                {
                    ApplicationArea = all;
                }
                field("VAT Email Address"; "VAT Email Address")
                {
                    ApplicationArea = all;
                }


            }
        }
        addafter("Bank Account No.")
        {
            field("Company Bank Address"; "Company Bank Address") { ApplicationArea = ALL; }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        Note: Text[50];
}