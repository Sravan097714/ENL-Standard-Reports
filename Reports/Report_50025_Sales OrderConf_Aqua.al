report 50025 "Sales Order Confirmation Aqua"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\Sales Order Confirmation Aqua.rdl';
    ApplicationArea = all;
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";

            column(OrderNoCaption; OrderNoCaptionLbl)
            {
            }
            column(PageNoCaption; PageNoCaptionLbl)
            {
            }
            column(ClientCodeCaption; ClientCodeCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(CurrencyCaption; CurrencyCaptionLbl)
            {
            }
            column(CustomerDetailsCaption; CustomerDetailsCaptionLbl)
            {
            }
            column(ShipToAddressCaption; ShipToAddressCaptionLbl)
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(UomCaption; UomCaptionLbl)
            {
            }
            column(UnitPriceCaption; UnitPriceCaptionLbl)
            {
            }
            column(DiscCaption; DiscCaptionLbl)
            {
            }
            column(VATCaption; VATCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(SubtotalCaption; SubtotalCaptionLbl)
            {
            }
            column(TakenByCaption; TakenByCaptionLbl)
            {
            }
            column(CustomerReferenceCaption; CustomerReferenceCaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(PricesIncludingVAT_SalesHeader; "Sales Header"."Prices Including VAT")
            {
            }
            column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
            {
            }
            column(PreparedBy_SalesHeader; '')
            {
            }
            column(ExternalDocumentNo_SalesHeader; "Sales Header"."External Document No.")
            {
            }
            column(Remarks_SalesHeader; '')
            {
            }
            column(CurrencyCode_SalesHeader; "Sales Header"."Currency Code")
            {
            }
            column(Description_PaymentTerms; PaymentTerms.Description)
            {
            }
            column(DSCR_PAYM; PaymentTerms.Description)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CompanyArr1_2_3_4_; CompanyArr[1] + CompanyArr[2] + CompanyArr[3] + CompanyArr[4])
                    {
                    }
                    column(CompanyArr5_6_7_8_; CompanyArr[5] + CompanyArr[6] + CompanyArr[7] + CompanyArr[8])
                    {
                    }
                    column(CompanyArr9_10_; CompanyArr[9] + CompanyArr[10])
                    {
                    }
                    column(CustAddr_1; CustAddr[1])
                    {
                    }
                    column(CustAddr_2; CustAddr[2])
                    {
                    }
                    column(CustAddr_3; CustAddr[3])
                    {
                    }
                    column(CustAddr_4; CustAddr[4])
                    {
                    }
                    column(CustAddr_5; CustAddr[5])
                    {
                    }
                    column(CustAddr_6; CustAddr[6])
                    {
                    }
                    column(CustAddr_7; CustAddr[7])
                    {
                    }
                    column(ShipToAddr_1; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddr_2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddr_3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddr_4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddr_5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddr_6; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddr_7; ShipToAddr[7])
                    {
                    }
                    column(CopyText_; ReportTitle)
                    {
                    }
                    column(Name_CompanyInfo; CompanyInfo.Name)
                    {
                    }
                    column(Picture_CompanyInfo; CompanyInfo.Picture)
                    {
                    }
                    column(EmptyStringCaption; EmptyStringCaptionLbl)
                    {
                    }
                    column(VATNoText_; UPPERCASE(VATNoText))
                    {
                    }
                    column(VATRegistrationNo_SalesHeader; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(BRNText_1; BRNText[1])
                    {
                    }
                    column(BRNText_2; BRNText[2])
                    {
                    }
                    column(SalesPersonText; UPPERCASE(SalesPersonText))
                    {
                    }
                    column(Name_SalesPurchPerson; SalesPurchPerson.Name)
                    {
                    }
                    column(No_SalesHeader; "Sales Header"."No.")
                    {
                    }
                    column(BillToCustomer_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(DocumentType_SalesHeader; "Sales Header"."Document Type")
                    {
                    }
                    column(DocumentDate_SalesHeader; "Sales Header"."Document Date")
                    {
                    }
                    column(CurCode; CurCode)
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Sales Header";
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
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"),
                                       "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                    }
                    dataitem(RoundLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(UnitofMeasure_SalesLine; "Sales Line"."Unit of Measure")
                        {
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."Amount Including VAT" - "Sales Line".Amount)
                        {
                        }
                        column(LineAmount_SalesLine; "Sales Line"."Line Amount")
                        {
                        }
                        column(No_SalesLine; "Sales Line"."No.")
                        {
                        }
                        column(Brand; "Sales Line"."Shortcut Dimension 2 Code") { }
                        column(Description_SalesLine; COPYSTR("Sales Line".Description, 1, 30))
                        {
                        }
                        column(Quantity_SalesLine; "Sales Line".Quantity)
                        {
                        }
                        column(LineDiscount_SalesLine; "Sales Line"."Line Discount %")
                        {
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                        }
                        column(InvDiscountAmount_SalesLine; "Sales Line"."Inv. Discount Amount")
                        {
                        }
                        column(LineNo_SalesLine; "Sales Line"."Line No.")
                        {
                        }
                        column(VATAmountLine_VATAmountText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                        }
                        column(UnitPrice_SalesLine; GUnitPrice)
                        {
                        }
                        column(InvDiscountAmount_SalesLine_; SalesLine."Inv. Discount Amount")
                        {
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(SalesLine_LineAmount_SalesLineInDiscountAmount; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount")
                        {
                        }
                        column(SalesLine_LineAmount_SalesLineInDiscountAmountVatAmt; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount" + VATAmount)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                        }
                        column(NNCTotalLCY; NNCTotalLCY)
                        {
                        }
                        column(NNCTotalExclVAT; NNCTotalExclVAT)
                        {
                        }
                        column(NNCVATAmt; NNCVATAmt)
                        {
                        }
                        column(NNCTotalInclVAT; NNCTotalInclVAT)
                        {
                        }
                        column(NNCPmtDiscOnVAT; NNCPmtDiscOnVAT)
                        {
                        }
                        column(NNCTotalInclVAT2; NNCTotalInclVAT2)
                        {
                        }
                        column(NNCVATAmt2; NNCVATAmt2)
                        {
                        }
                        column(NNCTotalExclVAT2; NNCTotalExclVAT2)
                        {
                        }
                        column(NNCSalesLineLineAmt; NNCSalesLineLineAmt)
                        {
                        }
                        column(NNCSalesLineInvDiscAmt; NNCSalesLineInvDiscAmt)
                        {
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin

                            IF Number = 1 THEN
                                SalesLine.FIND('-')
                            ELSE
                                SalesLine.NEXT;
                            "Sales Line" := SalesLine;

                            IF NOT "Sales Header"."Prices Including VAT" AND
                               (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                            THEN
                                SalesLine."Line Amount" := 0;

                            IF (SalesLine.Type = SalesLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Sales Line"."No." := '';


                            NNCSalesLineLineAmt += SalesLine."Line Amount";
                            NNCSalesLineInvDiscAmt += SalesLine."Inv. Discount Amount";

                            NNCTotalLCY := NNCSalesLineLineAmt - NNCSalesLineInvDiscAmt;

                            NNCTotalExclVAT := NNCTotalLCY;
                            NNCVATAmt := VATAmount;
                            NNCTotalInclVAT := NNCTotalLCY - NNCVATAmt;

                            NNCPmtDiscOnVAT := -VATDiscountAmount;

                            NNCTotalInclVAT2 := TotalAmountInclVAT;

                            NNCVATAmt2 := VATAmount;
                            NNCTotalExclVAT2 := VATBaseAmount;

                            // IT X.0
                            IF "Sales Line".Quantity <> 0 THEN
                                GUnitPrice := "Sales Line".Amount / "Sales Line".Quantity
                            ELSE
                                GUnitPrice := 0;
                        end;

                        trigger OnPostDataItem();
                        begin

                            SalesLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin

                            MoreLines := SalesLine.FIND('+');
                            WHILE MoreLines AND (SalesLine.Description = '') AND (SalesLine."Description 2" = '') AND
                                  (SalesLine."No." = '') AND (SalesLine.Quantity = 0) AND
                                  (SalesLine.Amount = 0)
                            DO
                                MoreLines := SalesLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SalesLine.SETRANGE("Line No.", 0, SalesLine."Line No.");
                            SETRANGE(Number, 1, SalesLine.COUNT);
                            CurrReport.CREATETOTALS(SalesLine."Line Amount", SalesLine."Inv. Discount Amount");
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

                            IF VATAmount = 0 THEN
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
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));

                        trigger OnPreDataItem();
                        begin

                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //EIS-UPGRADE BEGIN
                        CASE "Sales Header".Status OF
                            "Sales Header".Status::Open:
                                ReportTitle := 'Sales Order ' + CopyText;

                            "Sales Header".Status::Released:
                                ReportTitle := 'Order Confirmation' + CopyText;
                        END;


                        //EIS-UPGRADE END
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    SalesPost: Codeunit 80;
                begin

                    CLEAR(SalesLine);
                    CLEAR(SalesPost);
                    VATAmountLine.DELETEALL;
                    SalesLine.DELETEALL;
                    SalesPost.GetSalesLines("Sales Header", SalesLine, 0);
                    SalesLine.CalcVATAmountLines(0, "Sales Header", SalesLine, VATAmountLine);
                    SalesLine.UpdateVATOnLines(0, "Sales Header", SalesLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo := OutputNo + 1;
                    END;
                    CurrReport.PAGENO := 1;


                    NNCTotalLCY := 0;
                    NNCTotalExclVAT := 0;
                    NNCVATAmt := 0;
                    NNCTotalInclVAT := 0;
                    NNCPmtDiscOnVAT := 0;
                    NNCTotalInclVAT2 := 0;
                    NNCVATAmt2 := 0;
                    NNCTotalExclVAT2 := 0;
                    NNCSalesLineLineAmt := 0;
                    NNCSalesLineInvDiscAmt := 0;
                end;

                trigger OnPostDataItem();
                begin

                    IF NOT CurrReport.PREVIEW THEN
                        SalesCountPrinted.RUN("Sales Header");
                end;

                trigger OnPreDataItem();
                begin

                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 0
                end;
            }

            trigger OnAfterGetRecord();
            begin

                CLEAR(CurCode);
                CLEAR(BRNText);
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Salesperson Code" = '' THEN BEGIN
                    CLEAR(SalesPurchPerson);
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;

                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, COPYSTR("Currency Code", 1, 3));
                    TotalInclVATText := STRSUBSTNO(Text002, COPYSTR("Currency Code", 1, 3));
                    TotalExclVATText := STRSUBSTNO(Text006, COPYSTR("Currency Code", 1, 3));
                END;


                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");
                Formataddress.GetCustomer("Sales Header"."Bill-to Customer No.", BRNText[2], BRNText[1]);
                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE
                    PaymentTerms.GET("Payment Terms Code");

                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE
                    ShipmentMethod.GET("Shipment Method Code");

                FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, "Sales Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;

                IF NOT CurrReport.PREVIEW THEN BEGIN
                    IF ArchiveDocument THEN
                        ArchiveManagement.StoreSalesDocument("Sales Header", LogInteraction);

                    IF LogInteraction THEN BEGIN
                        CALCFIELDS("No. of Archived Versions");
                        IF "Bill-to Contact No." <> '' THEN
                            SegManagement.LogDocument(
                              3, "No.", "Doc. No. Occurrence",
                              "No. of Archived Versions", DATABASE::Contact, "Bill-to Contact No."
                              , "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                        ELSE
                            SegManagement.LogDocument(
                              3, "No.", "Doc. No. Occurrence",
                              "No. of Archived Versions", DATABASE::Customer, "Bill-to Customer No.",
                              "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                    END;
                END;

                IF "Currency Code" <> '' THEN
                    CurCode := COPYSTR("Currency Code", 1, 3)
                ELSE BEGIN
                    IF GLSetup.GET THEN
                        CurCode := GLSetup."LCY Code";
                END;

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
                    Caption = 'Options';
                    field(NoofCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                        ApplicationArea = all;
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                        ApplicationArea = all;
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        Caption = 'Archive Document';
                        Enabled = ArchiveDocument;
                        ApplicationArea = all;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Visible = false;
                        ApplicationArea = all;
                    }
                }
            }

        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            //OnOpenForm()
            ArchiveDocument := ArchiveManagement.SalesDocArchiveGranule;
            //LogInteraction := SegManagement.FindInteractTmplCode(3) <> '';


            //RequestOptionsForm.ArchiveDocument.ENABLED(ArchiveDocument);
            //RequestOptionsForm.LogInteraction.ENABLED(LogInteraction);
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        //Report - OnInitReport()
        GLSetup.GET;
        CompanyInfo.GET;
        SalesSetup.GET;

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
        VATAmountLine: Record 290 temporary;
        SalesLine: Record 37 temporary;
        RespCenter: Record 5714;
        Language: Record 8;
        SalesCountPrinted: Codeunit 313;
        FormatAddr: Codeunit 365;
        SegManagement: Codeunit 5051;
        ArchiveManagement: Codeunit 5063;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
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
        ShowShippingAddr: Boolean;
        i: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        Formataddress: Codeunit 50000;
        CompanyArr: array[10] of Text[95];
        BRNText: array[2] of Text[30];
        CurCode: Code[3];
        Customer: Record 18;

        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Order Confirmation %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        Text007: Label '"BRN: "';
        OrderNoCaptionLbl: Label 'ORDER NO';
        PageNoCaptionLbl: Label 'PAGE NO';
        ClientCodeCaptionLbl: Label 'CLIENT CODE';
        DateCaptionLbl: Label 'DATE';
        CurrencyCaptionLbl: Label 'CURRENCY';
        CustomerDetailsCaptionLbl: Label 'CUSTOMER DETAILS';
        ShipToAddressCaptionLbl: Label 'SHIP TO ADDRESS';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        UomCaptionLbl: Label 'UOM';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscCaptionLbl: Label 'Disc. %';
        VATCaptionLbl: Label 'VAT Amount';
        AmountCaptionLbl: Label 'Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        TakenByCaptionLbl: Label 'Taken By';
        CustomerReferenceCaptionLbl: Label 'Customer Reference';
        RemarksCaptionLbl: Label 'Remarks';
        EmptyStringCaptionLbl: Label ':';
        OutputNo: Integer;
        NoCaptionLbl: Label 'No.';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        InvDiscountAmountCaptionLbl: Label 'Inv. Discount Amount';
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
        NNCTotalLCY: Decimal;
        NNCTotalExclVAT: Decimal;
        NNCVATAmt: Decimal;
        NNCTotalInclVAT: Decimal;
        NNCPmtDiscOnVAT: Decimal;
        NNCTotalInclVAT2: Decimal;
        NNCVATAmt2: Decimal;
        NNCTotalExclVAT2: Decimal;
        NNCSalesLineLineAmt: Decimal;
        NNCSalesLineInvDiscAmt: Decimal;
        ReportTitle: Text[50];
        GUnitPrice: Decimal;
}

