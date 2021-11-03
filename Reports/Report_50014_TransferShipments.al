report 50014 "Transfer Shipments"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\TransferShip.rdl';

    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "No.", "Posting Date", "Transfer-from Code", "Transfer-to Code";
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAdd; CompanyInfo.Address + '' + CompanyInfo."Address 2") { }
            column(CompanyEmail; companyinfo."Email Address - MRA") { }
            column(CompanyPhone; CompanyInfo."Phone No.") { }
            column(CompanyFax; CompanyInfo."Fax No.") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            column(CompanyVAT; companyinfo."Business Registration No.") { }
            column(CompanyVatReg; companyinfo."VAT Registration No.") { }
            column(No_; "No.") { }
            column(Transfer_from_Code; "Transfer-from Code") { }
            column(Transfer_to_Code; "Transfer-to Code") { }
            column(Posting_Date; "Posting Date") { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
            column(Tel; Tel) { }
            column(Email; Email) { }
            column(VatReg; VatReg) { }
            column(BRN; BRNNo) { }
            column(Heading; Heading) { }
            column(Comma; Comma) { }
            column(Fax; Fax) { }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Document_No_; "Document No.") { }
                column(Line_No_; "Line No.") { }
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                dataitem("Item Ledger Entry"; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = field("Document No."), "Document Line No." = field("Line No.");
                    column(Entry_No_; "Entry No.") { }
                    column(ILEItem_No_; "Item No.") { }
                    column(Document_Line_No_; "Document Line No.") { }
                    column(Serial_No_; "Lot No.") { }

                }
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

    var
        CompanyInfo: Record "Company Information";
        Tel: Label 'Tel:';
        Email: Label 'Email:';
        VatReg: Label 'VAT Reg. No. :';
        BRNNo: Label 'BRN :';
        Heading: Label 'TRANSFER SHIPMENT';
        Comma: Label ',';
        Fax: Label 'Fax:';

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;
}