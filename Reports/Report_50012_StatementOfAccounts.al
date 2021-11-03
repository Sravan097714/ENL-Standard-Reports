report 50012 "Statement of Account"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\StatementofAccount.rdl';
    Caption = 'Statement';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Print Statements", "Currency Filter";
            column(No_Cust; "No.")
            {
            }
            column(CompInfo_IncTitle; CompanyInfo."Include Company Title")
            {
            }
            column(CompayInfoGRec_Picture; CompayInfoGRec.Picture)
            {
            }
            column(CompayInfoGRec_Picture_Statement; CompayInfoGRec."Picture Statement")
            {
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                PrintOnlyIfDetail = true;
                column(CompanyInfo_Name; UPPERCASE(CompanyInfo.Name))
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CompanyArr1_CompanyArr2_CompanyArr3_CompanyArr4; CompanyArr[1] + CompanyArr[2] + CompanyArr[3] + CompanyArr[4])
                {
                }
                column(CompanyArr5_CompanyArr6_CompanyArr7_CompanyArr8; CompanyArr[5] + CompanyArr[6] + CompanyArr[7] + CompanyArr[8])
                {
                }
                column(CompanyArr9_CompanyArr10; CompanyArr[9] + CompanyArr[10])
                {
                }
                column(CompanyArr1; CompanyArr[1])
                {
                }
                column(CompanyArr2; CompanyArr[2])
                {
                }
                column(CompanyArr3_CompanyArr4; CompanyArr[3] + ', ' + CompanyArr[4])
                {
                }
                column(CompanyArr5_CompanyArr6_; CompanyArr[5] + CompanyArr[6])
                {
                }
                column(CompanyArr7_CompanyArr8_; CompanyArr[7] + CompanyArr[8])
                {
                }
                column(CompanyArr9; CompanyArr[9])
                {
                }
                column(CompanyArr10; CompanyArr[10])
                {
                }
                column(Title1_Title2; Title[1] + ' ' + Title[2])
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CompanyInfoEmail; CompanyInfo."E-Mail")
                {
                }
                column(CompanyInfoHomePage; CompanyInfo."Home Page")
                {
                }
                column(VATRegNo_CompanyInfo; CompanyInfo."VAT Registration No.")
                {
                }
                column(GiroNo_CompanyInfo; CompanyInfo."Giro No.")
                {
                }
                column(BankName_CompanyInfo; CompanyInfo."Bank Name")
                {
                }
                column(BankAccNo_CompanyInfo; CompanyInfo."Bank Account No.")
                {
                }
                column(No1_Cust; Customer."No.")
                {
                }
                column(TodayFormatted; FORMAT(TODAY))
                {
                }
                column(StartDate; FORMAT(StartDate))
                {
                }
                column(EndDate; FORMAT(EndDate))
                {
                }
                column(LastStatmntNo_Cust; FORMAT(Customer."Last Statement No."))
                {

                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(CompanyAddr7; CompanyAddr[7])
                {
                }
                column(CompanyAddr8; CompanyAddr[8])
                {
                }
                column(StatementCaption; StatementCaptionLbl)
                {
                }
                column(PhoneNo_CompanyInfoCaption; PhoneNo_CompanyInfoCaptionLbl)
                {
                }
                column(VATRegNo_CompanyInfoCaption; VATRegNo_CompanyInfoCaptionLbl)
                {
                }
                column(GiroNo_CompanyInfoCaption; GiroNo_CompanyInfoCaptionLbl)
                {
                }
                column(BankName_CompanyInfoCaption; BankName_CompanyInfoCaptionLbl)
                {
                }
                column(BankAccNo_CompanyInfoCaption; BankAccNo_CompanyInfoCaptionLbl)
                {
                }
                column(No1_CustCaption; No1_CustCaptionLbl)
                {
                }
                column(StartDateCaption; StartDateCaptionLbl)
                {
                }
                column(EndDateCaption; EndDateCaptionLbl)
                {
                }
                column(LastStatmntNo_CustCaption; LastStatmntNo_CustCaptionLbl)
                {
                }
                column(PostDate_DtldCustLedgEntriesCaption; PostDate_DtldCustLedgEntriesCaptionLbl)
                {
                }
                column(DocNo_DtldCustLedgEntriesCaption; DtldCustLedgEntries.FIELDCAPTION("Document No."))
                {
                }
                column(Desc_CustLedgEntry2Caption; CustLedgEntry2.FIELDCAPTION(Description))
                {
                }
                column(DueDate_CustLedgEntry2Caption; DueDate_CustLedgEntry2CaptionLbl)
                {
                }
                column(RemainAmtCustLedgEntry2Caption; CustLedgEntry2.FIELDCAPTION("Remaining Amount"))
                {
                }
                column(CustBalanceCaption; CustBalanceCaptionLbl)
                {
                }
                column(OriginalAmt_CustLedgEntry2Caption; CustLedgEntry2.FIELDCAPTION("Original Amount"))
                {
                }
                column(CompanyInfoHomepageCaption; CompanyInfoHomepageCaptionLbl)
                {
                }
                column(CompanyInfoEmailCaption; CompanyInfoEmailCaptionLbl)
                {
                }
                column(DocDateCaption; DocDateCaptionLbl)
                {
                }
                column(Total_Caption2; Total_CaptionLbl)
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(TranDateCaption; TranDateCaptionLbl)
                {
                }
                column(TypeCaption; TypeCaptionLbl)
                {
                }
                column(OurRefCaption; OurRefCaptionLbl)
                {
                }
                column(YourRefCaption; YourRefCaptionLbl)
                {
                }
                column(ParticularsCaption; ParticularsCaptionLbl)
                {
                }
                column(DebitCaption; DebitCaptionLbl)
                {
                }
                column(CreditCaption; CreditCaptionLbl)
                {
                }
                column(DueDateCaption; DueDateCaptionLbl)
                {
                }
                column(BalanceCaption; BalanceCaptionLbl)
                {
                }
                column(TickCaption; TickCaptionLbl)
                {
                }
                column(ItemsCaption; ItemsCaptionLbl)
                {
                }
                column(NotYetDueCaption; NotYetDueCaptionLbl)
                {
                }
                column(OverDueCaption; OverDueCaptionLbl)
                {
                }
                column(TotalAmountDueCaption; TotalAmountDueCaptionLbl)
                {
                }
                column(REMITTANCEADVICECaption; REMITTANCEADVICECaptionLbl)
                {
                }
                column(CustomerNoCaption; CustomerNoCaptionLbl)
                {
                }
                column(StatementDateCaption; StatementDateCaptionLbl)
                {
                }
                column(ANYPAYMENTMADEAFTERTHESTATEMENTDATEARENOTINCLUDEDINTHEABOVEFIGURECaption; ANYPAYMENTMADEAFTERTHESTATEMENTDATEARENOTINCLUDEDINTHEABOVEFIGURECaptionLbl)
                {
                }
                column(InvoiceReturnPaymentRefundJournalCaption; InvoiceReturnPaymentRefundJournalCaptionLbl)
                {
                }
                column(INVCREPAYREFCaption; INVCREPAYREFCaptionLbl)
                {
                }
                column(KEYCaption; KEYCaptionLbl)
                {
                }
                column(CustLedgEntryHdrHeader2OnPreSectionVisible; CustLedgEntryHdrHeader2OnPreSectionVisible)
                {
                }
                column(CustLedgEntryHdrHeader3OnPreSectionVisible; CustLedgEntryHdrHeader3OnPreSectionVisible)
                {
                }
                column(STRSUBSTNO_Text000_gintPageNo; STRSUBSTNO(Text000, gintPageNo))
                {
                }
                dataitem(CurrencyLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = FILTER(1 ..));
                    PrintOnlyIfDetail = true;
                    dataitem(CustLedgEntryHdr; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        PrintOnlyIfDetail = true;
                        column(Currency2Code_CustLedgEntryHdr; STRSUBSTNO(Text001, CurrencyCode3))
                        {
                        }
                        column(StartBalance; 2)
                        {
                            AutoFormatExpression = Currency2.Code;
                            AutoFormatType = 1;
                        }
                        column(CurrencyCode3; CurrencyCode3)
                        {
                        }
                        column(CustBalance_CustLedgEntryHdr; CustBalance)
                        {
                        }
                        column(PrintLine; PrintLine)
                        {
                        }
                        column(DtldCustLedgEntryType; FORMAT(DtldCustLedgEntries."Entry Type", 0, 2))
                        {
                        }
                        column(EntriesExists; EntriesExists)
                        {
                        }
                        column(IsNewCustCurrencyGroup; IsNewCustCurrencyGroup)
                        {
                        }
                        column(BRNText_2; BRNText[2])
                        {
                        }
                        column(BRNText_1; BRNText[1])
                        {
                        }
                        column(COPYSTR_CurrencyCode313; '(' + COPYSTR(CurrencyCode3, 1, 3) + ')')
                        {
                        }
                        column(Test_Caption; Per_Caption)
                        {
                        }
                        column(gintPageNo; gintPageNo)
                        {
                        }
                        dataitem(DtldCustLedgEntries; "Detailed Cust. Ledg. Entry")
                        {
                            column(PostDate_DtldCustLedgEntries; FORMAT("Posting Date"))
                            {
                            }
                            column(DocDate_; "Cust. Ledger Entry"."Document Date")
                            {
                            }
                            column(DocNo_DtldCustLedgEntries; "Document No.")
                            {
                            }
                            column(Description; Description)
                            {
                            }
                            column(DueDate_DtldCustLedgEntries; FORMAT("Due Date"))
                            {
                            }
                            column(CurrCode_DtldCustLedgEntries; "Currency Code")
                            {
                            }
                            column(Amt_DtldCustLedgEntries; Amount)
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(RemainAmt_DtldCustLedgEntries; "Remaining Amount")
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(CustBalance; CustBalance)
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(Currency2Code; Currency2.Code)
                            {
                            }
                            column(DocumentType_DtldCustLedgEntries; DtldCustLedgEntries."Document Type")
                            {
                            }
                            column(Db; Db)
                            {
                            }
                            column(Cr; Cr)
                            {
                            }
                            column(gdecNotyetDue; gdecNotyetDue)
                            {
                            }
                            column(gdecOverdue; gdecOverdue)
                            {
                            }
                            column(gdecTotalBalance; gdecTotalBalance)
                            {
                            }
                            column(DtldCustLedgEntriesBody2OnPreSectionVisible; DtldCustLedgEntriesBody2OnPreSectionVisible)
                            {
                            }
                            column(ExternalDocumentNo_CustLedgEntry; "Cust. Ledger Entry"."External Document No.")
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                IF SkipReversedUnapplied(DtldCustLedgEntries) OR (Amount = 0) THEN
                                    CurrReport.SKIP;
                                "Remaining Amount" := 0;
                                PrintLine := TRUE;
                                CASE "Entry Type" OF
                                    "Entry Type"::"Initial Entry":
                                        BEGIN
                                            "Cust. Ledger Entry".GET("Cust. Ledger Entry No.");
                                            Description := "Cust. Ledger Entry".Description;
                                            "Due Date" := "Cust. Ledger Entry"."Due Date";
                                            "Cust. Ledger Entry".SETRANGE("Date Filter", 0D, EndDate);
                                            "Cust. Ledger Entry".CALCFIELDS("Remaining Amount");
                                            "Remaining Amount" := "Cust. Ledger Entry"."Remaining Amount";
                                            "Cust. Ledger Entry".SETRANGE("Date Filter");
                                        END;
                                    "Entry Type"::Application:
                                        BEGIN
                                            DtldCustLedgEntries2.SETCURRENTKEY("Customer No.", "Posting Date", "Entry Type");
                                            DtldCustLedgEntries2.SETRANGE("Customer No.", "Customer No.");
                                            DtldCustLedgEntries2.SETRANGE("Posting Date", "Posting Date");
                                            DtldCustLedgEntries2.SETRANGE("Entry Type", "Entry Type"::Application);
                                            DtldCustLedgEntries2.SETRANGE("Transaction No.", "Transaction No.");
                                            DtldCustLedgEntries2.SETFILTER("Currency Code", '<>%1', "Currency Code");
                                            IF NOT DtldCustLedgEntries2.ISEMPTY THEN BEGIN
                                                Description := Text005;
                                                "Due Date" := 0D;
                                            END ELSE
                                                PrintLine := FALSE;
                                        END;
                                    "Entry Type"::"Payment Discount",
                                    "Entry Type"::"Payment Discount (VAT Excl.)",
                                    "Entry Type"::"Payment Discount (VAT Adjustment)",
                                    "Entry Type"::"Payment Discount Tolerance",
                                    "Entry Type"::"Payment Discount Tolerance (VAT Excl.)",
                                    "Entry Type"::"Payment Discount Tolerance (VAT Adjustment)":
                                        BEGIN
                                            Description := Text006;
                                            "Due Date" := 0D;
                                        END;
                                    "Entry Type"::"Payment Tolerance",
                                    "Entry Type"::"Payment Tolerance (VAT Excl.)",
                                    "Entry Type"::"Payment Tolerance (VAT Adjustment)":
                                        BEGIN
                                            Description := Text014;
                                            "Due Date" := 0D;
                                        END;
                                    "Entry Type"::"Appln. Rounding",
                                    "Entry Type"::"Correction of Remaining Amount":
                                        BEGIN
                                            Description := Text007;
                                            "Due Date" := 0D;
                                        END;
                                END;

                                IF DtldCustLedgEntries."Currency Code" = '' THEN BEGIN
                                    GLSetup.GET;
                                    IF GLSetup."LCY Code" <> '' THEN
                                        CurrencyCode3 := GLSetup."LCY Code"
                                    ELSE
                                        CurrencyCode3 := 'MUR';
                                END ELSE
                                    CurrencyCode3 := Currency2.Code;


                                //IF "Cust. Ledger Entry"."Remaining Amount"=0 THEN
                                //CurrReport.SKIP;

                                IF "Remaining Amount" = 0 THEN
                                    CurrReport.SKIP;

                                //MR

                                gdecNotyetDue := 0;
                                gdecOverdue := 0;
                                gdecTotalBalance := 0;
                                IF "Due Date" > EndDate THEN BEGIN
                                    gdecNotyetDue := "Remaining Amount";
                                END ELSE BEGIN
                                    gdecOverdue := "Remaining Amount";
                                END;



                                gdecTotalBalance := gdecOverdue + gdecNotyetDue;

                                //- End MR
                                /*
                                 //COMMENTED BY MR 20070111
                                //Added by MR - 20061213
                                "Cust. Ledger Entry".RESET;
                                "Cust. Ledger Entry".SETRANGE("Cust. Ledger Entry"."Entry No.",DtldCustLedgEntries2."Cust. Ledger Entry No.");
                                "Cust. Ledger Entry".SETRANGE("Cust. Ledger Entry".Open,FALSE);
                                IF "Cust. Ledger Entry".FIND('-') THEN
                                                    CurrReport.SKIP;
                                
                                
                                //End -- Added by MR - 20061213
                                //COMMENTED BY MR 20070111
                                */
                                //Added by MR - 20070111
                                //END -- Added by MR - 20070111
                                IF PrintLine THEN BEGIN
                                    CustBalance := CustBalance + Amount;
                                    IsNewCustCurrencyGroup := IsFirstPrintLine;
                                    IsFirstPrintLine := FALSE;
                                END;

                                //DtldCustLedgEntries, Body (2) - OnPreSection()

                                //CurrReport.NEWPAGE;

                                //CurrReport.SHOWOUTPUT(PrintLine OR ("Entry Type"<>"Entry Type"::Application) );
                                Db := 0;
                                Cr := 0;
                                IF PrintLine OR ("Entry Type" <> "Entry Type"::Application) THEN BEGIN
                                    DtldCustLedgEntriesBody2OnPreSectionVisible := TRUE;
                                    IF DtldCustLedgEntries."Entry Type" = DtldCustLedgEntries."Entry Type"::Application THEN BEGIN
                                        Db := DtldCustLedgEntries."Debit Amount (LCY)";
                                        Cr := DtldCustLedgEntries."Credit Amount (LCY)";
                                    END ELSE BEGIN
                                        Db := DtldCustLedgEntries."Debit Amount";
                                        Cr := DtldCustLedgEntries."Credit Amount";
                                    END;


                                    // Khaled

                                    //CustBalance := CustBalance + Amount;
                                    StateBal := Amount;
                                    FinalBal := CustBalance;
                                    DisplayValue := "Cust. Ledger Entry"."Original Amount";
                                END ELSE
                                    DtldCustLedgEntriesBody2OnPreSectionVisible := FALSE;

                            end;

                            trigger OnPreDataItem();
                            begin

                                DtldCustLedgEntries.SETCURRENTKEY("Customer No.", "Posting Date", "Currency Code");
                                SETRANGE("Customer No.", Customer."No.");
                                SETRANGE("Posting Date", StartDate, EndDate);
                                SETRANGE("Currency Code", Currency2.Code);
                                /*
                                IF Currency2.Code = '' THEN BEGIN
                                  GLSetup.TESTFIELD("LCY Code");
                                  CurrencyCode3 := GLSetup."LCY Code"
                                END ELSE
                                  CurrencyCode3 := Currency2.Code;
                                */
                                IsFirstPrintLine := TRUE;

                            end;
                        }

                        trigger OnPreDataItem();
                        begin
                            //gintPageNo:=0;
                        end;
                    }
                    dataitem(CustLedgEntryFooter; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                    }
                    dataitem(CustLedgEntry2; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Customer No." = FIELD("No.");
                        DataItemLinkReference = Customer;
                        DataItemTableView = SORTING("Customer No.", Open, Positive, "Due Date")
                                            WHERE(Open = FILTER(true));
                        column(EntryNo_CustLedgEntry2; CustLedgEntry2."Entry No.")
                        {
                        }
                        column(OverDueEntries; STRSUBSTNO(Text002, Currency2.Code))
                        {
                        }
                        column(RemainAmt_CustLedgEntry2; "Remaining Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PostDate_CustLedgEntry2; FORMAT("Posting Date"))
                        {
                        }
                        column(DocNo_CustLedgEntry2; "Document No.")
                        {
                        }
                        column(Desc_CustLedgEntry2; Description)
                        {
                        }
                        column(DueDate_CustLedgEntry2; FORMAT("Due Date"))
                        {
                        }
                        column(OriginalAmt_CustLedgEntry2; "Original Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                        }
                        column(CurrCode_CustLedgEntry2; "Currency Code")
                        {
                        }
                        column(PrintEntriesDue; PrintEntriesDue)
                        {
                        }
                        column(Currency2Code_CustLedgEntry2; Currency2.Code)
                        {
                        }
                        column(CurrencyCode3_CustLedgEntry2; CurrencyCode3)
                        {
                        }
                        column(CustNo_CustLedgEntry2; "Customer No.")
                        {
                        }
                        column(ExternalDocumentNo_CustLedgEntry2; "External Document No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        var
                            CustLedgEntry: Record 21;
                        begin
                            IF IncludeAgingBand THEN
                                IF ("Posting Date" > EndDate) AND ("Due Date" >= EndDate) THEN
                                    CurrReport.SKIP;
                            CustLedgEntry := CustLedgEntry2;
                            CustLedgEntry.SETRANGE("Date Filter", 0D, EndDate);
                            CustLedgEntry.CALCFIELDS("Remaining Amount");
                            "Remaining Amount" := CustLedgEntry."Remaining Amount";
                            IF CustLedgEntry."Remaining Amount" = 0 THEN
                                CurrReport.SKIP;

                            IF IncludeAgingBand AND ("Posting Date" <= EndDate) THEN
                                UpdateBuffer(Currency2.Code, GetDate("Posting Date", "Due Date"), "Remaining Amount");
                            IF "Due Date" >= EndDate THEN
                                CurrReport.SKIP;
                        end;

                        trigger OnPreDataItem();
                        begin
                            /*
                            //COMMENTED BY MR 20070111
                            //Added by MR - 20061213
                            "Cust. Ledger Entry".RESET;
                            "Cust. Ledger Entry".SETRANGE("Cust. Ledger Entry"."Entry No.",DtldCustLedgEntries2."Cust. Ledger Entry No.");
                            "Cust. Ledger Entry".SETRANGE("Cust. Ledger Entry".Open,FALSE);
                            IF "Cust. Ledger Entry".FIND('-') THEN
                                                CurrReport.SKIP;
                            //End -- Added by MR - 20061213
                            //COMMENTED BY MR 20070111
                             */
                            CurrReport.CREATETOTALS("Remaining Amount");
                            IF NOT IncludeAgingBand THEN
                                SETRANGE("Due Date", 0D, EndDate - 1);
                            SETRANGE("Currency Code", Currency2.Code);
                            IF (NOT PrintEntriesDue) AND (NOT IncludeAgingBand) THEN
                                CurrReport.BREAK;

                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        gdecOverdue := 0;
                        gdecNotyetDue := 0;
                        gdecTotalBalance := 0;

                        IF Number = 1 THEN
                            Currency2.FINDFIRST;

                        REPEAT
                            IF NOT IsFirstLoop THEN
                                IsFirstLoop := TRUE
                            ELSE
                                IF Currency2.NEXT = 0 THEN
                                    CurrReport.BREAK;
                            "Cust. Ledger Entry".SETCURRENTKEY("Customer No.", "Posting Date", "Currency Code");
                            "Cust. Ledger Entry".SETRANGE("Customer No.", Customer."No.");
                            "Cust. Ledger Entry".SETRANGE("Posting Date", 0D, EndDate);
                            "Cust. Ledger Entry".SETRANGE("Currency Code", Currency2.Code);
                            EntriesExists := NOT "Cust. Ledger Entry".ISEMPTY;
                        UNTIL EntriesExists;
                        Cust2 := Customer;
                        Cust2.SETRANGE("Date Filter", 0D, StartDate - 1);
                        Cust2.SETRANGE("Currency Filter", Currency2.Code);
                        Cust2.CALCFIELDS("Net Change");
                        StartBalance := Cust2."Net Change";
                        CustBalance := Cust2."Net Change";
                    end;

                    trigger OnPreDataItem();
                    begin

                        Customer.COPYFILTER("Currency Filter", Currency2.Code);
                    end;
                }
                dataitem(AgingBandLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = FILTER(1 ..));
                    column(AgingDate1; FORMAT(AgingDate[1] + 1))
                    {
                    }
                    column(AgingDate2; FORMAT(AgingDate[2]))
                    {
                    }
                    column(AgingDate21; FORMAT(AgingDate[2] + 1))
                    {
                    }
                    column(AgingDate3; FORMAT(AgingDate[3]))
                    {
                    }
                    column(AgingDate31; FORMAT(AgingDate[3] + 1))
                    {
                    }
                    column(AgingDate4; FORMAT(AgingDate[4]))
                    {
                    }
                    column(AgingBandEndingDate; STRSUBSTNO(Text011, AgingBandEndingDate, PeriodLength, SELECTSTR(DateChoice + 1, Text013)))
                    {
                    }
                    column(AgingDate41; FORMAT(AgingDate[4] + 1))
                    {
                    }
                    column(AgingDate5; FORMAT(AgingDate[5]))
                    {
                    }
                    column(AgingBandBufCol1Amt; AgingBandBuf."Column 1 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBufCol2Amt; AgingBandBuf."Column 2 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBufCol3Amt; AgingBandBuf."Column 3 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBufCol4Amt; AgingBandBuf."Column 4 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBufCol5Amt; AgingBandBuf."Column 5 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandCurrencyCode; AgingBandCurrencyCode)
                    {
                    }
                    column(beforeCaption; beforeCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF Number = 1 THEN BEGIN
                            IF NOT AgingBandBuf.FIND('-') THEN
                                CurrReport.BREAK;
                        END ELSE
                            IF AgingBandBuf.NEXT = 0 THEN
                                CurrReport.BREAK;
                        AgingBandCurrencyCode := AgingBandBuf."Currency Code";
                        IF AgingBandCurrencyCode = '' THEN
                            AgingBandCurrencyCode := GLSetup."LCY Code";
                    end;

                    trigger OnPreDataItem();
                    begin
                        IF NOT IncludeAgingBand THEN
                            CurrReport.BREAK;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    //CustLedgEntryHdr, Header (2) - OnPreSection()
                    IF (CompanyInfo."Include Company Title") AND (CompanyInfo."Title Statement") THEN
                        CustLedgEntryHdrHeader2OnPreSectionVisible := CompanyInfo."Include Company Title"
                    ELSE
                        CustLedgEntryHdrHeader2OnPreSectionVisible := FALSE;

                    //CustLedgEntryHdr, Header (3) - OnPreSection()
                    IF (CompanyInfo."Include Company Title") AND (CompanyInfo."Title Statement" = FALSE) THEN
                        CustLedgEntryHdrHeader3OnPreSectionVisible := CompanyInfo."Include Company Title"
                    ELSE
                        CustLedgEntryHdrHeader3OnPreSectionVisible := FALSE;
                end;

                trigger OnPreDataItem();
                begin
                    gintPageNo := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                gdecOverdue := 0;
                gdecNotyetDue := 0;
                gdecTotalBalance := 0;
                /*
                CLEAR(NotDueAmt);
                CLEAR(DueAmt);
                CLEAR(BRNText);
                IF PrintBalanceNotLessThanZero THEN BEGIN
                CustomerLedger.SETCURRENTKEY("Customer No.","Posting Date","Currency Code");
                CustomerLedger.SETRANGE(CustomerLedger."Customer No.",Customer."No.");
                CustomerLedger.SETRANGE(CustomerLedger."Posting Date",StartDate,EndDate);
                CustomerLedger.SETRANGE(CustomerLedger."Currency Code",Customer."Currency Filter");
                IF CustomerLedger.FINDFIRST THEN
                 REPEAT
                   IF CustomerLedger2.GET(CustomerLedger."Cust. Ledger Entry No.") THEN BEGIN
                  IF CustomerLedger2."Due Date" > EndDate THEN
                    NotDueAmt += CustomerLedger.Amount
                  ELSE
                     DueAmt += CustomerLedger.Amount;
                  END;
                 UNTIL CustomerLedger.NEXT = 0;
                
                
                    IF (NotDueAmt + DueAmt) <= 0 THEN CurrReport.SKIP;
                END;*/

                //EIS-ZS-001 BEGIN
                IF PrintBalanceNotLessThanZero THEN BEGIN
                    DCLE.RESET;
                    DCLE.SETCURRENTKEY("Customer No.", "Posting Date", "Currency Code");
                    DCLE.SETRANGE(DCLE."Customer No.", Customer."No.");
                    DCLE.SETRANGE(DCLE."Posting Date", StartDate, EndDate);
                    DCLE.CALCSUMS(DCLE.Amount);
                    IF DCLE.Amount <= 0 THEN
                        CurrReport.SKIP;
                END;

                //EIS-ZS-001 END



                //***************************************************************************
                AgingBandBuf.DELETEALL;
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                PrintLine := FALSE;
                Cust2 := Customer;
                COPYFILTER("Currency Filter", Currency2.Code);
                IF PrintAllHavingBal THEN BEGIN
                    IF Currency2.FIND('-') THEN
                        REPEAT
                            Cust2.SETRANGE("Date Filter", 0D, EndDate);
                            Cust2.SETRANGE("Currency Filter", Currency2.Code);
                            Cust2.CALCFIELDS("Net Change");
                            PrintLine := Cust2."Net Change" <> 0;
                        UNTIL (Currency2.NEXT = 0) OR PrintLine;
                END;
                IF (NOT PrintLine) AND PrintAllHavingEntry THEN BEGIN
                    "Cust. Ledger Entry".RESET;
                    "Cust. Ledger Entry".SETCURRENTKEY("Customer No.", "Posting Date");
                    "Cust. Ledger Entry".SETRANGE("Customer No.", "No.");
                    "Cust. Ledger Entry".SETRANGE("Posting Date", StartDate, EndDate);
                    COPYFILTER("Currency Filter", "Cust. Ledger Entry"."Currency Code");
                    PrintLine := NOT "Cust. Ledger Entry".ISEMPTY;
                END;
                IF NOT PrintLine THEN
                    CurrReport.SKIP;

                //FormatAddr.Customer(CustAddr,Customer);
                //CurrReport.PAGENO := 1;

                // ----------- MKB
                CustomerInfo.GET(Customer."No.");
                CustAddr[1] := CustomerInfo.Name + ' ' + CustomerInfo."Name 2";
                CustAddr[2] := CustomerInfo.Address;
                CustAddr[3] := CustomerInfo."Address 2";
                CustAddr[4] := CustomerInfo.City;
                IF Country.GET(CustomerInfo."Country/Region Code") THEN
                    CustAddr[5] := Country.Name;
                COMPRESSARRAY(CustAddr);
                IF Customer."Business Registraton No." <> '' THEN BEGIN
                    BRNText[2] := Customer."Business Registraton No.";
                    BRNText[1] := Text017;
                END;
                // ----------- MKB
                IF NOT CurrReport.PREVIEW THEN BEGIN
                    LOCKTABLE;
                    FIND;
                    "Last Statement No." := "Last Statement No." + 1;
                    MODIFY;
                    COMMIT;
                END ELSE
                    "Last Statement No." := "Last Statement No." + 1;

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN
                        SegManagement.LogDocument(
                          7, FORMAT("Last Statement No."), 0, 0, DATABASE::Customer, "No.", "Salesperson Code", '',
                          Text003 + FORMAT("Last Statement No."), '');
                IsFirstLoop := FALSE;

            end;

            trigger OnPreDataItem();
            begin
                StartDate := DMY2Date(02, 02, 02);
                confirmation := TRUE;

                //----------------------------------------------------------------- added


                IF EndDate = 0D THEN
                    ERROR(Text016)
                ELSE BEGIN
                    IF CALCDATE('CM', EndDate) <> EndDate THEN
                        IF NOT CONFIRM('The statement date is not an end of month date: %1\OK to continue?', TRUE, EndDate)
                          THEN
                            ERROR('Operation aborted');
                END;
                //   ERROR(Text015);
                //NR:18-05-2009:A confirmation replaced the error message to allow statement print other then end of month
                //----------------------------------------------------------------- added

                AgingBandEndingDate := EndDate;
                CalcAgingBandDates;

                CompanyInfo.GET;
                //FormatAddr.Company(CompanyAddr,CompanyInfo);
                //Formataddress.Companys(CompanyAddr,CompanyInfo);
                Formataddress.CompanyRCTS(CompanyArr, CompanyInfo);
                Currency2.Code := '';
                Currency2.INSERT;
                COPYFILTER("Currency Filter", Currency.Code);
                IF Currency.FIND('-') THEN
                    REPEAT
                        Currency2 := Currency;
                        Currency2.INSERT;
                    UNTIL Currency.NEXT = 0;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("End Date"; EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = all;
                    }
                    field(ShowOverdueEntries; PrintEntriesDue)
                    {
                        Caption = 'Show Overdue Entries';
                        Enabled = false;
                        ApplicationArea = all;
                    }
                    group(Include)
                    {
                        Caption = 'Include';
                        field(IncludeAllCustomerswithLE; PrintAllHavingEntry)
                        {
                            Caption = 'Include All Customers with Ledger Entries';
                            Enabled = false;
                            MultiLine = true;
                            ApplicationArea = all;

                            trigger OnValidate();
                            begin
                                IF NOT PrintAllHavingEntry THEN
                                    PrintAllHavingBal := TRUE;
                            end;
                        }
                        field(IncludeAllCustomerswithBalance; PrintAllHavingBal)
                        {
                            Caption = 'Include All Customers with a Balance';
                            MultiLine = true;
                            ApplicationArea = all;
                            trigger OnValidate();
                            begin
                                IF NOT PrintAllHavingBal THEN
                                    PrintAllHavingEntry := TRUE;
                            end;
                        }
                        field(IncludeReversedEntries; PrintReversedEntries)
                        {
                            Caption = 'Include Reversed Entries';
                            Enabled = false;
                            ApplicationArea = all;
                        }
                        field(IncludeUnappliedEntries; PrintUnappliedEntries)
                        {
                            Caption = 'Include Unapplied Entries';
                            Enabled = false;
                            ApplicationArea = all;
                        }
                        field(DoNotPrintNeg; DoNotPrintNeg)
                        {
                            CaptionML = ENU = 'Do Not Print Bal <=0';
                            ApplicationArea = all;

                            trigger OnValidate();
                            begin
                                IF NOT PrintAllHavingBal THEN
                                    PrintAllHavingEntry := TRUE;
                            end;
                        }
                        field(PrintBalanceNotLessThanZero; PrintBalanceNotLessThanZero)
                        {
                            CaptionML = ENU = 'Exclude Bal <=0';
                            ApplicationArea = all;

                            trigger OnValidate();
                            begin
                                IF NOT PrintAllHavingBal THEN
                                    PrintAllHavingEntry := TRUE;
                            end;
                        }
                    }
                    group("Aging Band")
                    {
                        Caption = 'Aging Band';
                        Enabled = false;
                        field(IncludeAgingBand; IncludeAgingBand)
                        {
                            Caption = 'Include Aging Band';
                            ApplicationArea = all;
                        }
                        field(AgingBandPeriodLengt; PeriodLength)
                        {
                            Caption = 'Aging Band Period Length';
                            ApplicationArea = all;
                        }
                        field(AgingBandby; DateChoice)
                        {
                            Caption = 'Aging Band by';
                            OptionCaption = 'Due Date,Posting Date';
                            ApplicationArea = all;
                        }
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ApplicationArea = all;
                    }
                }
                group("Output Options")
                {
                    Caption = 'Output Options';
                    field(ReportOutput; SupportedOutputMethod)
                    {
                        Caption = 'Report Output';
                        ApplicationArea = all;
                        trigger OnValidate();
                        var
                            CustomLayoutReporting: Codeunit 8800;
                        begin
                            ShowPrintRemaining := (SupportedOutputMethod = SupportedOutputMethod::Email);

                            CASE SupportedOutputMethod OF
                                SupportedOutputMethod::Print:
                                    ChosenOutputMethod := CustomLayoutReporting.GetPrintOption;
                                SupportedOutputMethod::Preview:
                                    ChosenOutputMethod := CustomLayoutReporting.GetPreviewOption;
                                SupportedOutputMethod::PDF:
                                    ChosenOutputMethod := CustomLayoutReporting.GetPDFOption;
                                SupportedOutputMethod::Email:
                                    ChosenOutputMethod := CustomLayoutReporting.GetEmailOption;
                                SupportedOutputMethod::Excel:
                                    ChosenOutputMethod := CustomLayoutReporting.GetExcelOption;
                                SupportedOutputMethod::XML:
                                    ChosenOutputMethod := CustomLayoutReporting.GetXMLOption;
                            END;
                        end;
                    }
                    field(ChosenOutput; ChosenOutputMethod)
                    {
                        Caption = 'Chosen Output';
                        Visible = false;
                        ApplicationArea = all;
                    }
                    group(EmailOptions)
                    {
                        Caption = 'Email Options';
                        Visible = ShowPrintRemaining;
                        field(PrintMissingAddresses; PrintRemaining)
                        {
                            Caption = 'Print remaining statements';
                            ApplicationArea = all;
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            InitRequestPageDataInternal;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;


        Formataddress.Companys(CompanyArr, CompanyInfo);
        Title[1] := Text003;

        /*SalesSetup.GET;
        
        CASE SalesSetup."Logo Position on Documents" OF
          SalesSetup."Logo Position on Documents"::"No Logo":
            ;
          SalesSetup."Logo Position on Documents"::Left:
            BEGIN
              CompanyInfo1.GET;
              CompanyInfo1.CALCFIELDS(Picture);
            END;
          SalesSetup."Logo Position on Documents"::Center:
            BEGIN
              CompanyInfo2.GET;
              CompanyInfo2.CALCFIELDS(Picture);
            END;
          SalesSetup."Logo Position on Documents"::Right:
            BEGIN
              CompanyInfo3.GET;
              CompanyInfo3.CALCFIELDS(Picture);
            END;
        END;*/

        CompayInfoGRec.GET;
        CompayInfoGRec.CALCFIELDS(Picture);
        CompayInfoGRec.CALCFIELDS("Picture Statement");

        LogInteractionEnable := TRUE;

    end;

    trigger OnPreReport();
    begin
        InitRequestPageDataInternal;
    end;

    var
        Text000: Label 'Page';
        Text001: Label 'Entries %1';
        Text002: Label 'Overdue Entries %1';
        Text003: Label 'STATEMENT OF ACCOUNT';
        GLSetup: Record 98;
        SalesSetup: Record 311;
        CompanyInfo: Record 79;
        CompanyInfo1: Record 79;
        CompanyInfo2: Record 79;
        CompanyInfo3: Record 79;
        Cust2: Record 18;
        Currency: Record 4;
        Currency2: Record 4 temporary;
        Language: Record 8;
        "Cust. Ledger Entry": Record 21;
        DtldCustLedgEntries2: Record 379;
        AgingBandBuf: Record 47 temporary;
        PrintAllHavingEntry: Boolean;
        PrintAllHavingBal: Boolean;
        PrintEntriesDue: Boolean;
        PrintUnappliedEntries: Boolean;
        PrintReversedEntries: Boolean;
        PrintLine: Boolean;
        LogInteraction: Boolean;
        EntriesExists: Boolean;
        StartDate: Date;
        EndDate: Date;
        "Due Date": Date;
        CustAddr: array[8] of Text[200];
        CompanyAddr: array[8] of Text[200];
        Description: Text[200];
        StartBalance: Decimal;
        CustBalance: Decimal;
        "Remaining Amount": Decimal;
        FormatAddr: Codeunit 365;
        SegManagement: Codeunit 5051;
        CurrencyCode3: Code[10];
        Text005: Label 'Multicurrency Application';
        Text006: Label 'Payment Discount';
        Text007: Label 'Rounding';
        PeriodLength: DateFormula;
        PeriodLength2: DateFormula;
        DateChoice: Option "Due Date","Posting Date";
        AgingDate: array[5] of Date;
        Text008: Label 'You must specify the Aging Band Period Length.';
        AgingBandEndingDate: Date;
        Text010: Label 'You must specify Aging Band Ending Date.';
        Text011: Label 'Aged Summary by %1 (%2 by %3)';
        IncludeAgingBand: Boolean;
        Text012: Label 'Period Length is out of range.';
        AgingBandCurrencyCode: Code[20];
        Text013: Label 'Due Date,Posting Date';
        Text014: Label 'Application Writeoffs';
        [InDataSet]
        LogInteractionEnable: Boolean;
        Text017: Label 'BRN: ';
        Text036: Label '-%1', Comment = 'Negating the period length: %1 is the period length';
        StatementCaptionLbl: Label 'Statement';
        PhoneNo_CompanyInfoCaptionLbl: Label 'Phone No.';
        VATRegNo_CompanyInfoCaptionLbl: Label 'VAT Registration No.';
        GiroNo_CompanyInfoCaptionLbl: Label 'Giro No.';
        BankName_CompanyInfoCaptionLbl: Label 'Bank';
        BankAccNo_CompanyInfoCaptionLbl: Label 'Account No.';
        No1_CustCaptionLbl: Label 'Customer No.';
        StartDateCaptionLbl: Label 'Starting Date';
        EndDateCaptionLbl: Label 'Ending Date';
        LastStatmntNo_CustCaptionLbl: Label 'Statement No.';
        PostDate_DtldCustLedgEntriesCaptionLbl: Label 'Posting Date';
        DueDate_CustLedgEntry2CaptionLbl: Label 'Due Date';
        CustBalanceCaptionLbl: Label 'Balance';
        beforeCaptionLbl: Label '..before';
        isInitialized: Boolean;
        CompanyInfoHomepageCaptionLbl: Label 'Home Page';
        CompanyInfoEmailCaptionLbl: Label 'E-Mail';
        DocDateCaptionLbl: Label 'Document Date';
        Total_CaptionLbl: Label 'Total';
        BlankStartDateErr: Label 'Start Date must have a value.';
        BlankEndDateErr: Label 'End Date must have a value.';
        StartDateLaterTheEndDateErr: Label 'Start date must be earlier than End date.';
        IsFirstLoop: Boolean;
        CurrReportPageNoCaptionLbl: Label 'Page';
        IsFirstPrintLine: Boolean;
        IsNewCustCurrencyGroup: Boolean;
        SupportedOutputMethod: Option Print,Preview,PDF,Email,Excel,XML;
        ChosenOutputMethod: Integer;
        PrintRemaining: Boolean;
        [InDataSet]
        ShowPrintRemaining: Boolean;
        "************************ KB": Integer;
        FinalBal: Decimal;
        Debit: Decimal;
        Credit: Decimal;
        Formataddress: Codeunit "Format Addresses";
        Title: array[3] of Text[30];
        CompanyArr: array[10] of Text[100];
        Db: Decimal;
        Cr: Decimal;
        StateBal: Decimal;
        gdecOverdue: Decimal;
        gdecNotyetDue: Decimal;
        gdecTotalBalance: Decimal;
        gintPageNo: Integer;
        CustomerInfo: Record 18;
        Country: Record 9;
        confirmation: Boolean;
        DoNotPrintNeg: Boolean;
        "********************EIS*******": Integer;
        PrintPositiveBalance: Boolean;
        PrintBalanceNotLessThanZero: Boolean;
        CustomerLedger: Record 379;
        DueAmt: Decimal;
        NotDueAmt: Decimal;
        CustomerLedger2: Record 21;
        BRNText: array[2] of Text[30];
        TranDateCaptionLbl: Label 'Tran Date';
        TypeCaptionLbl: Label 'Type';
        OurRefCaptionLbl: Label 'Our Ref';
        YourRefCaptionLbl: Label 'Your Ref';
        ParticularsCaptionLbl: Label 'Particulars';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        DueDateCaptionLbl: Label 'Due Date';
        BalanceCaptionLbl: Label 'Balance';
        TickCaptionLbl: Label 'Tick';
        ItemsCaptionLbl: Label 'Items Paid';
        NotYetDueCaptionLbl: Label 'Not Yet Due';
        OverDueCaptionLbl: Label 'OverDue';
        TotalAmountDueCaptionLbl: Label 'Total Amount Due';
        REMITTANCEADVICECaptionLbl: Label 'REMITTANCE ADVICE';
        CustomerNoCaptionLbl: Label 'Customer No.';
        StatementDateCaptionLbl: Label 'Statement Date:';
        KEYCaptionLbl: Label 'KEY';
        INVCREPAYREFCaptionLbl: Label 'INV CRE PAY REF';
        InvoiceReturnPaymentRefundJournalCaptionLbl: Label 'Invoice Return Payment Refund Journal';
        ANYPAYMENTMADEAFTERTHESTATEMENTDATEARENOTINCLUDEDINTHEABOVEFIGURECaptionLbl: Label 'ANY PAYMENT MADE AFTER THE STATEMENT DATE ARE NOT INCLUDED IN THE ABOVE FIGURE';
        CustLedgEntryHdrHeader2OnPreSectionVisible: Boolean;
        CustLedgEntryHdrHeader3OnPreSectionVisible: Boolean;
        DisplayValue: Decimal;
        DtldCustLedgEntriesBody2OnPreSectionVisible: Boolean;
        Per_Caption: Label '%';
        CompayInfoGRec: Record 79;
        Text016: Label 'You must specify an Ending Date.';
        DCLE: Record 379;

    local procedure GetDate(PostingDate: Date; DueDate: Date): Date;
    begin
        IF DateChoice = DateChoice::"Posting Date" THEN
            EXIT(PostingDate);

        EXIT(DueDate);
    end;

    local procedure CalcAgingBandDates();
    begin
        IF NOT IncludeAgingBand THEN
            EXIT;
        IF AgingBandEndingDate = 0D THEN
            ERROR(Text010);
        IF FORMAT(PeriodLength) = '' THEN
            ERROR(Text008);
        EVALUATE(PeriodLength2, STRSUBSTNO(Text036, PeriodLength));
        AgingDate[5] := AgingBandEndingDate;
        AgingDate[4] := CALCDATE(PeriodLength2, AgingDate[5]);
        AgingDate[3] := CALCDATE(PeriodLength2, AgingDate[4]);
        AgingDate[2] := CALCDATE(PeriodLength2, AgingDate[3]);
        AgingDate[1] := CALCDATE(PeriodLength2, AgingDate[2]);
        IF AgingDate[2] <= AgingDate[1] THEN
            ERROR(Text012);
    end;

    local procedure UpdateBuffer(CurrencyCode: Code[10]; Date: Date; Amount: Decimal);
    var
        I: Integer;
        GoOn: Boolean;
    begin
        AgingBandBuf.INIT;
        AgingBandBuf."Currency Code" := CurrencyCode;
        IF NOT AgingBandBuf.FIND THEN
            AgingBandBuf.INSERT;
        I := 1;
        GoOn := TRUE;
        WHILE (I <= 5) AND GoOn DO BEGIN
            IF Date <= AgingDate[I] THEN
                IF I = 1 THEN BEGIN
                    AgingBandBuf."Column 1 Amt." := AgingBandBuf."Column 1 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 2 THEN BEGIN
                    AgingBandBuf."Column 2 Amt." := AgingBandBuf."Column 2 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 3 THEN BEGIN
                    AgingBandBuf."Column 3 Amt." := AgingBandBuf."Column 3 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 4 THEN BEGIN
                    AgingBandBuf."Column 4 Amt." := AgingBandBuf."Column 4 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 5 THEN BEGIN
                    AgingBandBuf."Column 5 Amt." := AgingBandBuf."Column 5 Amt." + Amount;
                    GoOn := FALSE;
                END;
            I := I + 1;
        END;
        AgingBandBuf.MODIFY;
    end;

    procedure SkipReversedUnapplied(var DtldCustLedgEntries: Record 379): Boolean;
    var
        CustLedgEntry: Record 21;
    begin
        IF PrintReversedEntries AND PrintUnappliedEntries THEN
            EXIT(FALSE);
        IF NOT PrintUnappliedEntries THEN
            IF DtldCustLedgEntries.Unapplied THEN
                EXIT(TRUE);
        IF NOT PrintReversedEntries THEN BEGIN
            CustLedgEntry.GET(DtldCustLedgEntries."Cust. Ledger Entry No.");
            IF CustLedgEntry.Reversed THEN
                EXIT(TRUE);
        END;
        EXIT(FALSE);
    end;

    procedure InitializeRequest(NewPrintEntriesDue: Boolean; NewPrintAllHavingEntry: Boolean; NewPrintAllHavingBal: Boolean; NewPrintReversedEntries: Boolean; NewPrintUnappliedEntries: Boolean; NewIncludeAgingBand: Boolean; NewPeriodLength: Text[30]; NewDateChoice: Option; NewLogInteraction: Boolean; NewStartDate: Date; NewEndDate: Date);
    begin
        InitRequestPageDataInternal;

        PrintEntriesDue := NewPrintEntriesDue;
        PrintAllHavingEntry := NewPrintAllHavingEntry;
        PrintAllHavingBal := NewPrintAllHavingBal;
        PrintReversedEntries := NewPrintReversedEntries;
        PrintUnappliedEntries := NewPrintUnappliedEntries;
        IncludeAgingBand := NewIncludeAgingBand;
        EVALUATE(PeriodLength, NewPeriodLength);
        DateChoice := NewDateChoice;
        LogInteraction := NewLogInteraction;
        StartDate := NewStartDate;
        EndDate := NewEndDate;
    end;

    procedure InitRequestPageDataInternal();
    begin
        IF isInitialized THEN
            EXIT;

        isInitialized := TRUE;

        IF (NOT PrintAllHavingEntry) AND (NOT PrintAllHavingBal) THEN
            PrintAllHavingBal := TRUE;

        LogInteraction := SegManagement.FindInteractTmplCode(7) <> '';
        LogInteractionEnable := LogInteraction;

        IF FORMAT(PeriodLength) = '' THEN
            EVALUATE(PeriodLength, '<1M+CM>');

        ShowPrintRemaining := (SupportedOutputMethod = SupportedOutputMethod::Email);
    end;

    local procedure VerifyDates();
    begin
        //IF StartDate = 0D THEN
        //ERROR(BlankStartDateErr);
        //IF EndDate = 0D THEN
        //ERROR(BlankEndDateErr);
        //IF StartDate > EndDate THEN
        //ERROR(StartDateLaterTheEndDateErr);
    end;
}

