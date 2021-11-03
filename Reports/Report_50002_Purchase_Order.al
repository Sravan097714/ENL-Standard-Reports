report 50002 "Purchase Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\PurchaseOrderBackup3.rdl';
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Purchase Order';
    PreviewMode = PrintLayout;
    ApplicationArea = all;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            column(Name_CompanyInfo; CompanyInfo.Name)
            {
            }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
            {
            }
            column(IncludeCompanyTitle_CompanyInfo; CompanyInfo."Include Company Title")
            {
            }
            column(CompanyArr1_2_3_4_; CompanyArr[1] + CompanyArr[2] + CompanyArr[3] + CompanyArr[4])
            {
            }
            column(CompanyArr5_6_7_8_; CompanyArr[5] + CompanyArr[6] + CompanyArr[7] + CompanyArr[8])
            {
            }
            column(CompanyArr9_10_; CompanyArr[9] + CompanyArr[10])
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
            column(CompanyArr9; CompanyArr[9])
            {
            }
            column(CompanyArr10; CompanyArr[10])
            {
            }
            column(POType; '') { }
            column(PO_Instruction; CompanyInfo."PO Instruction")
            {
            }
            column(PrintInstruction; PrintInstruction)
            {
            }
            column(DocFooter; Companyinfo."Document Footer") { }
            column(Title_2; Title[2])
            {
            }
            column(Title_1; Title[1])
            {
            }
            column(NetPrice1_; NetPrice[1])
            {
            }
            column(NetPrice2_; NetPrice[2])
            {
            }
            column(NetPrice3_; NetPrice[3])
            {
            }
            column(ShortcutDimension1Code_PurchHdr; "Purchase Header"."Shortcut Dimension 1 Code")
            {
            }
            column(USERID; '')
            {
            }
            column(PaymentTerms_Description; PaymentTerms.Description)
            {
                IncludeCaption = true;
            }
            column(ShipmentMethodCode_PurchHdr; "Purchase Header"."Shipment Method Code")
            {
            }
            column(TransportMethodCode_PurchHdr; '')
            {
            }
            column(No_PurchHdr; "Purchase Header"."No.")
            {
            }
            column(DocumentType_PurchHdr; "Purchase Header"."Document Type")
            {
            }
            column(OrderDate_PurchHdr; "Purchase Header"."Order Date")
            {
            }
            column(CurrCode; CurrCode)
            {
            }
            column(ExpectedReceiptDate_PurchHdr; "Purchase Header"."Expected Receipt Date")
            {
            }
            column(Contact; "Purchase Header"."Buy-from Contact")
            {

            }
            column(BuyfromVendorNo_PurchHdr; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(CurrencyCode_PurchaseHeader; "Purchase Header"."Currency Code")
            {
            }
            column(BuyFromAddr_1; BuyFromAddr[1])
            {
            }
            column(BuyFromAddr_2; BuyFromAddr[2])
            {
            }
            column(BuyFromAddr_3; BuyFromAddr[3])
            {
            }
            column(BuyFromAddr_4; BuyFromAddr[4])
            {
            }
            column(BuyFromAddr_5; BuyFromAddr[5])
            {
            }
            column(BuyFromAddr_6; BuyFromAddr[6])
            {
            }
            column(BuyFromAddr_7; BuyFromAddr[7])
            {
            }
            column(DeliveryInst_PurchHdr; '')
            {
            }
            column(BRNText_1; BRNText[1])
            {
            }
            column(BRNText_2; BRNText[2])
            {
            }
            column(BUnitCaption; BUnitCaptionLbl)
            {
            }
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
            column(POPreparedBy; "Purchase Header"."Prepared By")
            {
            }
            column(ApprovedBy; ApprovedBy)
            {
            }
            column(Created_By; CreatedBy)
            {
            }
            column(Approved_By; Approved)
            {
            }
            column(OrdertakenBy; OrdertakenBy)
            { }



            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(CurrReport_PAGENO; CurrReport.PAGENO)
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Purchase Header";
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
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"),
                                       "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem();
                        begin

                            CurrReport.BREAK;
                        end;
                    }

                    dataitem(RoundLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(PurchLine_AmountIncludingVAT_PurchLine_AmountAmtExlVAT_; PurchLine."Amount Including VAT")
                        {
                        }
                        column(AmtExlVAT; AmtExlVAT)
                        {
                        }
                        column(PurchLine_AmountIncludingVAT_PurchLine_Amount_; "Purchase Line"."Amount Including VAT" - "Purchase Line".Amount)
                        {
                        }
                        column(VATAmountLine_VAT; VATAmountLine."VAT %")
                        {
                        }
                        column(No_PurchLne; '')
                        {
                        }
                        column(Description_PurchLne; "Purchase Line".Description)
                        {
                        }
                        column(Quantity_PurchLne; "Purchase Line".Quantity)
                        {
                        }
                        column(DirectUnitCost_PurchLne; "Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }
                        column(UnitofMeasureCode_PurchLne; "Purchase Line"."Unit of Measure Code")
                        {
                        }
                        column(Amount_PurchLne; "Purchase Line"."Amount Including VAT" - "Purchase Line".Amount)
                        {
                        }
                        column(AmountIncVat; "Purchase Line"."Amount Including VAT")
                        {
                        }
                        column(UOM; UOM)
                        {
                        }
                        column(DirectUnitCost_PurchaseLineQuantity_; "Purchase Line"."Direct Unit Cost" * "Purchase Line".Quantity)
                        {
                        }
                        column(LineNo_PurchLne; "Purchase Line"."Line No.")
                        {
                        }
                        column(SupplierItemNo; "Purchase Line"."No.")
                        {

                        }
                        dataitem("Purch. Comment Line"; "Purch. Comment Line")
                        {
                            DataItemLinkReference = "Purchase Line";
                            DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST(ORDER));
                            DataItemLink = "No." = FIELD("Document No."), "Document Line No." = FIELD("Line No.");
                            column(PurchComment; "Purch. Comment Line".Comment)
                            {
                            }
                            column(Document_Type; "Document Type") { }
                            column(No_; "No.") { }
                            column(Document_Line_No_; "Document Line No.") { }
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin

                            //CLEAR(AmtExlVAT);
                            CLEAR(UOM);
                            IF Number = 1 THEN
                                PurchLine.FIND('-')
                            ELSE
                                PurchLine.NEXT;
                            "Purchase Line" := PurchLine;

                            IF NOT "Purchase Header"."Prices Including VAT" AND
                               (PurchLine."VAT Calculation Type" = PurchLine."VAT Calculation Type"::"Full VAT")
                            THEN
                                PurchLine."Line Amount" := 0;

                            IF (PurchLine.Type = PurchLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Purchase Line"."No." := '';

                            AmtExlVAT += PurchLine."Direct Unit Cost" * PurchLine.Quantity;

                            IF Item.GET("Purchase Line"."No.") THEN
                                UOM := Item."Purch. Unit of Measure";
                        end;

                        trigger OnPostDataItem();
                        begin
                            //RoundLoop - OnPostDataItem()
                            PurchLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin

                            MoreLines := PurchLine.FIND('+');
                            WHILE MoreLines AND (PurchLine.Description = '') AND (PurchLine."Description 2" = '') AND
                                  (PurchLine."No." = '') AND (PurchLine.Quantity = 0) AND
                                  (PurchLine.Amount = 0) DO
                                MoreLines := PurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            PurchLine.SETRANGE("Line No.", 0, PurchLine."Line No.");
                            SETRANGE(Number, 1, PurchLine.COUNT);
                            CurrReport.CREATETOTALS(PurchLine."Line Amount", PurchLine."Inv. Discount Amount", AmtExlVAT,
                            PurchLine.Amount, PurchLine."Amount Including VAT");
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);

                        trigger OnAfterGetRecord();
                        begin
                            //VATCounter - OnAfterGetRecord()
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            //VATCounter - OnPreDataItem()
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
                            //Total2 - OnPreDataItem()
                            IF "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total3; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));

                        trigger OnPreDataItem();
                        begin
                            //Total3 - OnPreDataItem()
                            IF ("Purchase Header"."Sell-to Customer No." = '') AND (ShipToAddr[1] = '') THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin

                    CLEAR(PurchLine);
                    CLEAR(PurchPost);
                    PurchLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header", PurchLine, 0);
                    PurchLine.CalcVATAmountLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    PurchLine.UpdateVATOnLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;


                    IF Number > 1 THEN BEGIN
                        Title[2] := Text003;
                        OutputNo := OutputNo + 1;
                    END;

                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin

                    IF NOT CurrReport.PREVIEW THEN
                        PurchCountPrinted.RUN("Purchase Header");
                end;

                trigger OnPreDataItem();
                begin

                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 0;
                end;
            }

            trigger OnAfterGetRecord();

            begin


                // IF "Purchase Header"."Print PO Instruction" THEN
                //     PrintInstruction := CompanyInfo."PO Instruction";

                // User.RESET;
                // User.SETRANGE(User."User Name", "Purchase Header"."PO Prepared By");
                // IF User.FINDLAST THEN BEGIN
                //     OrdertakenBy := User."Full Name";

                // END;
                // User.RESET;
                // User.SETRANGE(User."User Name", "Purchase Header"."Created By");
                // IF User.FINDLAST THEN BEGIN
                //     CreatedBy := User."Full Name";

                // END;
                // User.RESET;
                // User.SETRANGE(User."User Name", "Purchase Header"."Approved By");
                // IF User.FINDLAST THEN BEGIN
                //     Approved := User."Full Name";
                // END;
                /*
                                IF "Purchase Header"."No. Printed" > 0 THEN BEGIN
                                    IF EISLibrary.UserAccessValidation(USERID, 21) = FALSE THEN
                                        ERROR(Text008);
                                END;
                */
                CLEAR(BRNText);

                CLEAR(CurrCode);
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                IF "No. Printed" > 0 THEN
                    Title[2] := 'COPY'
                ELSE
                    Title[2] := '';

                IF Supplier.GET("Purchase Header"."Ship-to Code") THEN;

                // User.RESET;
                // User.SETRANGE(User."User Name", "Purchase Header"."Prepared By");
                // IF User.FINDLAST THEN
                //     POPreparedBy := User."Full Name";
                //RCTS1.0 Start 25/06/18
                //  CLEAR(POPreparedBy);
                //  CLEAR(ApprovedBy);

                //CompanySecPermission.GET;
                // IF CompanySecPermission."PO Approval Activated" THEN BEGIN
                /* ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE(ApprovalEntries."Document No.", "No.");
                ApprovalEntries.SETRANGE(ApprovalEntries."Document Type", "Document Type");
                ApprovalEntries.SETRANGE(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                ApprovalEntries.SETRANGE(ApprovalEntries."Sequence No.", 2);
                IF ApprovalEntries.FINDLAST THEN BEGIN
                    ActiveSession.RESET;
                    ActiveSession.SETRANGE(ActiveSession."User ID", ApprovalEntries."Approver ID");
                    IF ActiveSession.FINDFIRST THEN BEGIN
                        User.RESET;
                        IF User.GET(ActiveSession."User SID") THEN
                            ApprovedBy := User."Full Name";
                    END;
                END; */
                //END ELSE

                //  ApprovedBy := "Purchase Header"."Approved By";



                /*
                 END ELSE BEGIN
                   ApprovedBy:=TextDot;
                   POPreparedBy:=TextDot;
               END;
               //RCTS1.0 End 25/06/18
               */

                //RCTS1.0 Start 25/06/18

                //CLEAR(POPreparedBy);
                CLEAR(ApprovedBy);
                //CompanySecPermission.GET;
                //IF CompanySecPermission."PO Approval Activated" THEN BEGIN
                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE(ApprovalEntries."Document No.", "No.");
                ApprovalEntries.SETRANGE(ApprovalEntries."Document Type", "Document Type");
                ApprovalEntries.SETRANGE(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                //ApprovalEntries.SETRANGE(ApprovalEntries."Sequence No.", 2);
                IF ApprovalEntries.FINDLAST THEN BEGIN

                    ActiveSession.RESET;
                    ActiveSession.SETRANGE(ActiveSession."User ID", ApprovalEntries."Approver ID");
                    IF ActiveSession.FINDFIRST THEN BEGIN
                        User.RESET;
                        IF User.GET(ActiveSession."User SID") THEN
                            ApprovedBy := User."Full Name";
                    END;

                    User3.RESET;
                    User3.SETRANGE(User3."User Name", ApprovalEntries."Approver ID");
                    IF User3.FINDLAST THEN BEGIN
                        ApprovedBy := User3."Full Name";
                    END;
                END;

                //ELSE
                // ApprovedBy := TextDot;


                //END ELSE BEGIN
                //ApprovedBy:=TextDot;
                //POPreparedBy:=TextDot;
                //END;

                //RCTS1.0 End 25/06/18 
                IF "Currency Code" = '' THEN BEGIN
                    IF GLSetup.GET THEN
                        CurrCode := GLSetup."LCY Code";
                END ELSE
                    CurrCode := COPYSTR("Currency Code", 1, 3);


                FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, "Purchase Header");
                /*
                BuyFromAddr[1] := "Purchase Header"."Buy-from Vendor Name";
                BuyFromAddr[2] := "Buy-from Vendor Name 2";
                BuyFromAddr[3] := "Buy-from Contact";
                BuyFromAddr[4] := "Buy-from Address";
                BuyFromAddr[5] := "Buy-from Address 2";                
                BuyFromAddr[6] := "Buy-from City";
                BuyFromAddr[7] := "Buy-from Post Code";
                BuyFromAddr[8] := "Buy-from County";
                */
                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE
                    PaymentTerms.GET("Payment Terms Code");

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                FormatAddr.PurchHeaderShipTo(ShipToAddr, "Purchase Header");
                ShipToAddr[1] := copystr(CompanyInfo.Name, 1, 90);
                ShipToAddr[2] := CompanyInfo.Address + CompanyInfo."Address 2";
                ShipToAddr[3] := CompanyInfo.City;
                if Country.Get(CompanyInfo."Country/Region Code") then
                    ShipToAddr[4] := Country.Name;
                Formataddress.GetVendor("Purchase Header"."Buy-from Vendor No.", BRNText[2], BRNText[1]);

                //EIS-ZS-001 BEGIN
                CLEAR(NetPrice);
                CLEAR(AmtInvoiced);
                CLEAR(VATStatus);

                PurchLineGRec.RESET;
                PurchLineGRec.SETRANGE(PurchLineGRec."Document Type", "Purchase Header"."Document Type");
                PurchLineGRec.SETRANGE(PurchLineGRec."Document No.", "Purchase Header"."No.");
                IF PurchLineGRec.FINDFIRST THEN BEGIN
                    REPEAT
                        IF (PurchLineGRec."No." <> '') AND (PurchLineGRec.Quantity <> 0) THEN BEGIN
                            IF VATPostingSetup.GET(PurchLineGRec."VAT Bus. Posting Group", PurchLineGRec."VAT Prod. Posting Group") THEN BEGIN
                                VATStatus := COPYSTR(VATPostingSetup."VAT Identifier", 1, 1);
                                CASE VATStatus OF
                                    'Z':
                                        BEGIN
                                            NetPrice[1] += PurchLineGRec."Line Amount";

                                        END;

                                    'T':
                                        BEGIN
                                            NetPrice[3] += PurchLineGRec."Line Amount";

                                        END;

                                    'E':
                                        BEGIN
                                            NetPrice[2] += PurchLineGRec."Line Amount";

                                        END;
                                END;
                            END;
                        END;
                    UNTIL PurchLineGRec.NEXT = 0;
                END;

                //EIS-ZS-001 END





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
                        Visible = false;
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        Caption = 'Archive Document';
                        Visible = false;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
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
        //Report - OnInitReport()
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
        Formataddress.CompanyRCTS(CompanyArr, CompanyInfo);

        Title[1] := Text007;
    end;

    var
        Text000: Label 'Purchaser';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Order %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        Text007: Label 'PURCHASE ORDER';
        Text008: Label 'You do not have permission to reprint this document.';
        GLSetup: Record 98;
        CompanyInfo: Record 79;
        ShipmentMethod: Record 10;
        PaymentTerms: Record 3;
        SalesPurchPerson: Record 13;
        VATAmountLine: Record 290 temporary;
        PurchLine: Record 39 temporary;
        RespCenter: Record 5714;
        Language: Record 8;
        PurchCountPrinted: Codeunit 317;
        FormatAddr: Codeunit 365;
        Country: Record "Country/Region";
        PurchPost: Codeunit 90;
        ArchiveManagement: Codeunit 5063;
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[90];
        CompanyAddr: array[8] of Text[90];
        BuyFromAddr: array[8] of Text[90];
        PurchaserText: Text[30];
        VATNoText: Text[30];
        ReferenceText: Text[30];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
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
        Supplier: Record 23;
        Formataddress: Codeunit "Format Addresses";
        CompanyArr: array[10] of Text[95];
        Title: array[3] of Text[30];
        Item: Record 27;
        AmtExlVAT: Decimal;
        TransMethod: array[6] of Text[1];
        UOM: Code[10];
        CurrCode: Code[3];
        EISLibrary: Codeunit 50000;
        BRNText: array[2] of Text[30];
        BUnitCaptionLbl: Label 'B/UNIT';
        OrderTakenByCaptionLbl: Label 'ORDER TAKEN  BY';
        TermCaptionLbl: Label 'TERM';
        ShipmentTermsCaptionLbl: Label 'SHIPMENT TERMS';
        TransportMethodCaptionLbl: Label 'TRANSPORT METHOD ';
        OrderNumberCaptionLbl: Label 'ORDER NUMBER';
        OrderDateCaptionLbl: Label 'ORDER DATE';
        PageCaptionLbl: Label 'PAGE                     ';
        CurrencyCaptionLbl: Label 'CURRENCY           ';
        DeliveryDateCaptionLbl: Label 'DELIVERY DATE   ';
        SupplierNoCaptionLbl: Label 'SUPPLIER NO      ';
        SupplierCaptionLbl: Label 'SUPPLIER';
        ShipToCaptionLbl: Label 'SHIP TO';
        DeliveryInstructionsCaptionLbl: Label 'DELIVERY INSTRUCTIONS';
        AuthorizedByCaptionLbl: Label 'Authorised By:';
        PreparedByCaptionLbl: Label 'Prepared By:';
        SubTotalCaptionLbl: Label 'SUB TOTAL';
        VatCaptionLbl: Label 'VAT (%)';
        TotalCaptionLbl: Label 'TOTAL';
        CodeCaptionLbl: Label 'CODE';
        DescriptionCaptionLbl: Label 'DESCRIPTION';
        QtyCaptionLbl: Label 'QTY ORDERED';
        UnitPriceCaptionLbl: Label 'UNIT PRICE';
        UOMCaptionLbl: Label 'UOM';
        PUCaptionLbl: Label 'PU UM';
        AmountEcxlVatCaptionLbl: Label 'AMOUNT EXCL VAT';
        EmptyStringCaptionLbl: Label ':';
        OutputNo: Integer;
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
        NetPrice: array[4] of Decimal;
        PurchLineGRec: Record 39;
        VATStatus: Text[1];
        VATPostingSetup: Record 325;
        AmtInvoiced: array[4] of Decimal;
        ApprovedBy: Text[100];
        ApprovalEntries: Record 454;
        POPreparedBy: Text[100];
        TextDot: Label '..............................................................';

        ActiveSession: Record 2000000110;
        User: Record 2000000120;
        User3: Record 2000000120;
        OrdertakenBy: Text;
        PrintInstruction: Text[250];
        CreatedBy: Text;
        Approved: Text;

}

