report 50007 "Payment Registers"
{
    // version RCTS 1.0.0

    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\PaymentRegisterSof.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem("G/L Register"; "G/L Register")
        {
            DataItemTableView = SORTING("No.")
                                WHERE("Source Code" = FILTER('PAYMENTJNL'));
            RequestFilterFields = "No.";
            column(CompanyInfoName; UPPERCASE(CompanyInfo.Name))
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {

            }
            column(CompanyInfoAddr; CompanyInfo.Address)
            {

            }
            column(CompanyInfoAddr2; CompanyInfo."Address 2")
            {

            }
            column(CompanyInfoCity; CompanyInfo.City)
            {

            }
            column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
            {

            }
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {

            }
            column(CompanyInfoFax; CompanyInfo."Fax No.")
            {

            }
            column(CompanyInfoHomePage; CompanyInfo."Home Page")
            {

            }
            column(CompanyInfoBRN; CompanyInfo."Business Registration No.")
            {

            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {

            }
            column(CompanyCountry; CompanyCountry)
            {

            }
            column(PAYMENTREGISTER_Caption; PAYMENTREGISTER_CaptionLbl)
            {
            }
            column(Page_Caption; Page_CaptionLbl)
            {
            }
            column(FilteredBy_Caption; FilteredBy_CaptionLbl)
            {
            }
            column(RegisterNo_Caption; RegisterNo_CaptionLbl)
            {
            }
            column(DocumentType_Caption; DocumentType_CaptionLbl)
            {
            }
            column(PaymentNumber_Caption; PaymentNumber_CaptionLbl)
            {
            }
            column(ChequeDate_Caption; ChequeDate_CaptionLbl)
            {
            }
            column(CompanyInfoBRN_Caption; CompanyInfoBRN_CaptionLbl)
            {

            }
            column(VendorNo_Caption; VendorNo_CaptionLbl)
            {
            }
            column(PayeeName_Caption; PayeeName_CaptionLbl)
            {
            }
            column(BankAccount_Caption; BankAccount_CaptionLbl)
            {
            }
            column(Name_Caption; Name_CaptionLbl)
            {
            }
            column(Amount_Caption; Amount_CaptionLbl)
            {
            }
            column(GrandTotal_Caption; GrandTotal_CaptionLbl)
            {
            }
            column(PREPARED_PROCESSED_Caption; PREPARED_PROCESSED_CaptionLbl)
            {
            }
            column(APPROVED_Caption; APPROVED_CaptionLbl)
            {
            }
            column(STCHEQUESIGNATURE_Caption; "1STCHEQUESIGNATURE_CaptionLbl")
            {
            }
            column(NDCHEQUESIGNATURE_Caption; "2NDCHEQUESIGNATURE_CaptionLbl")
            {
            }
            column(RECEIVED_Caption; RECEIVED_CaptionLbl)
            {
            }
            column(DATE_Caption; DATE_CaptionLbl)
            {
            }
            column(No_GLRegister; "G/L Register"."No.")
            {
            }
            column(PayeeName; PayeeName)
            {
            }
            column(Bank_Name; Bank.Name)
            {
            }
            column(Amt; ABS(Amt))
            {
            }
            column(USERID; PreparedBy)
            {
            }
            column(CreationDate_GLRegister; "G/L Register"."Creation Date")
            {
            }
            column(GLRegister_GETFILTERS; "G/L Register".GETFILTERS)
            {
            }
            column(ShowLineGVar; ShowLineGVar)
            {
            }
            column(Rep_50093_Caption; Rep_50093_CaptionLbl)
            {
            }
            column(ApprovedBy1; ApprovedBy1) { }
            column(ApprovedBy2; ApprovedBy2) { }
            column(ApprovedBy3; ApprovedBy3) { }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemTableView = SORTING("Document No.", "Posting Date")
                                    WHERE(Amount = FILTER(< 0),
                                          "Source Code" = FILTER('PAYMENTJNL'));
                RequestFilterFields = "Document No.", "Posting Date";
                column(DocumentType_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Document Type")
                {
                }
                column(DocumentNo_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(External_Document_No_; "Bank Account Ledger Entry"."External Document No.") { }
                column(PostingDate_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Posting Date")
                {
                }
                column(BalAccountNo_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Bal. Account No.")
                {
                }
                column(BankAccountNo_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Bank Account No.")
                {
                }
                column(Amount_BankAccountLedgerEntry; ABS("Bank Account Ledger Entry".Amount))
                {
                }
                column(BankShowLineGVar; BankShowLineGVar)
                {
                }
                column(approval1id; approval1id) { }
                column(approvalname; approvalname) { }
                column(approval1time; approval1time) { }
                column(sign1id; sign1id) { }
                column(sign1name; sign1name) { }
                column(sign1time; sign1time) { }
                column(sign2id; sign2id) { }
                column(sign2name; sign2name) { }
                column(sign2time; sign2time) { }
                column(ExternalDocNo_Caption; ExternalDocNo_CaptionLbl) { }
                column(Description; Description) { }

                trigger OnAfterGetRecord()
                var
                    approvalentriesrec: Record "Approval Entry";
                    postedapprovalentriesrec: Record "Posted Approval Entry";
                    userrec: Record User;
                begin
                    IF Bank.GET("Bank Account Ledger Entry"."Bank Account No.") THEN;

                    //Amt += "Bank Account Ledger Entry".Amount;

                    Index += 1;


                    //ZS-001
                    //IF GetMultipleRec.GetCustomer(Cust,TRUE,"Customer No.") THEN;

                    CLEAR(PayeeName);
                    IF GetMultipleRec.GetVendor(recVendor, TRUE, "Bank Account Ledger Entry"."Bal. Account No.") THEN BEGIN
                        IF recVendor."Pay-to Vendor No." = '' THEN BEGIN
                            PayeeName := recVendor.Name;
                        END ELSE BEGIN
                            IF GetMultipleRec.GetVendor(recVendor1, TRUE, recVendor."Pay-to Vendor No.") THEN BEGIN
                                PayeeName := recVendor1.Name;
                            END;
                        END;
                    END;

                    IF "Bank Account Ledger Entry".HASFILTER THEN
                        BankShowLineGVar := TRUE
                    ELSE
                        BankShowLineGVar := FALSE;


                    Clear(approval1id);
                    Clear(approval1time);
                    clear(approvalname);
                    postedapprovalentriesrec.Reset();
                    postedapprovalentriesrec.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                    postedapprovalentriesrec.SetRange("Sequence No.", 1);
                    postedapprovalentriesrec.SetRange(Status, "Approval Status"::Approved);
                    if postedapprovalentriesrec.FindFirst then begin
                        approval1id := postedapprovalentriesrec."Approver ID";
                        approval1time := postedapprovalentriesrec."Last Date-Time Modified";
                        userrec.Reset();
                        userrec.SetRange("User Name", approval1id);
                        if userrec.FindFirst then
                            approvalname := userrec."Full Name";

                    end;
                    Clear(sign1id);
                    Clear(sign1time);
                    clear(sign1name);
                    postedapprovalentriesrec.Reset();
                    postedapprovalentriesrec.SetRange("Document No.", "Document No.");
                    postedapprovalentriesrec.SetRange("Sequence No.", 2);
                    postedapprovalentriesrec.SetRange(Status, "Approval Status"::Approved);
                    if postedapprovalentriesrec.FindFirst then begin
                        sign1id := postedapprovalentriesrec."Approver ID";
                        sign1time := postedapprovalentriesrec."Last Date-Time Modified";
                        userrec.Reset();
                        userrec.SetRange("User Name", sign1id);
                        if userrec.FindFirst then
                            sign1name := userrec."Full Name";

                    end;

                    Clear(sign2id);
                    Clear(sign2time);
                    Clear(sign2name);
                    postedapprovalentriesrec.Reset();
                    postedapprovalentriesrec.SetRange("Document No.", "Document No.");
                    postedapprovalentriesrec.SetRange("Sequence No.", 3);
                    postedapprovalentriesrec.SetRange(Status, "Approval Status"::Approved);
                    if postedapprovalentriesrec.FindFirst then begin
                        sign2id := postedapprovalentriesrec."Approver ID";
                        sign2time := postedapprovalentriesrec."Last Date-Time Modified";
                        userrec.Reset();
                        userrec.SetRange("User Name", sign2id);
                        if userrec.FindFirst then
                            sign2name := userrec."Full Name";
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE("Entry No.", "G/L Register"."From Entry No.", "G/L Register"."To Entry No.");
                    //CurrReport.CREATETOTALS(Amount);
                end;
            }

            trigger OnAfterGetRecord()
            var
                UserRec: Record User;
                UserName: Code[50];
                PurchaseOrder: Record "Purchase Header";
            begin

                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE(ApprovalEntries."Document No.", PurchaseOrder."No.");
                ApprovalEntries.SETRANGE(ApprovalEntries."Document Type", PurchaseOrder."Document Type");
                ApprovalEntries.SETRANGE(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                ApprovalEntries.SETRANGE(ApprovalEntries."Sequence No.", 1);
                IF ApprovalEntries.FINDLAST THEN BEGIN

                    ActiveSession.RESET;
                    ActiveSession.SETRANGE(ActiveSession."User ID", ApprovalEntries."Approver ID");
                    IF ActiveSession.FINDFIRST THEN BEGIN
                        UserRec.RESET;
                        IF UserRec.GET(ActiveSession."User SID") THEN
                            ApprovedBy1 := UserRec."Full Name";
                    END;

                    UserRec.RESET;
                    UserRec.SETRANGE(UserRec."User Name", ApprovalEntries."Approver ID");
                    IF UserRec.FINDLAST THEN BEGIN
                        ApprovedBy1 := UserRec."Full Name";
                    END;
                END;

                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE(ApprovalEntries."Document No.", PurchaseOrder."No.");
                ApprovalEntries.SETRANGE(ApprovalEntries."Document Type", PurchaseOrder."Document Type");
                ApprovalEntries.SETRANGE(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                ApprovalEntries.SETRANGE(ApprovalEntries."Sequence No.", 2);
                IF ApprovalEntries.FINDLAST THEN BEGIN

                    ActiveSession.RESET;
                    ActiveSession.SETRANGE(ActiveSession."User ID", ApprovalEntries."Approver ID");
                    IF ActiveSession.FINDFIRST THEN BEGIN
                        UserRec.RESET;
                        IF UserRec.GET(ActiveSession."User SID") THEN
                            ApprovedBy2 := UserRec."Full Name";
                    END;

                    UserRec.RESET;
                    UserRec.SETRANGE(UserRec."User Name", ApprovalEntries."Approver ID");
                    IF UserRec.FINDLAST THEN BEGIN
                        ApprovedBy2 := UserRec."Full Name";
                    END;
                END;

                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE(ApprovalEntries."Document No.", PurchaseOrder."No.");
                ApprovalEntries.SETRANGE(ApprovalEntries."Document Type", PurchaseOrder."Document Type");
                ApprovalEntries.SETRANGE(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                ApprovalEntries.SETRANGE(ApprovalEntries."Sequence No.", 3);
                IF ApprovalEntries.FINDLAST THEN BEGIN

                    ActiveSession.RESET;
                    ActiveSession.SETRANGE(ActiveSession."User ID", ApprovalEntries."Approver ID");
                    IF ActiveSession.FINDFIRST THEN BEGIN
                        UserRec.RESET;
                        IF UserRec.GET(ActiveSession."User SID") THEN
                            ApprovedBy3 := UserRec."Full Name";
                    END;

                    UserRec.RESET;
                    UserRec.SETRANGE(UserRec."User Name", ApprovalEntries."Approver ID");
                    IF UserRec.FINDLAST THEN BEGIN
                        ApprovedBy3 := UserRec."Full Name";
                    END;
                END;

                UserRec.RESET;
                UserName := UserId;
                UserRec.SetRange("User Name", UserName);
                IF UserRec.FindFirst() THEN PreparedBy := UserRec."Full Name";

                IF "G/L Register".HASFILTER THEN
                    ShowLineGVar := TRUE
                ELSE
                    ShowLineGVar := FALSE;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("No.");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        IF Index = 0 THEN
            ERROR('No Records found.');
    end;

    trigger OnPreReport()
    var
        Country: Record 9;
    begin
        CompanyInfo.GET;
        CompanyInfo.CalcFields(Picture);
        Index := 0;
        IF CompanyInfo."Country/Region Code" <> '' THEN BEGIN
            IF Country.GET(CompanyInfo."Country/Region Code") THEN
                CompanyCountry := Country.Name
            ELSE
                CompanyCountry := '';
        END ELSE
            CompanyCountry := '';
    end;

    var
        LastFieldNo: Integer;
        PreparedBy: Text[100];
        ApprovedBy1: Text[100];
        ApprovedBy2: Text[100];
        ApprovedBy3: Text[100];
        ActiveSession: Record 2000000110;
        FooterPrinted: Boolean;
        Bank: Record 270;
        Amt: Decimal;
        CompanyInfo: Record 79;
        CompanyCountry: Text[100];
        Index: Integer;
        PayeeName: Text[100];
        GetMultipleRec: Codeunit 50001;
        ApprovalEntries: Record 454;
        recVendor: Record 23;
        recVendor1: Record 23;
        PAYMENTREGISTER_CaptionLbl: Label 'PAYMENT REGISTER';
        Page_CaptionLbl: Label 'Page';
        FilteredBy_CaptionLbl: Label 'Filtered By:';
        RegisterNo_CaptionLbl: Label '<b>Register No.</b>';
        DocumentType_CaptionLbl: Label 'Document Type';
        PaymentNumber_CaptionLbl: Label 'Payment Number';
        ChequeDate_CaptionLbl: Label 'Cheque Date';
        VendorNo_CaptionLbl: Label 'Vendor No.';
        PayeeName_CaptionLbl: Label 'Payee Name';
        BankAccount_CaptionLbl: Label 'Bank Account';
        CompanyInfoBRN_CaptionLbl: Label 'BRN';
        Name_CaptionLbl: Label 'Name';
        Amount_CaptionLbl: Label 'Amount';
        GrandTotal_CaptionLbl: Label 'Grand Total';
        PREPARED_PROCESSED_CaptionLbl: Label 'PREPARED/PROCESSED';
        APPROVED_CaptionLbl: Label 'APPROVED';
        "1STCHEQUESIGNATURE_CaptionLbl": Label '1ST SIGNATURE';
        "2NDCHEQUESIGNATURE_CaptionLbl": Label '2ND SIGNATURE';
        RECEIVED_CaptionLbl: Label 'RECEIVED';
        DATE_CaptionLbl: Label 'DATE';
        ShowLineGVar: Boolean;
        Rep_50093_CaptionLbl: Label 'Rep-50093';
        BankShowLineGVar: Boolean;
        approverid: Text[50];
        approvernamevend: Text[50];
        sendernamevend: Text[50];
        sendernam: Text[100];
        approvernamecust: Text[50];
        approvernamegen: Text[50];
        nam: Text[50];

        approvdate: DateTime;
        approval1id: Text[50];
        approval1time: DateTime;
        approvalname: Text[50];
        sign1id: Text[50];
        sign1time: DateTime;
        sign1name: Text[50];
        sign2id: Text[50];
        sign2time: DateTime;
        sign2name: Text[50];
        poapprovedname: Text[50];
        username: Text[50];
        ExternalDocNo_CaptionLbl: Label 'External Document No.';
}

