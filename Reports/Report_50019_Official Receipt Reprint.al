report 50019 "Official Receipt Reprint"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\OfficialReceiptMUR2.rdl';
    Caption = 'Official Receipt';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Entry No.") WHERE("Source Code" = FILTER('CASHRECJNL'), Amount = FILTER(> 0), Reversed = FILTER('No'));
            RequestFilterFields = "Document No.", "Document Type", "Source Code", "Posting Date";

            dataitem(CopyLoop; Integer)
            {
                column(CompInfo_Picture; CompanyInfo.Picture)
                {
                }
                column(CompInfo_Name; CompanyInfo.Name)
                {
                }
                column(CompInfo_IncludeTitle; CompanyInfo."Include Company Title")
                {
                }
                column(OrderTakenBy; OrderTakenBy) { }
                column(OutputNo_; OutputNo)
                {
                }
                column(CompArr1_; CompanyArr[1])
                {
                }
                column(CompArr2_; CompanyArr[2])
                {
                }
                column(CompArr3_; CompanyArr[3])
                {
                }
                column(CompArr4_; CompanyArr[4])
                {
                }
                column(CompArr5_; CompanyArr[5])
                {
                }
                column(CompArr6_; CompanyArr[6])
                {
                }
                column(CompArr7_; CompanyArr[7])
                {
                }
                column(CompArr8_; CompanyArr[8])
                {
                }
                column(CompArr9_; CompanyArr[9])
                {
                }
                column(CompArr10_; CompanyArr[10])
                {
                }
                column(Title2_; Title[2])
                {
                }
                column(ClientCode_; ClientCode)
                {
                }
                column(EntryNo_BLE; "Bank Account Ledger Entry"."Entry No.")
                {
                }
                column(Title1_; Title[1])
                {
                }
                column(DocumentNo_BLE; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(CustArray1_; CustArray[1])
                {
                }
                column(CustArray2_; CustArray[2])
                {
                }
                column(CustArray3_; CustArray[3])
                {
                }
                column(CustArray4_; CustArray[4])
                {
                }
                column(CustArray5_; CustArray[5])
                {
                }
                column(CustArray6_; CustArray[6])
                {
                }
                column(CustArray7_; CustArray[7])
                {
                }
                column(countrycode; CustArray[8]) { }
                column(PostingDate_BLE; "Bank Account Ledger Entry"."Posting Date")
                {
                }
                column(CurrencyCode_CLE; CustledgEntry."Currency Code")
                {
                }
                column(CurrencyCode_Lbl; '') { }
                column(DotText_; '') { }
                column(NumberText1_; NumberText[1])
                {
                }
                column(NumberText2_; NumberText[2])
                {
                }
                column(CustomerName; CustArray[6])
                {
                }

                column(ExtDocNo_BLE; "Bank Account Ledger Entry"."External Document No.")
                {
                }
                column(ParticularsLBL_; ParticularsLbl)
                {
                }
                column(ParticularsVal_; ParticularsVal)
                {
                }
                column(AppliedAmt_; AppliedAmt)
                {
                }
                column(UnAppliedAmt_; UnAppliedAmt)
                {
                }
                column(PostingDate; "Detailed Cust. Ledg. Entry"."Posting Date")
                {
                }
                column(TotalAmt_; TotalAmt)
                {
                }
                column(CurrencyCode_; CurCod)
                {
                }
                column(Amount_BLE; "Bank Account Ledger Entry".Amount)
                {
                }
                column(PaymentMethodDesc_; PaymentMethodDesc)
                {
                }
                column(Description_BLE; "Bank Account Ledger Entry".Description)
                {
                }
                column(RemAmount_; RemAmount)
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No.");
                    DataItemLinkReference = "Bank Account Ledger Entry";
                    DataItemTableView = SORTING("Customer No.", "Posting Date", "Entry Type", "Currency Code") WHERE("Entry Type" = FILTER(Application));

                    column(DocNo_CLE; CustLedgerEntry."Document No.")
                    {
                    }
                    column(DocType_; DocType)
                    {
                    }
                    column(DocumentDate_; CustLedgerEntry."Document Date")
                    {
                    }
                    column(Amount_DCLE; "Detailed Cust. Ledg. Entry"."Amount (LCY)" * -1)
                    {
                    }
                    trigger OnAfterGetRecord();
                    begin
                        IF ("Bank Account Ledger Entry"."Document Type" <> "Bank Account Ledger Entry"."Document Type"::Payment) AND
                            ("Bank Account Ledger Entry"."Bal. Account Type" <> "Bank Account Ledger Entry"."Bal. Account Type"::Customer)
                        THEN
                            CurrReport.SKIP;

                        IF not CustLedgerEntry.GET("Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.") THEN
                            CurrReport.SKIP;

                        IF CustLedgerEntry."Document Type" = CustLedgerEntry."Document Type"::Payment THEN
                            CurrReport.SKIP;

                        DocType := CustLedgerEntry."Document Type";
                    end;
                }

                trigger OnPreDataItem();
                begin
                    SETRANGE(Number, 1, 1);
                    OutputNo := 0;
                end;

                trigger OnAfterGetRecord();
                begin
                    CLEAR(Title[2]);
                    OutputNo += 1;

                    IF OutputNo = 3 THEN
                        Title[2] := Text002
                    ELSE
                        CLEAR(Title[2]);
                end;
            }
            trigger OnAfterGetRecord();
            begin
                CLEAR(ClientCode);
                CLEAR(CustArray);
                CLEAR(RemAmount);
                Clear(PaymentMethodDesc);

                IF Customer.GET("Bal. Account No.") THEN BEGIN
                    CustArray[1] := Customer.Address;
                    CustArray[2] := Customer."Address 2";
                    CustArray[3] := Customer.City;
                    CustArray[4] := 'VAT REG NO. : ' + Customer."VAT Registration No.";
                    CustArray[6] := Customer.Name;
                    CustArray[8] := Customer."Country/Region Code";

                    IF Customer."Business Registraton No." <> '' THEN
                        CustArray[5] := 'BRN :' + Customer."Business Registraton No.";

                    //COMPRESSARRAY(CustArray);
                END;

                IF "Bal. Account Type" IN
                    ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"G/L Account"]
                THEN
                    ClientCode := "Bal. Account No."
                ELSE
                    ClientCode := '';

                CurCod := COPYSTR("Currency Code", 1, 3);
                IF CurCod = '' THEN BEGIN
                    GLSetup.GET;
                    CurCod := COPYSTR(GLSetup."LCY Code", 1, 3);
                END;

                Clear(PaymentMethodDesc);

                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, Amount, '');

                CustledgEntry.SETRANGE(CustledgEntry."Transaction No.", "Bank Account Ledger Entry"."Transaction No.");
                IF CustledgEntry.FIND('-') THEN BEGIN
                    CustledgEntry.CALCFIELDS(CustledgEntry."Remaining Amt. (LCY)");
                    RemAmount := CustledgEntry."Remaining Amt. (LCY)";
                    IF PaymentMethod.Get(CustledgEntry."Payment Method Code") THEN begin
                        PaymentMethodDesc := PaymentMethod.Description;
                    end;
                END;

                IF ("Bank Account Ledger Entry"."Document Type" = "Bank Account Ledger Entry"."Document Type"::Payment) AND
                    ("Bank Account Ledger Entry"."Bal. Account Type" = "Bank Account Ledger Entry"."Bal. Account Type"::Customer)
                THEN BEGIN
                    CLEAR(AppliedAmt);
                    CLEAR(UnAppliedAmt);
                    CLEAR(TotalAmt);
                    DetCustLedgerEntry.RESET;
                    DetCustLedgerEntry.SETRANGE(DetCustLedgerEntry."Entry Type", DetCustLedgerEntry."Entry Type"::Application);
                    DetCustLedgerEntry.SETRANGE(DetCustLedgerEntry."Transaction No.", "Bank Account Ledger Entry"."Transaction No.");
                    DetCustLedgerEntry.SETRANGE(DetCustLedgerEntry."Document No.", "Bank Account Ledger Entry"."Document No.");
                    DetCustLedgerEntry.SETRANGE(DetCustLedgerEntry."Initial Document Type", DetCustLedgerEntry."Initial Document Type"::Invoice);
                    DetCustLedgerEntry.SETRANGE(DetCustLedgerEntry."Source Code", 'CASHRECJNL');
                    IF DetCustLedgerEntry.FindSet() THEN BEGIN
                        REPEAT
                            AppliedAmt += ABS(DetCustLedgerEntry."Amount (LCY)");
                        UNTIL DetCustLedgerEntry.NEXT = 0;

                        UnAppliedAmt := 0;
                        TotalAmt := ABS(AppliedAmt) + UnAppliedAmt;
                    END ELSE BEGIN
                        CustLedgerEntry.RESET;
                        CustLedgerEntry.SETRANGE(CustLedgerEntry."Document No.", "Bank Account Ledger Entry"."Document No.");
                        CustLedgerEntry.SETRANGE(CustLedgerEntry."Transaction No.", "Bank Account Ledger Entry"."Transaction No.");
                        CustLedgerEntry.SETRANGE(CustLedgerEntry."Source Code", 'CASHRECJNL');
                        IF CustLedgerEntry.FindSet() THEN BEGIN
                            AppliedAmt := 0;
                            CustLedgerEntry.CALCFIELDS(CustLedgerEntry."Amount (LCY)");
                            UnAppliedAmt := ABS(CustLedgerEntry."Amount (LCY)");
                            TotalAmt := AppliedAmt + ABS(UnAppliedAmt);
                        END;
                    END;
                END;

                IF ("Bank Account Ledger Entry"."Document Type" = "Bank Account Ledger Entry"."Document Type"::Payment) AND
                ("Bank Account Ledger Entry"."Bal. Account Type" = "Bank Account Ledger Entry"."Bal. Account Type"::"G/L Account") THEN BEGIN
                    CLEAR(AppliedAmt);
                    CLEAR(UnAppliedAmt);
                    CLEAR(TotalAmt);

                    AppliedAmt := 0;
                    UnAppliedAmt := ABS("Bank Account Ledger Entry"."Amount (LCY)");
                    TotalAmt := AppliedAmt + ABS(UnAppliedAmt);
                END;
            end;
        }
    }

    trigger OnPreReport();
    begin
        IF "Bank Account Ledger Entry".GETFILTERS = '' THEN
            ERROR('No filter applied');
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
        Formataddress.CompanyRCTS(CompanyArr, CompanyInfo);
        Title[1] := Text001;
        CLEAR(Title[2]);
        //Title[2] := Text002

        User.RESET;
        User.SETRANGE(User."User Name", UserId());
        IF User.FINDLAST THEN
            OrderTakenBy := User."Full Name";
    end;

    var
        CompanyInfo: Record 79;
        CheckReport: Report 1401;
        NumberText: array[2] of Text[60];
        CurCod: Code[10];
        CustledgEntry: Record 21;
        GLSetup: Record 98;
        CustArray: array[8] of Text[100];
        Customer: Record 18;
        CompanyArr: array[10] of Text[100];
        Title: array[3] of Text[30];
        PaymentMethod: Record 289;
        PaymentMethodDesc: Text[30];
        ClientCode: Text[30];

        RemAmount: Decimal;
        DocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        CustLedgerEntry: Record 21;
        DetCustLedgerEntry: Record 379;
        AppliedAmt: Decimal;
        UnAppliedAmt: Decimal;
        TotalAmt: Decimal;
        ParticularsLbl: Text[15];
        ParticularsVal: Text[100];
        OutputNo: Integer;
        Text000: Label 'Access Denied!';
        Text001: Label 'OFFICIAL RECEIPT';
        Text002: Label 'COPY';
        Text003: Label 'Payment Receipt';
        Text004: Label 'Payment Voucher';
        Text005: Label 'Page %1';
        Text006: Label 'Pmt. Disc. Given';
        Text007: Label 'Pmt. Disc. Rcvd.';
        Text008: Label 'BRN : ';
        FormatAddress: Codeunit "Format Addresses";
        User: Record 2000000120;
        OrderTakenBy: Text;
}

