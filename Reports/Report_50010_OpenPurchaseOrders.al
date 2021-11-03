report 50010 "Open Purchase Orders"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\OpenPurchaseOrders.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER('Order' | 'Invoice'));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Shortcut Dimension 1 Code", "No. Series";
            column(UPPERCASE_COMPANYNAME_; UPPERCASE(COMPANYNAME))
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }
            column(Purchase_Header__GETFILTERS; "Purchase Header".GETFILTERS)
            {
            }
            column(Purchase_Header_HASFILTER; "Purchase Header".HASFILTER)
            {
            }
            column(Purchase_Header__Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
            {
            }
            column(NoSerie_Description; NoSerie.Description)
            {
            }
            column(QtyR; QtyR)
            {
                DecimalPlaces = 0 : 5;
            }
            column(Amt1; Amt1)
            {
            }
            column(Qty; Qty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(NoSerie_Description_Control1000000028; NoSerie.Description)
            {
            }
            column(Purchase_Header__Shortcut_Dimension_1_Code__Control1000000034; "Shortcut Dimension 1 Code")
            {
            }
            column(Amt1_Control1000000037; Amt1)
            {
            }
            column(QtyR_Control1000000038; QtyR)
            {
                DecimalPlaces = 0 : 5;
            }
            column(Qty_Control1000000033; Qty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(Amt1_Control1000000041; Amt1)
            {
            }
            column(Qty_Control1000000042; Qty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(QtyR_Control1000000043; QtyR)
            {
                DecimalPlaces = 0 : 5;
            }
            column(OPEN_PURCHASE_ORDERCaption; OPEN_PURCHASE_ORDERCaptionLbl)
            {
            }
            column(Rep_50172Caption; Rep_50172CaptionLbl)
            {
            }
            column(Control1000000005Caption; Control1000000005CaptionLbl)
            {
            }
            column(Filtered_By_Caption; Filtered_By_CaptionLbl)
            {
            }
            column(Quantity_OpenCaption; Quantity_OpenCaptionLbl)
            {
            }
            column(Quantity_OrderedCaption; Quantity_OrderedCaptionLbl)
            {
            }
            column(Order_DateCaption; Order_DateCaptionLbl)
            {
            }
            column(Supplier_No____NameCaption; Supplier_No____NameCaptionLbl)
            {
            }
            column(Order_No_Caption; Order_No_CaptionLbl)
            {
            }
            column(Item_No____DescriptionCaption; Item_No____DescriptionCaptionLbl)
            {
            }
            column(Amount_OpenCaption; Amount_OpenCaptionLbl)
            {
            }
            column(CurCodeCaption; CurCodeCaptionLbl)
            {
            }
            column(Purchase_Header__Shortcut_Dimension_1_Code_Caption; FIELDCAPTION("Shortcut Dimension 1 Code"))
            {
            }
            column(No__SeriesCaption; No__SeriesCaptionLbl)
            {
            }
            column(Total_by_No__SeriesCaption; Total_by_No__SeriesCaptionLbl)
            {
            }
            column(Total_by_DepartmentCaption; Total_by_DepartmentCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(Purchase_Header_Document_Type; "Document Type")
            {
            }
            column(Purchase_Header_No_; "No.")
            {
            }
            column(Purchase_Header_No__Series; "No. Series")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                PrintOnlyIfDetail = false;
                column(No__________Description; "No." + '  ' + Description)
                {
                }
                column(Purchase_Line__Document_No__; "Document No.")
                {
                }
                column(Purchase_Line__Order_Date_; "Order Date")
                {
                }
                column(Purchase_Line_Quantity; Quantity)
                {
                }
                column(Purchase_Line__Qty__to_Receive_; "Qty. to Receive")
                {
                }
                column(CurCode; CurCode)
                {
                }
                column(Vendor__No___________Vendor_Name; Vendor."No." + '  ' + Vendor.Name)
                {
                }
                column(Amt; Amt)
                {
                }
                column(Purchase_Line_Document_Type; "Document Type")
                {
                }
                column(Purchase_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF "Purchase Line"."Quantity Received" = "Purchase Line".Quantity THEN
                        CurrReport.SKIP;

                    IF Item.GET("Purchase Line"."No.") THEN;
                    IF Vendor.GET("Purchase Line"."Buy-from Vendor No.") THEN;

                    CLEAR(Amt);
                    CLEAR(CurCode);

                    Amt := "Purchase Line"."Unit Cost" * "Purchase Line"."Qty. to Receive";
                    Amt1 += Amt;

                    Qty += Quantity;
                    QtyR += "Purchase Line"."Qty. to Receive";


                    IF "Purchase Line"."Currency Code" <> '' THEN
                        CurCode := COPYSTR("Currency Code", 1, 3)
                    ELSE
                        CurCode := 'MUR';

                    //Purchase Header, GroupHeader (6) - OnPreSection()
                    IF NoSerie.GET("Purchase Header"."No. Series") THEN;
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CREATETOTALS(Quantity, "Qty. to Receive", Amt);
                end;
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("No. Series");
                CurrReport.CREATETOTALS(Qty, QtyR, Amt1);
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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Item: Record 27;
        Vendor: Record 23;
        Amt: Decimal;
        CurCode: Code[10];
        Qty: Decimal;
        Amt1: Decimal;
        QtyR: Decimal;
        Totqty: Decimal;
        NoSerie: Record 308;
        OPEN_PURCHASE_ORDERCaptionLbl: Label 'OPEN PURCHASE ORDER';
        Rep_50172CaptionLbl: Label 'Rep-50172';
        Control1000000005CaptionLbl: Label 'Label1000000005';
        Filtered_By_CaptionLbl: Label 'Filtered By:';
        Quantity_OpenCaptionLbl: Label 'Quantity Open';
        Quantity_OrderedCaptionLbl: Label 'Quantity Ordered';
        Order_DateCaptionLbl: Label 'Order Date';
        Supplier_No____NameCaptionLbl: Label 'Supplier No. / Name';
        Order_No_CaptionLbl: Label 'Order No.';
        Item_No____DescriptionCaptionLbl: Label 'Item No. / Description';
        Amount_OpenCaptionLbl: Label 'Amount Open';
        CurCodeCaptionLbl: Label 'CurCode';
        No__SeriesCaptionLbl: Label 'No. Series';
        Total_by_No__SeriesCaptionLbl: Label 'Total by No. Series';
        Total_by_DepartmentCaptionLbl: Label 'Total by Department';
        EmptyStringCaptionLbl: Label '--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
        TOTALCaptionLbl: Label 'TOTAL';
}

