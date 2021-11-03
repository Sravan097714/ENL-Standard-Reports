report 50004 "Service Invoice"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\ServiceInvoice.rdl';
    Caption = 'Service Invoice';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem("Service Invoice Header"; "Service Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            CalcFields = "Amount Including VAT", Amount;
            RequestFilterFields = "No.", "Bill-to Customer No.";
            //ReqFilterHeading = 'Posted Sales Invoice';
            column(No_SalesInvoiceHeader; "Service Invoice Header"."No.")
            {
            }
            column(CurrencyCode_SalesInvoiceHeader; "Service Invoice Header"."Currency Code")
            {
            }
            //>>RCTS1.0 28Oct2019
            column(Currency_Factor; CurrencyFactor) { }
            column(ROECaption; ROECaptionLbl) { }
            //<<RCTS1.0 28Oct2019
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CompInfo_IncTitle; CompanyInfo."Include Company Title")
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {
                    }
                    column(CODE_Caption; CODE_CaptionLbl)
                    {
                    }
                    column(DESCRIPTION_Caption; DESCRIPTION_CaptionLbl)
                    {
                    }
                    column(UOM_Caption; UOM_CaptionLbl)
                    {
                    }
                    column(QTY_Caption; QTY_CaptionLbl)
                    {
                    }
                    column(UNIT_PRICE_Caption; UNIT_PRICE_CaptionLbl)
                    {
                    }
                    column(DISCOUNT_Caption; DISCOUNT_CaptionLbl)
                    {
                    }
                    column(NET_PRICE_Caption; NET_PRICE_CaptionLbl)
                    {
                    }
                    column(VAT_Caption; VAT_CaptionLbl)
                    {
                    }
                    column(AMOUNT_INV_Caption; AMOUNT_INV_CaptionLbl)
                    {
                    }
                    column(Approved_By_Caption; Approved_By_CaptionLbl) { }
                    column(Delivered_By_Caption; Delivered_By_CaptionLbl)
                    {
                    }
                    column(Received_by_Caption; Received_by_CaptionLbl)
                    {
                    }
                    column(Payment_Terms_Caption; Payment_Terms_CaptionLbl)
                    {
                    }
                    column(SUB_TOTAL_Caption; SUB_TOTAL_CaptionLbl)
                    {
                    }
                    column(VAT1_Caption; VAT1_CaptionLbl)
                    {
                    }
                    column(TOTAL_Caption; TOTAL_CaptionLbl)
                    {
                    }
                    column(ShortcutDimension1Code_SalesInvoiceHeader; "Service Invoice Header"."Shortcut Dimension 1 Code")
                    {
                    }
                    column(ExternalDocumentNo_SalesInvoiceHeader; '')
                    {
                    }
                    column(ShipContact; "Service Invoice Header"."Ship-to Contact") { }
                    column(BillContact; "Service Invoice Header"."Bill-to Contact") { }
                    column(PostingDate_SalesInvoiceHeader; "Service Invoice Header"."Posting Date")
                    {
                    }
                    column(BilltoCustomerNo_SalesInvoiceHeader; "Service Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(SalesInvoiceHeader_Pre_Assigned_No_SalesInvoiceHeader_Order_No; "Service Invoice Header"."Pre-Assigned No." + "Service Invoice Header"."Order No.")
                    {
                    }
                    column(VATRegistrationNo_SalesInvoiceHeader; "Service Invoice Header"."VAT Registration No.")
                    {
                    }
                    column(CurrReport_PAGENO; CurrReport.PAGENO)
                    {
                    }
                    column(CurrCode; CurrCode)
                    {
                    }
                    column(UPPERCASE_CompanyInfo_Name; UPPERCASE(CompanyInfo.Name))
                    {
                    }
                    column(CompanyArr1_CompanyArr2_CompanyArr3_CompanyArr4; CompanyArr[1] + CompanyArr[2] + CompanyArr[3] + CompanyArr[4])
                    {
                    }
                    column(CompanyArr1; CompanyArr[1])
                    {
                    }
                    column(CompanyArr2; CompanyArr[2])
                    {
                    }
                    column(CompanyArr3; CompanyArr[3])
                    {
                    }
                    column(CompanyArr4; CompanyArr[4])
                    {
                    }
                    column(CompanyArr5_CompanyArr6_CompanyArr7_CompanyArr8; CompanyArr[5] + CompanyArr[6] + CompanyArr[7] + CompanyArr[8])
                    {
                    }
                    column(CompanyArr5_; CompanyArr[5])
                    {
                    }
                    column(CompanyArr6_; CompanyArr[6])
                    {
                    }
                    column(CompanyArr7_; CompanyArr[7])
                    {
                    }
                    column(CompanyArr8_; CompanyArr[8])
                    {
                    }

                    column(CompanyArr9_CompanyArr10; CompanyArr[9] + CompanyArr[10])
                    {
                    }
                    column(CompanyArr9; CompanyArr[9])
                    {
                    }
                    column(CompanyArr10; CompanyArr[10])
                    {
                    }
                    column(Title_2_; Title[2])
                    {
                    }
                    column(Title_1_; Title[1])
                    {
                    }
                    column(YourRef; YourRef)
                    {
                    }
                    column(B_UNIT_Caption; B_UNIT_CaptionLbl)
                    {
                    }
                    column(INVOICE_NO_Caption; INVOICE_NO_CaptionLbl)
                    {
                    }
                    column(DATE_Caption; DATE_CaptionLbl)
                    {
                    }
                    column(PAGE_NO_Caption; PAGE_NO_CaptionLbl)
                    {
                    }
                    column(CLIENT_CODE_Caption; CLIENT_CODE_CaptionLbl)
                    {
                    }
                    column(CURRENCY_Caption; CURRENCY_CaptionLbl)
                    {
                    }
                    column(SALES_NO_Caption; SALES_NO_CaptionLbl)
                    {
                    }
                    column(CUSTOMER_DETAILS_Caption; CUSTOMER_DETAILS_CaptionLbl)
                    {
                    }
                    column(DELIVERED_TO_Caption; DELIVERED_TO_CaptionLbl)
                    {
                    }
                    column(Colun_Caption; Colun_CaptionLbl)
                    {
                    }
                    column(CustAddr_1_; CustAddr[1])
                    {
                    }
                    column(CustAddr_2_; CustAddr[2])
                    {
                    }
                    column(CustAddr_3_; CustAddr[3])
                    {
                    }
                    column(CustAddr_4_; CustAddr[4])
                    {
                    }
                    column(CustAddr_5_; CustAddr[5])
                    {
                    }
                    column(CustAddr_6_; CustAddr[6])
                    {
                    }
                    column(CustAddr_7_; CustAddr[7])
                    {
                    }
                    column(ShipToAddr_1_; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddr_2_; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddr_3_; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddr_4_; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddr_5_; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddr_6_; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddr_7_; ShipToAddr[7])
                    {
                    }
                    column(BRNText_1_; BRNText[1])
                    {
                    }
                    column(BRNText_2_; BRNText[2])
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(VatDisplay; VatDisplay)
                    {
                    }
                    column(CompanyInfo_Include_Company_Title; CompanyInfo."Include Company Title")
                    {
                    }
                    column(Financial_Charges_Caption; ARPayTerms."Payment Terms 1")
                    {
                    }
                    column(All_legal_fees_Caption; ARPayTerms."Payment Terms 2")
                    {
                    }
                    column(ServiceOrderNo; "Service Invoice Header"."Order No.")
                    {
                    }
                    column(ServiceOrderNoCap_; ServiceOrderNoCap)
                    {
                    }
                    column(ServiceItemNoDescrip_; ServiceItemNoDescrip)
                    {
                    }
                    column(ContractNo_; "Service Invoice Header"."Contract No.")
                    {
                    }
                    column(ContractNoCap_; ContractNoCap)
                    {
                    }
                    column(ContractNoDescrip; '')
                    {
                    }
                    column(ServOrderNo; '')
                    {

                    }
                    column(Approved_By; ApprovedBy)
                    {
                    }
                    column(PriceIncVat; "Service Invoice Header"."Prices Including VAT")
                    {

                    }
                    //>>RCTS1.0 22Oct2019
                    column(BankAccNo; BankAcc."Bank Account No.") { }
                    column(BankAccName; BankAcc.Name) { }
                    column(IBAN; BankAcc.IBAN) { }
                    column(SWIFTCode; BankAcc."SWIFT Code") { }
                    column(PrintBankDetails; '') { }
                    column(BankNameCaption; BankNameCaptionLbl) { }
                    column(AccountNoCaption; AccountNoCaptionLbl) { }
                    column(IBANCaption; IBANCaptionLbl) { }
                    column(SWIFTCodeCaption; SWIFTCodeCaptionLbl) { }
                    //<<RCTS1.0 22Oct2019
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Service Invoice Header";
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Service Invoice Line"; "Service Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Service Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(ZERO_RATED_Z_Caption; ZERO_RATED_Z_CaptionLbl)
                        {
                        }
                        column(EXEMPTED_E_Caption; EXEMPTED_E_CaptionLbl)
                        {
                        }
                        column(TAXABLE_T_Caption; TAXABLE_T_CaptionLbl)
                        {
                        }
                        column(Dot_Caption; Dot_CaptionLbl)
                        {
                        }
                        column(No_SalesInvoiceLine; "Service Invoice Line"."No.")
                        {
                        }
                        column(LineNo_SalesInvoiceLine; "Service Invoice Line"."Line No.")
                        {
                        }
                        column(LineDiscountAmount_SalesInvoiceLine; "Service Invoice Line"."Line Discount Amount")
                        {
                        }
                        column(UnitPrice_SalesInvoiceLine; "Service Invoice Line"."Unit Price")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                        }
                        column(Description_SalesInvoiceLine; COPYSTR("Service Invoice Line".Description, 1, 30))
                        {
                        }
                        column(UnitofMeasureCode_SalesInvoiceLine; "Service Invoice Line"."Unit of Measure Code")
                        {
                        }
                        column(Quantity_SalesInvoiceLine; "Service Invoice Line".Quantity)
                        {
                        }
                        column(LineAmount_SalesInvoiceLine; "Service Invoice Line"."Line Amount")
                        {
                        }
                        column(VATStatus; VATStatus)
                        {
                        }
                        column(AmountIncludingVAT_SalesInvoiceLine; "Service Invoice Line"."Amount Including VAT")
                        {
                        }
                        column(LineAmt; LineAmt)
                        {
                        }
                        column(Amount_SalesInvoiceLine; "Service Invoice Line"."Amount Including VAT" - "Service Invoice Line".Amount)
                        {
                        }
                        column(VATLCY; VATLCY) { }
                        column(Amount_Including_VAT_Amount; "Amount Including VAT" - Amount)
                        {
                        }
                        column(VATPerc; VATPerc)
                        {
                        }
                        column(AmtIncl; AmtIncl)
                        {
                        }
                        column(AmountIncludingVAT; "Amount Including VAT")
                        {
                        }
                        column(LineAmountPIV; "Service Invoice Line".Amount)
                        {
                        }
                        column(NetPrice_1_; NetPrice[1])
                        {
                        }
                        column(NetPrice_2_; NetPrice[2])
                        {
                        }
                        column(NetPrice_3_; NetPrice[3])
                        {
                        }
                        column(AmtInvoiced_1_; AmtInvoiced[1])
                        {
                        }
                        column(AmtInvoiced_2_; AmtInvoiced[2])
                        {
                        }
                        column(AmtInvoiced_3_; AmtInvoiced[3])
                        {
                        }
                        column(PaymentTerms_Description; PaymentTerms.Description)
                        {
                        }
                        column(No_SILItem; "No.")
                        {
                        }
                        column(ItemCatCodeGVar; ItemCatCodeGVar)
                        {
                        }
                        column(Description_SILItem; Description)
                        {
                        }
                        column(UnitofMeasureCode_SILITEM; "Unit of Measure Code")
                        {
                        }
                        column(Quantity_SILITEM; Quantity)
                        {
                        }
                        column(LineAmount_SILITEM; "Line Amount")
                        {
                        }
                        column(VATStatus_SILITEM; VATStatus)
                        {
                        }
                        column(AmountIncludingVAT_SILITEM; "Amount Including VAT")
                        {
                        }
                        column(LineDiscountAmount_SILITEM; "Line Discount Amount")
                        {
                        }
                        column(UnitPrice_SILITEM; "Unit Price")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                        }
                        column(Type_ServiceInvoiceLine; "Service Invoice Line".Type)
                        {
                        }
                        column(ConsumeAmtGVar; ConsumeAmtGVar)
                        {
                        }
                        column(ConsumeAmtExeVatGVar; ConsumeAmtExeVatGVar)
                        {
                        }
                        column(ShowLineGVar; ShowLineGVar)
                        {
                        }
                        column(ResourcesAmtGVar; ResourcesAmtGVar)
                        {
                        }
                        column(ResourcesAmtExeVatGVar; ResourcesAmtExeVatGVar)
                        {
                        }
                        column(LubAmtGVar; LubAmtGVar)
                        {
                        }
                        column(LubAmtExeVatGVar; LubAmtExeVatGVar)
                        {
                        }
                        column(Descrip; Descrip)
                        {
                        }
                        dataitem("Sales Shipment Buffer"; Integer)
                        {
                            DataItemTableView = SORTING(Number);

                            trigger OnAfterGetRecord();
                            begin

                                IF Number = 1 THEN
                                    SalesShipmentBuffer.FIND('-')
                                ELSE
                                    SalesShipmentBuffer.NEXT;
                            end;

                            trigger OnPreDataItem();
                            begin

                                SalesShipmentBuffer.SETRANGE("Document No.", "Service Invoice Line"."Document No.");
                                SalesShipmentBuffer.SETRANGE("Line No.", "Service Invoice Line"."Line No.");

                                SETRANGE(Number, 1, SalesShipmentBuffer.COUNT);
                            end;
                        }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Service Invoice Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF "Service Invoice Line".Type = "Service Invoice Line".Type::" " THEN BEGIN

                                IF ItemGRec.GET("No.") THEN BEGIN
                                    IF ItemGRec."Item Category Code" = 'CONSUMABLE' THEN BEGIN
                                        ConsumeAmtGVar += "Amount Including VAT";
                                        ConsumeAmtExeVatGVar += "Line Amount";
                                        ShowLineGVar := FALSE;
                                    END ELSE
                                        IF ItemGRec."Item Category Code" = 'LUBRICANT' THEN BEGIN
                                            LubAmtGVar += "Amount Including VAT";
                                            LubAmtExeVatGVar += "Line Amount";
                                            ShowLineGVar := FALSE;
                                        END ELSE
                                            IF ItemGRec."Item Category Code" = 'RESOURCES' THEN BEGIN
                                                ResourcesAmtGVar += "Amount Including VAT";
                                                ResourcesAmtExeVatGVar += "Line Amount";
                                                ShowLineGVar := FALSE;
                                            END ELSE BEGIN
                                                ItemCatCodeGVar := ItemGRec."Item Category Code";
                                                ShowLineGVar := TRUE;
                                            END;
                                    ItemCatCodeGVar := ItemGRec."Item Category Code";
                                END ELSE
                                    ShowLineGVar := TRUE;
                                //RCTS End Buntish 25/04/18

                                PostedShipmentDate := 0D;
                                CLEAR(LineAmt);
                                CLEAR(AmtIncl);
                                IF Quantity <> 0 THEN
                                    PostedShipmentDate := FindPostedShipmentDate;

                                IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                    "No." := '';

                                IF VATPostingSetup.GET("Service Invoice Line"."VAT Bus. Posting Group", "Service Invoice Line"."VAT Prod. Posting Group") THEN
                                    VATStatus := COPYSTR(VATPostingSetup."VAT Identifier", 1, 1)
                                ELSE
                                    CLEAR(VATStatus);

                                IF ("Service Invoice Line"."No." = '') AND
                                   ("Service Invoice Line".Quantity = 0) AND
                                   ("Service Invoice Line"."Unit Price" = 0) THEN
                                    CLEAR(VATStatus);


                                //asaad 301007-----------------------------------------------------------------------

                                //SO-002**********************************************************************

                                if "Service Invoice Line".Amount = 0 then
                                    "Service Invoice Line".Description := "Service Invoice Line".Description;
                                IF DocNo = "Service Invoice Line"."Document No." THEN BEGIN
                                    CASE VATStatus OF
                                        'Z':
                                            BEGIN
                                                NetPrice[1] += "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[1] += "Service Invoice Line"."Amount Including VAT";
                                            END;
                                        'T':
                                            BEGIN
                                                NetPrice[3] += "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[3] += "Service Invoice Line"."Amount Including VAT";
                                                IF "VAT %" <> 0 THEN
                                                    Taxable := "VAT %";
                                            END;

                                        'E':
                                            BEGIN
                                                NetPrice[2] += "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[2] += "Service Invoice Line"."Amount Including VAT";
                                            END;

                                        ELSE BEGIN
                                                NetPrice[4] += "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[4] += "Service Invoice Line"."Amount Including VAT";
                                            END;


                                    END;
                                END ELSE BEGIN
                                    DocNo := "Service Invoice Line"."Document No.";
                                    CLEAR(NetPrice);
                                    CLEAR(AmtInvoiced);
                                    CASE VATStatus OF
                                        'Z':
                                            BEGIN
                                                NetPrice[1] := "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[1] := "Service Invoice Line"."Amount Including VAT";
                                            END;
                                        'T':
                                            BEGIN
                                                NetPrice[3] := "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[3] += "Service Invoice Line"."Amount Including VAT";
                                                IF "VAT %" <> 0 THEN
                                                    Taxable := "VAT %";
                                            END;

                                        'E':
                                            BEGIN
                                                NetPrice[2] := "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[2] := "Service Invoice Line"."Amount Including VAT";
                                            END;

                                        ELSE BEGIN
                                                NetPrice[4] := "Service Invoice Line"."Line Amount";
                                                AmtInvoiced[4] := "Service Invoice Line"."Amount Including VAT";
                                            END;


                                    END;

                                END;

                                //SO-001**********************************************************************
                                //asaad 301007-------------------------------------------------------------------------


                                //IF "Service Invoice Line"."Ref Line No." = 0 THEN BEGIN//RCTS1.0
                                LineAmt := "Service Invoice Line"."Line Amount";
                                AmtIncl := "Amount Including VAT";
                                //END;

                                VATAmountLine.INIT;
                                //VATAmountLine."VAT Identifier" := "VAT Identifier";
                                //VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                                //VATAmountLine."Tax Group Code" := "Tax Group Code";
                                VATAmountLine."VAT %" := "VAT %";
                                //VATAmountLine."VAT Base" := Amount;
                                //VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                                //VATAmountLine."Line Amount" := "Line Amount";
                                //IF "Allow Invoice Disc." THEN
                                //  VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                                //VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                                VATAmountLine.InsertLine;

                                // 110416
                                IF "VAT %" <> 0 THEN
                                    VATPerc := "VAT %";

                            end;
                        end;

                        trigger OnPreDataItem();
                        begin

                            VATAmountLine.DELETEALL;
                            SalesShipmentBuffer.RESET;
                            SalesShipmentBuffer.DELETEALL;
                            FirstValueEntryNo := 0;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount", LineAmt, AmtIncl);



                            CLEAR(NetPrice);       //asaad 30/10/07
                            CLEAR(AmtInvoiced);    //asaad 30/10/07
                            CLEAR(ConsumeAmtExeVatGVar);
                            CLEAR(ConsumeAmtGVar);
                            CLEAR(ResourcesAmtExeVatGVar);
                            CLEAR(ResourcesAmtGVar);
                            CLEAR(Descrip);
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin

                            IF VATAmountLine.GetTotalVATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));

                        trigger OnAfterGetRecord();
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF ARPayTerms.GET THEN;
                    end;
                }

                trigger OnAfterGetRecord();
                begin

                    IF Number > 1 THEN BEGIN
                        //CopyText := Text003;
                        if not OnPost then//B2B
                            Title[2] := Text003;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin


                    IF NOT CurrReport.PREVIEW THEN
                        SalesInvCountPrinted.RUN("Service Invoice Header");

                end;

                trigger OnPreDataItem();
                begin

                    NoOfLoops := ABS(NoOfCopies) + Cust."Invoice Copies";
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord();
            var
                Country: Record "Country/Region";
            begin
                //B2B>>
                Clear(OnPost);
                if ("Service Invoice Header"."No. Printed" = 0) and (NoOfCopies = 0) then begin
                    NoOfCopies := 2;
                    OnPost := true;
                end;
                //B2B<<
                //RCTS Start Buntish 25/04/18
                ServiceInvoiceLine.RESET;
                ServiceInvoiceLine.SETRANGE(ServiceInvoiceLine."Document No.", "Service Invoice Header"."No.");
                IF ServiceInvoiceLine.FINDLAST THEN
                    //ServiceItemNoDescrip:=FORMAT(ServiceInvoiceLine."Service Item No.")+' - '+ServiceInvoiceLine."Service Item Line Description";
                    IF ServiceItem.GET(ServiceInvoiceLine."Service Item No.") THEN
                        ServiceItemNoDescrip := FORMAT(ServiceInvoiceLine."Service Item No.") + ' - ' + ServiceItem.Description;
                //RCTS End Buntish 25/04/18

                CLEAR(CurrCode);
                CLEAR(BRNText);
                // NK-004
                /*
                 IF "Service Invoice Header"."No. Printed" > 0 THEN BEGIN
                  IF EISLibrary.UserAccessValidation(USERID,29) = FALSE THEN
                   ERROR('You are not allowed to Reprint');
                 END;
               */
                //NK-004
                // User.RESET;
                // User.SETRANGE(User."User Name", "Service Invoice Header"."Approved By");
                // IF User.FINDLAST THEN BEGIN
                //     ApprovedBy := User."Full Name";
                // END;


                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                //SO-001****************************************************************************************************************************
                IF CompanyInfo."VAT Registration No." <> '' THEN
                    Title[1] := 'VAT INVOICE'
                ELSE
                    Title[1] := 'INVOICE';

                // NK-002
                //Title[1] := TecLibrary.VATInvoiceheader("Service Invoice Header"."Posting Date",Title[1]);


                IF "Service Invoice Header"."No. Printed" > 0 THEN
                    Title[2] := 'COPY'
                ELSE
                    Title[2] := '';
                /*
                IF "Service Invoice Header"."External Document No." <>'' THEN BEGIN
                 YourRef := Text007;
                 Dot := Text008;
                END ELSE BEGIN
                 CLEAR(YourRef);
                 CLEAR(Dot);
                END;
                *///RCTS1.0
                IF "VAT Registration No." <> '' THEN
                    VatDisplay := Text009
                ELSE
                    CLEAR(VatDisplay);

                IF "Service Invoice Header"."Currency Code" <> '' THEN begin
                    CurrCode := COPYSTR("Service Invoice Header"."Currency Code", 1, 3);
                    VATLCY += (1 / "Service Invoice Header"."Currency Factor") * ("Amount Including VAT" - Amount);

                end ELSE BEGIN
                    IF GLSetup.GET THEN
                        CurrCode := GLSetup."LCY Code";
                END;

                //END SO-001************************************************************************************************************************


                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
                END;

                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");


                FormatAddr.ServiceInvBillTo(CustAddr, "Service Invoice Header");


                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE
                    PaymentTerms.GET("Payment Terms Code");


                Formataddress.GetCustomer("Service Invoice Header"."Bill-to Customer No.", BRNText[2], BRNText[1]);
                FormatAddr.ServiceInvShipTo(ShipToAddr, CustAddr, "Service Invoice Header");

                if "Service Invoice Header"."Bill-to Contact" <> '' then begin
                    CustAddr[4] := "Service Invoice Header"."Bill-to City";
                end else
                    CustAddr[3] := "Service Invoice Header"."Bill-to City";

                if "Service Invoice Header"."Ship-to Contact" <> '' then begin
                    ShipToAddr[4] := "Service Invoice Header"."Ship-to City";
                end else
                    ShipToAddr[3] := "Service Invoice Header"."Ship-to City";
                //ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";//RCTS1.0
                CustAddr[1] := "Service Invoice Header"."Bill-to Name" + ' ' + "Service Invoice Header"."Bill-to Name 2";
                CustAddr[2] := "Service Invoice Header"."Bill-to Address";
                CustAddr[3] := "Service Invoice Header"."Bill-to Address 2";
                CustAddr[4] := "Service Invoice Header"."Bill-to City";
                IF Country.GET("Service Invoice Header"."Bill-to Country/Region Code") THEN
                    CustAddr[5] := Country.Name;
                ShipToAddr[1] := "Service Invoice Header"."Ship-to Name" + ' ' + "Service Invoice Header"."Ship-to Name 2";
                ShipToAddr[2] := "Service Invoice Header"."Ship-to Address";
                ShipToAddr[3] := "Service Invoice Header"."Ship-to Address 2";
                ShipToAddr[4] := "Service Invoice Header"."Ship-to City";
                IF Country.GET("Service Invoice Header"."Ship-to Country/Region Code") THEN
                    ShipToAddr[5] := Country.Name;

                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;


                // 110416

                VATPerc := 0;

                // //>>RCTS1.0 22Oct2019
                // if not BankAcc.get("Bank Account No.") then
                //     Clear(BankAcc);
                // CurrencyFactor := 0;
                // if "Currency Factor" <> 0 then
                //     CurrencyFactor := 1 / "Currency Factor";
                // //<<RCTS1.0 22Oct2019
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("No. of Copies"; NoOfCopies)
                    {
                        ApplicationArea = all;
                    }
                    field("Show Internal Information"; ShowInternalInfo)
                    {
                        Visible = false;
                    }
                    field("Log Interaction"; LogInteraction)
                    {
                        Visible = false;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin

        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        Formataddress.CompanyRCTS(CompanyArr, CompanyInfo);
    end;

    var
        GLSetup: Record 98;
        ShipmentMethod: Record 10;
        PaymentTerms: Record 3;
        SalesPurchPerson: Record 13;
        CompanyInfo: Record 79;
        CompanyInfo1: Record 79;
        CompanyInfo2: Record 79;
        SalesSetup: Record 311;
        Cust: Record 18;
        VATAmountLine: Record 290 temporary;
        RespCenter: Record 5714;
        Language: Record 8;
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit 5051;
        SalesShipmentBuffer: Record 7190 temporary;
        PostedShipmentDate: Date;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        OrderNoText: Text[30];
        SalesPersonText: Text[30];
        VATNoText: Text[30];
        ReferenceText: Text[30];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OnPost: Boolean;
        ShowShippingAddr: Boolean;
        i: Integer;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        Title: array[3] of Text[30];
        Item: Record 27;
        VATStatus: Text[1];
        Formataddress: Codeunit "Format Addresses";
        CompanyArr: array[10] of Text[95];
        YourRef: Code[8];
        Dot: Text[1];
        VatDisplay: Text[30];
        VATPostingSetup: Record 325;
        CurrCode: Code[3];
        "eisAsaad-----------301007": Integer;
        DocNo: Code[20];
        NetPrice: array[4] of Decimal;
        AmtInvoiced: array[4] of Decimal;
        Taxable: Decimal;
        Customer: Record 18;
        BRNText: array[2] of Text[30];
        LineAmt: Decimal;
        AmtIncl: Decimal;
        //TecLibrary: Codeunit 50025;
        VATPerc: Decimal;
        //EISLibrary: Codeunit 50000;
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Sales - Invoice %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        Text007: Label 'YOUR REF';
        Text008: Label ':';
        Text009: Label 'VAT REG NO :';
        Text010: Label 'BRN: ';
        B_UNIT_CaptionLbl: Label 'B/UNIT';
        INVOICE_NO_CaptionLbl: Label 'INVOICE NO';
        DATE_CaptionLbl: Label 'DATE';
        PAGE_NO_CaptionLbl: Label 'PAGE NO';
        CLIENT_CODE_CaptionLbl: Label 'CLIENT CODE';
        CURRENCY_CaptionLbl: Label 'CURRENCY';
        SALES_NO_CaptionLbl: Label 'SALES NO';
        CUSTOMER_DETAILS_CaptionLbl: Label 'CUSTOMER DETAILS';
        DELIVERED_TO_CaptionLbl: Label 'DELIVERED TO';
        CODE_CaptionLbl: Label 'CODE';
        DESCRIPTION_CaptionLbl: Label 'DESCRIPTION';
        UOM_CaptionLbl: Label 'UOM';
        QTY_CaptionLbl: Label 'QTY';
        UNIT_PRICE_CaptionLbl: Label 'UNIT PRICE';
        DISCOUNT_CaptionLbl: Label 'DISCOUNT';
        NET_PRICE_CaptionLbl: Label 'NET PRICE';
        VAT_CaptionLbl: Label 'VAT';
        AMOUNT_INV_CaptionLbl: Label 'AMOUNT INCL. VAT';
        Delivered_By_CaptionLbl: Label 'Delivered By:';
        Approved_By_CaptionLbl: Label 'Approved By:';
        Received_by_CaptionLbl: Label 'Received by:';
        Payment_Terms_CaptionLbl: Label 'Payment Terms';
        SUB_TOTAL_CaptionLbl: Label 'SUB TOTAL';
        VAT1_CaptionLbl: Label 'VAT';
        TOTAL_CaptionLbl: Label 'TOTAL';
        ZERO_RATED_Z_CaptionLbl: Label 'ZERO RATED -Z';
        EXEMPTED_E_CaptionLbl: Label 'EXEMPTED-E';
        TAXABLE_T_CaptionLbl: Label 'TAXABLE-T';
        Financial_Charges_CaptionLbl: Label 'Financial Charges at an annual rate of 3% pa above the Bank of Mauritius repo rate will be charged on all overdue balance';
        All_legal_fees_CaptionLbl: Label 'All legal fees will be charged to the customer for recovery through an Attorney / Solicitor';
        OutputNo: Integer;
        Dot_CaptionLbl: Label '................................................................';
        Colun_CaptionLbl: Label ':';
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
        ARPayTerms: Record "Company Information";
        ItemGRec: Record 27;
        ItemCatCodeGVar: Code[10];
        ConsumeAmtGVar: Decimal;
        ConsumeAmtExeVatGVar: Decimal;
        ShowLineGVar: Boolean;
        ServiceItemNoDescrip: Text[250];
        ServiceOrderNoCap: Label 'SERVICE ORDER NO';
        ServiceItemLine: Record 5901;
        ContractNoCap: Label 'CONTRACT NO';
        ServiceHeader: Record 5900;
        ContractNo: Text[50];
        ServiceInvoiceLine: Record 5993;
        ResourcesAmtGVar: Decimal;
        ResourcesAmtExeVatGVar: Decimal;
        LubAmtGVar: Decimal;
        LubAmtExeVatGVar: Decimal;
        Descrip: Text[250];
        Descrip1: Text[250];
        ServInvHdr: Record 5992;
        ServiceItem: Record 5940;
        SalesInvCountPrinted: Codeunit 5902;
        User: Record 2000000120;
        ApprovedBy: Text;
        VATLCY: Decimal;
        //>>RCTS1.0 22Oct2019
        BankAcc: Record "Bank Account";
        BankDetailsCaptionLbl: Label 'Bank Details';
        BankNameCaptionLbl: Label 'Bank Name';
        AccountNoCaptionLbl: Label 'Account No.';
        IBANCaptionLbl: Label 'IBAN';
        SWIFTCodeCaptionLbl: label 'SWIFT Code';
        ROECaptionLbl: Label 'ROE for VAT purposes';
        CurrencyFactor: Decimal;
    //<<RCTS1.0 22Oct2019
    procedure FindPostedShipmentDate(): Date;
    var
        SalesShipmentHeader: Record 110;
        SalesShipmentBuffer2: Record 7190 temporary;
    begin
        NextEntryNo := 1;
        IF "Service Invoice Line"."Shipment No." <> '' THEN
            IF SalesShipmentHeader.GET("Service Invoice Line"."Shipment No.") THEN
                EXIT(SalesShipmentHeader."Posting Date");

        IF "Service Invoice Header"."Order No." = '' THEN
            EXIT("Service Invoice Header"."Posting Date");

        CASE "Service Invoice Line".Type OF
            "Service Invoice Line".Type::Item:
                GenerateBufferFromValueEntry("Service Invoice Line");
            "Service Invoice Line".Type::"G/L Account", "Service Invoice Line".Type::Resource:
                GenerateBufferFromShipment("Service Invoice Line");
            "Service Invoice Line".Type::" ":
                EXIT(0D);
        END;

        SalesShipmentBuffer.RESET;
        SalesShipmentBuffer.SETRANGE("Document No.", "Service Invoice Line"."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", "Service Invoice Line"."Line No.");
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer2 := SalesShipmentBuffer;
            IF SalesShipmentBuffer.NEXT = 0 THEN BEGIN
                SalesShipmentBuffer.GET(
                  SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                SalesShipmentBuffer.DELETE;
                EXIT(SalesShipmentBuffer2."Posting Date");
                ;
            END;
            SalesShipmentBuffer.CALCSUMS(Quantity);
            IF SalesShipmentBuffer.Quantity <> "Service Invoice Line".Quantity THEN BEGIN
                SalesShipmentBuffer.DELETEALL;
                EXIT("Service Invoice Header"."Posting Date");
            END;
        END ELSE
            EXIT("Service Invoice Header"."Posting Date");
    end;

    procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record 5993);
    var
        ValueEntry: Record 5802;
        ItemLedgerEntry: Record 32;
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.", "Posting Date");
        ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", "Service Invoice Header"."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure GenerateBufferFromShipment(SalesInvoiceLine: Record 5993);
    var
        SalesInvoiceHeader: Record 112;
        SalesInvoiceLine2: Record 113;
        SalesShipmentHeader: Record 110;
        SalesShipmentLine: Record 111;
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SETCURRENTKEY("Order No.");
        SalesInvoiceHeader.SETFILTER("No.", '..%1', "Service Invoice Header"."No.");
        SalesInvoiceHeader.SETRANGE("Order No.", "Service Invoice Header"."Order No.");
        IF SalesInvoiceHeader.FIND('-') THEN
            REPEAT
                SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                IF SalesInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    UNTIL SalesInvoiceLine2.NEXT = 0;
            UNTIL SalesInvoiceHeader.NEXT = 0;

        SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        SalesShipmentLine.SETRANGE("Order No.", "Service Invoice Header"."Order No.");
        SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF SalesShipmentLine.FIND('-') THEN
            REPEAT
                //IF "Service Invoice Header"."Get Shipment Used" THEN
                //CorrectShipment(SalesShipmentLine);RCTS1.0
                IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN BEGIN
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                    END;
                END;
            UNTIL (SalesShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure CorrectShipment(var SalesShipmentLine: Record 111);
    var
        SalesInvoiceLine: Record 113;
    begin
        SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
        IF SalesInvoiceLine.FIND('-') THEN
            REPEAT
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            UNTIL SalesInvoiceLine.NEXT = 0;
    end;

    procedure AddBufferEntry(SalesInvoiceLine: Record 5993; QtyOnShipment: Decimal; PostingDate: Date);
    begin
        SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.MODIFY;
            EXIT;
        END;

        WITH SalesShipmentBuffer DO BEGIN
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            INSERT;
            NextEntryNo := NextEntryNo + 1
        END;
    end;
}

