report 50024 "Item Ledger Entry"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\ItemLedEntry.rdl';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Item Register"; "Item Register")
        {
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                RequestFilterFields = "Document No.";

                column(CompanyName; companyinfo.Name) { }
                column(CompanyAdd; CompanyInfo.Address) { }
                column(CompanyAdd2; CompanyInfo."Address 2") { }
                column(CompanyEmail; companyinfo."Email Address - MRA") { }
                column(CompanyPhone; CompanyInfo."Phone No.") { }
                column(CompanyPic; CompanyInfo.Picture) { }
                column(CompanyArr1; CompanyArr[1]) { }
                column(CompanyArr2; CompanyArr[2]) { }
                column(CompanyArr3; CompanyArr[3]) { }
                column(CompanyArr4; CompanyArr[4]) { }
                column(CompanyArr5_; CompanyArr[5]) { }
                column(CompanyArr6_; CompanyArr[6]) { }
                column(CompanyArr7_; CompanyArr[7]) { }
                column(CompanyArr8_; CompanyArr[8]) { }
                column(CompanyArr9; CompanyArr[9]) { }
                column(CompanyArr10; CompanyArr[10]) { }
                column(ContractNo; '') { }
                column(Dim1; "Item Ledger Entry"."Global Dimension 1 Code") { }
                column(Document_Type; "Document Type") { }
                column(Document_No_; "Document No.") { }
                column(Entry_Type; "Entry Type") { }
                column(No_; "Item No.") { }
                column(Unit_of_Measure; "Unit of Measure Code") { }
                column(Description; Description) { }
                column(Location_Code; "Location Code") { }
                column(Quantity; ABS(Quantity)) { }
                column(IssueNoteCap; IssueNoteCap) { }
                column(PageNoCap; PageNoCap) { }
                column(DateCap; DateCap) { }
                column(ServiceOrderCap; ServiceOrderCap) { }
                column(OrderTakenByCap; OrderTakenByCap) { }
                column(ServiceItemNoCap; ServiceItemNoCap) { }
                column(EquipmentNoCap; EquipmentCap) { }
                column(ItemDescription; ItemDescCap) { }
                column(SerialNoCap; SerialNoCap) { }
                column(LineNoCap; LineNoCap) { }
                column(ItemNoCap; ItemNoCap) { }
                column(ItemDescCap; ItemDescCap) { }
                column(Locationcap; LocationCap) { }
                column(UOMCap; UOMCap) { }
                column(qtyCap; QtyCap) { }
                column(LastDateCap; LastDateCap) { }
                column(IssuedByCap; IssuedByCap) { }
                column(SignCap; SignCap) { }
                column(ReceivedCap; ReceivedCap) { }
                column(Service_Order_No_; '') { }
                column(Serial_No_; "Lot No.") { }
                trigger OnAfterGetRecord()
                begin


                end;

                trigger OnPreDataItem()
                begin
                    "Item Ledger Entry".SetRange("Entry No.", "Item Register"."From Entry No.", "Item Register"."To Entry No.");
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
        Formataddress.CompanyRCTS(CompanyArr, CompanyInfo);
    end;

    var
        CompanyArr: array[10] of Text[95];
        Formataddress: Codeunit 50000;

        IssueNoteCap: Label 'Posted Store Issue';
        PageNoCap: Label 'Page No. : ';
        DateCap: Label 'Date : ';
        ServiceOrderCap: Label 'Service Order No : ';
        OrderTakenByCap: Label 'Order Taken By : ';
        ServiceItemNoCap: Label 'Service Item No. : ';
        EquipmentCap: Label 'Equipment No. : ';

        SerialNoCap: Label 'LOT No. :';
        LineNoCap: Label 'Line No. ';
        ItemNoCap: Label 'Item No.';
        ItemDescCap: Label 'Item Description';
        LocationCap: Label 'Location';
        UOMCap: Label 'UOM';
        QtyCap: Label 'Quantity';
        IssuedByCap: Label 'Issued By : ____________________';
        LastDateCap: Label 'Date : ___________________';
        SignCap: Label 'Sign : __________________';
        ReceivedCap: Label 'Received By : ________________';
        CompanyInfo: Record "Company Information";


}