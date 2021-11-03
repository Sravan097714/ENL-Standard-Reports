pageextension 50050 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(BRN; Rec."Business Registraton No.")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    customerrec.Reset();
                    customerrec.SetRange("Business Registraton No.", rec."Business Registraton No.");
                    if customerrec.FindFirst() then
                        Error('BRN already used on another customer');
                end;

            }
        }

        addafter("Credit Limit (LCY)")
        {
            // field("Business Registraton No."; "Business Registraton No.")
            // {
            //     ApplicationArea = all;
            // }
            // field(BRN; BRN)
            // {
            //     ApplicationArea = all;
            // }
            // field(NID; NID)
            // {
            //     ApplicationArea = all;
            // }
            field(Statement; Statement)
            {
                ApplicationArea = all;
            }
            field("Search Name "; "Search Name")
            {
                ApplicationArea = all;
            }
        }
        //LS290621-Start
        addlast(General)
        {
            field(NID; NID)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    customerrec.Reset();
                    customerrec.SetRange(NID, rec.NID);
                    if customerrec.FindFirst() then
                        Error('NID %1 already used on another customer', Rec.NID);
                end;
            }
        }
        //LS290621-End
        //DropArea1.0 >>
        addafter(SalesHistSelltoFactBox)
        {
            part("Documents Drop Box"; "Drop Area FactBox")
            {
                ApplicationArea = All;
                Caption = 'Documents Drop Box';
            }
        }
        //DropArea1.0 <<
    }

    actions
    {
        addlast(Reporting)
        {
            action("S.O.A")
            {
                Image = StatisticsDocument;
                RunObject = report "Statement of Account";
                ApplicationArea = all;
            }
            action("ReportStatement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'ENL-Statement';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.';

                trigger OnAction()
                var
                    ReportSelections: Record "Report Selections";
                    Customer: Record Customer;
                    CustomLayoutReporting: Codeunit "Custom Layout Reporting";
                    RecRef: RecordRef;
                begin
                    RecRef.Open(DATABASE::Customer);
                    CustomLayoutReporting.SetOutputFileBaseName(StatementFileNameTxt);
                    CustomLayoutReporting.SetTableFilterForReportID(Report::"ENL-Standard Statement", "No.");
                    CustomLayoutReporting.ProcessReportData(ReportSelections.Usage::"C.Statement", RecRef, Customer.FieldName("No."),
                      DATABASE::Customer, Customer.FieldName("No."), true);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrPage."Documents Drop Box".Page.SetTable(Rec); //DropArea1.0 
    end;

    var
        customerrec: Record Customer;
        StatementFileNameTxt: Label 'Statement', Comment = 'Shortened form of ''Customer Statement''';


}