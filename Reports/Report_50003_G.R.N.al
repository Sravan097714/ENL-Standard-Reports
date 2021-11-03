report 50003 "G.R.N"
{
    // version RCTS-1.0

    // AND ShowInternalInfo)
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\GRN.rdl';
    ApplicationArea = all;
    Caption = 'G.R.N';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            column(OrderTakenByCaption; OrderTakenByCaptionLbl)
            {
            }
            column(TermCaption; TermCaptionLbl)
            {
            }
            column(ShipmentTermsCaption; ShipmentTermsCaptionLbl)
            {
            }
            column(TransportMethodCaption; TransportMethodCaptionLbl)
            {
            }
            column(OrderNumberCaption; OrderNumberCaptionLbl)
            {
            }
            column(OrderDateCaption; OrderDateCaptionLbl)
            {
            }
            column(BUnitCaption; BUnitCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(CurrencyCaption; CurrencyCaptionLbl)
            {
            }
            column(DeliveryDateCaption; DeliveryDateCaptionLbl)
            {
            }
            column(SupplierNoCaption; SupplierNoCaptionLbl)
            {
            }
            column(SupplierCaption; SupplierCaptionLbl)
            {
            }
            column(ShipToCaption; ShipToCaptionLbl)
            {
            }
            column(DeliveryInstructionsCaption; DeliveryInstructionsCaptionLbl)
            {
            }
            column(AuthorizedByCaption; AuthorizedByCaptionLbl)
            {
            }
            column(PreparedByCaption; PreparedByCaptionLbl)
            {
            }
            column(SubTotalCaption; SubTotalCaptionLbl)
            {
            }
            column(VatCaption; VatCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(CodeCaption; CodeCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(UnitPriceCaption; UnitPriceCaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(PUCaption; PUCaptionLbl)
            {
            }
            column(AmountEcxlVatCaption; AmountEcxlVatCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(ReceivedByCaption; ReceivedByCaptionLbl)
            {
            }
            column(CHECKEDWITHFINALINVOICEBYCaption; CHECKEDWITHFINALINVOICEBYCaptionLbl)
            {
            }
            column(VATREGNOCaption; VATREGNOCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(PONOCaption; PONOCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(GRNNOCaption; GRNNOCaptionLbl)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(Name_CompanyInfo; CompanyInfo.Name)
                    {
                    }
                    column(IncludeCompanyTitle_CompanyInfo; CompanyInfo."Include Company Title")
                    {
                    }
                    column(CompanyArr1_2_3_4_; CompanyArr[1] + CompanyArr[2] + CompanyArr[3] + CompanyArr[4])
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
                    column(CompanyArr5_6_7_8_; CompanyArr[5] + CompanyArr[6] + CompanyArr[7] + CompanyArr[8])
                    {
                    }
                    column(CompanyArr9_10_; CompanyArr[9] + CompanyArr[10])
                    {
                    }
                    column(Comp_Picture; CompanyInfo.Picture)
                    {

                    }
                    column(Title_2; Title[2])
                    {
                    }
                    column(Title_1; Title[1])
                    {
                    }
                    column(ShortcutDimension1Code_PurchRcptHdr; "Purch. Rcpt. Header"."Shortcut Dimension 1 Code")
                    {
                    }
                    column(USERID; USERID)
                    {
                    }
                    column(ShipmentMethodCode_PurchRcptHdr; "Purch. Rcpt. Header"."Shipment Method Code")
                    {
                    }
                    column(No_PurchHdr; "Purch. Rcpt. Header"."No.")
                    {
                    }
                    column(OrderDate_PurchRcptHdr; "Purch. Rcpt. Header"."Order Date")
                    {
                    }
                    column(CurrReport_PAGENO; CurrReport.PAGENO)
                    {
                    }
                    column(ExpectedReceiptDate_PurchRcptHdr; "Purch. Rcpt. Header"."Expected Receipt Date")
                    {
                    }
                    column(BuyfromVendorNo_PurchRcptHdr; "Purch. Rcpt. Header"."Buy-from Vendor No.")
                    {
                    }
                    column(VATRegistrationNo_PurchRcptHeader; "Purch. Rcpt. Header"."VAT Registration No.")
                    {
                    }
                    column(PostingDate_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Date")
                    {
                    }
                    column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
                    {
                    }
                    column(BRNText_1; BRNtext[1])
                    {
                    }
                    column(BRNText_2; BRNtext[2])
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
                    column(OutPutNo; OutPutNo)
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Purch. Rcpt. Header";
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
                    dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                        {
                        }
                        column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                        {
                        }
                        column(LocationCode_PurchRcptLine; "Purch. Rcpt. Line"."Location Code")
                        {
                        }
                        column(UnitofMeasure_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure")
                        {
                        }
                        column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                        {
                        }
                        column(LineNo_PurchRcptLine; "Purch. Rcpt. Line"."Line No.")
                        {
                        }
                        column(Type_PurchRcptLine; "Purch. Rcpt. Line".Type)
                        {
                        }
                        column(PrintLine; PrintLine)
                        {
                        }
                        dataitem("Item Ledger Entry"; "Item Ledger Entry")
                        {
                            DataItemLinkReference = "Purch. Rcpt. Line";
                            DataItemLink = "Item No." = FIELD("No."), "Document No." = FIELD("Document No.");
                            //DataItemTableView = SORTING ("Serial No.") ORDER(Ascending);
                            column(ILE_ItemNo; "Item Ledger Entry"."Lot No.")
                            {

                            }
                            column(ILE_Qty; "Item Ledger Entry".Quantity)
                            {

                            }
                        }


                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            dataitem(Total; Integer)
                            {
                                DataItemTableView = SORTING(Number)
                                                    WHERE(Number = CONST(1));

                                trigger OnPreDataItem();
                                begin
                                    //Total - OnPreDataItem()
                                    IF "Purch. Rcpt. Header"."Buy-from Vendor No." = "Purch. Rcpt. Header"."Pay-to Vendor No." THEN
                                        CurrReport.BREAK;
                                end;
                            }

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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Purch. Rcpt. Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            //Purch. Rcpt. Line - OnAfterGetRecord()
                            IF (NOT ShowCorrectionLines) AND Correction THEN
                                CurrReport.SKIP;
                            /*
                            PostedDocDim2.SETRANGE("Table ID",DATABASE::"Purch. Rcpt. Line");
                            PostedDocDim2.SETRANGE("Document No.","Purch. Rcpt. Line"."Document No.");
                            PostedDocDim2.SETRANGE("Line No.","Purch. Rcpt. Line"."Line No.");
                            */
                            DimSetEntry2.SETRANGE("Dimension Set ID", "Purch. Rcpt. Line"."Dimension Set ID");
                            PrintLine := (Type = Type::Item) OR (Type = Type::"Fixed Asset") OR (Type = Type::"G/L Account");

                        end;

                        trigger OnPreDataItem();
                        begin
                            //Purch. Rcpt. Line - OnPreDataItem()
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            PrintLine := FALSE;
                        end;
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    //CopyLoop - OnAfterGetRecord()
                    IF Number > 1 THEN BEGIN
                        Title[2] := Text001;
                        OutPutNo := OutPutNo + 1;
                    END;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin
                    //CopyLoop - OnPostDataItem()
                    IF NOT CurrReport.PREVIEW THEN
                        RcptCountPrinted.RUN("Purch. Rcpt. Header");
                end;

                trigger OnPreDataItem();
                begin
                    //CopyLoop - OnPreDataItem()
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutPutNo := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Purch. Rcpt. Header - OnAfterGetRecord()
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                CLEAR(BRNtext);

                //CompanyInfo.GET;

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE BEGIN
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                END;
                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");
                IF "Purchaser Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    PurchaserText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Purchaser Code");
                    PurchaserText := Text000
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                FormatAddr.PurchRcptShipTo(ShipToAddr, "Purch. Rcpt. Header");
                FormatAddr.PurchRcptBuyFrom(ShipToAddr, "Purch. Rcpt. Header");
                FormatAddr.PurchRcptPayTo(VendAddr, "Purch. Rcpt. Header");
                Formataddress.GetVendor("Purch. Rcpt. Header"."Buy-from Vendor No.", BRNtext[2], BRNtext[1]);
                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN
                        SegManagement.LogDocument(
                          15, "No.", 0, 0, DATABASE::Vendor, "Buy-from Vendor No.", "Purchaser Code", '', "Posting Description", '');
                ;
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
                    field(ShowCorrectionLines; ShowCorrectionLines)
                    {
                        Caption = 'Show Correction Lines';
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
            //LogInteraction := SegManagement.FindInteractTmplCode(15) <> '';
            //RequestOptionsForm.LogInteraction.ENABLED(LogInteraction);
        end;
    }

    labels
    {
    }

    trigger OnPreReport();
    var
        Country: Record 9;
    begin
        //Report - OnPreReport()
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        Formataddress.Companys(CompanyArr, CompanyInfo);

        Title[1] := Text007;
        IF CompanyInfo."Country/Region Code" <> '' THEN BEGIN
            IF Country.GET(CompanyInfo."Country/Region Code") THEN
                CompanyCountry := Country.Name
            ELSE
                CompanyCountry := '';
        END ELSE
            CompanyCountry := '';
    end;

    var
        Text000: Label 'Purchaser';
        Text001: Label 'COPY';
        Text002: Label 'Purchase - Receipt %1';
        Text003: Label 'Page %1';
        Text007: Label 'GOODS RECEIVED NOTE';
        Text008: Label 'BRN: ';
        CompanyInfo: Record 79;
        SalesPurchPerson: Record 13;
        Language: Record 8;
        RespCenter: Record 5714;
        RcptCountPrinted: Codeunit 318;
        SegManagement: Codeunit SegManagement;
        VendAddr: array[8] of Text[50];
        CompanyCountry: Text[100];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        ReferenceText: Text[30];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        FormatAddr: Codeunit 365;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        ShowCorrectionLines: Boolean;
        Formataddress: Codeunit "Format Addresses";
        CompanyArr: array[10] of Text[95];
        Title: array[3] of Text[30];
        Supplier: Record 23;
        BRNtext: array[2] of Text[30];
        BUnitCaptionLbl: Label 'B/UNIT :';
        OrderTakenByCaptionLbl: Label 'ORDER TAKEN  BY :';
        TermCaptionLbl: Label 'TERM :';
        ShipmentTermsCaptionLbl: Label 'SHIPMENT TERMS :';
        TransportMethodCaptionLbl: Label 'TRANSPORT METHOD :';
        OrderNumberCaptionLbl: Label 'ORDER NUMBER :';
        OrderDateCaptionLbl: Label 'ORDER DATE       ';
        PageCaptionLbl: Label 'PAGE NO             ';
        CurrencyCaptionLbl: Label 'CURRENCY           ';
        DeliveryDateCaptionLbl: Label 'DELIVERY DATE   ';
        SupplierNoCaptionLbl: Label ' SUPPLIER NO      ';
        SupplierCaptionLbl: Label 'SUPPLIER DETAILS';
        ShipToCaptionLbl: Label 'SHIP TO';
        DeliveryInstructionsCaptionLbl: Label 'DELIVERY INSTRUCTIONS';
        AuthorizedByCaptionLbl: Label 'Authorised By:';
        PreparedByCaptionLbl: Label 'Prepared By:';
        SubTotalCaptionLbl: Label 'SUB TOTAL';
        VatCaptionLbl: Label 'VAT (%)';
        TotalCaptionLbl: Label 'TOTAL';
        CodeCaptionLbl: Label 'CODE';
        DescriptionCaptionLbl: Label 'DESCRIPTION';
        QtyCaptionLbl: Label 'QUANTITY';
        UnitPriceCaptionLbl: Label 'UNIT PRICE';
        UOMCaptionLbl: Label 'UOM';
        PUCaptionLbl: Label 'PU UM';
        AmountEcxlVatCaptionLbl: Label 'AMOUNT EXCL VAT';
        EmptyStringCaptionLbl: Label ':';
        ReceivedByCaptionLbl: Label 'RECEIVED BY                                   :';
        CHECKEDWITHFINALINVOICEBYCaptionLbl: Label 'CHECKED WITH FINAL INVOICE BY :';
        VATREGNOCaptionLbl: Label 'VAT REG NO :';
        DateCaptionLbl: Label 'DATE';
        PONOCaptionLbl: Label 'PO NO';
        GRNNOCaptionLbl: Label 'GRN NO';
        OutPutNo: Integer;
        LocationCaptionLbl: Label 'LOCATION';
        PrintLine: Boolean;
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
}

