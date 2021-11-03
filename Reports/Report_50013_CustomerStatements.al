report 50013 "Customer Statements"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;


    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.") where(statement = const(true));
            trigger OnAfterGetRecord()
            var
                StatementReport: Report "ENL-Standard Statement";
                DateChoice: Option "Due Date","Posting Date";
                StartDate: Date;
                EndDate: Date;
                GLSetup: Record "General Ledger Setup";
                FilePath: Text[100];
                SMTPMailSetup: Record "SMTP Mail Setup";
                CompInfo: record "Company Information";
                SMTPMail: Codeunit 400;
            //DocMailSetup: Record "Document Mail Setup";
            begin
                CLEAR(FilePath);
                GLSetup.Get();
                SMTPMailSetup.Get();
                NewStartDate := DMY2Date(01, Date2DMY(NewEndDate, 2), Date2DMY(NewEndDate, 3));
                FilePath := TemporaryPath() + Customer."No." + '.pdf';
                IF EXISTS(FilePath) THEN
                    ERASE(FilePath);
                StatementReport.InitializeRequest(NewPrintEntriesDue, NewPrintAllHavingEntry, NewPrintAllHavingBal, NewPrintReversedEntries, NewPrintUnappliedEntries, NewIncludeAgingBand, NewPeriodLength, NewDateChoice, NewLogInteraction, NewStartDate, NewEndDate);
                StatementReport.SetTableView(Customer);
                StatementReport.SaveAsPdf(FilePath);
                // DocMailSetup.Get(DocMailSetup."Document Type"::"C Statement");
                // DocMailSetup.TestField(Subject);
                // DocMailSetup.TestField("User ID");
                // DocMailSetup.TestField("Body-Heading");
                // DocMailSetup.TestField("Body-1");
                // DocMailSetup.TestField("Body-Close");
                // GLSetup.TestField("Temp Folder Path");
                CompInfo.GET;
                //SMTPMail.CreateMessage(DocMailSetup."User ID", SMTPMailSetup."User ID", Customer."E-Mail", DocMailSetup.Subject, '', TRUE);
                SMTPMail.CreateMessage(CompInfo.Name, SMTPMailSetup."User ID", Customer."E-Mail", '', '', TRUE);
                // if DocMailSetup."Body-Heading" <> '' then begin
                //     SMTPMail.AppendBody(DocMailSetup."Body-Heading");
                //     SMTPMail.AppendBody(Customer.Name);
                //     SMTPMail.AppendBody(',');
                // end;
                SMTPMail.AppendBody(Customer.Name);
                SMTPMail.AppendBody(',');
                SMTPMail.AppendBody('<br>');
                SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(DocMailSetup."Body-1");
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                SMTPMail.AppendBody('No. : ');
                SMTPMail.AppendBody("No.");
                SMTPMail.AppendBody('<br>');
                SMTPMail.AppendBody('<br>');
                SMTPMail.AppendBody('Date : ');
                SMTPMail.AppendBody(FORMAT(NewEndDate));
                SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(DocMailSetup."Body-2");
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(DocMailSetup."Body-3");
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(DocMailSetup."Body-4");
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(DocMailSetup."Body-5");
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(DocMailSetup."Body-Close");
                // SMTPMail.AppendBody('<br>');
                SMTPMail.AppendBody(CompInfo.Name);
                SMTPMail.AddAttachment(FilePath, 'Customer Statement.pdf');
                SMTPMail.Send;
            end;
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
                    field("End Date"; NewEndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = all;
                    }
                    field(ShowOverdueEntries; NewPrintEntriesDue)
                    {
                        Caption = 'Show Overdue Entries';
                        Enabled = false;
                        ApplicationArea = all;
                    }
                    field(IncludeAllCustomerswithLE; NewPrintAllHavingEntry)
                    {
                        Caption = 'Include All Customers with Ledger Entries';
                        Enabled = false;
                        MultiLine = true;
                        ApplicationArea = all;

                        trigger OnValidate();
                        begin
                            IF NOT NewPrintAllHavingEntry THEN
                                NewPrintAllHavingBal := TRUE;
                        end;
                    }
                    field(IncludeAllCustomerswithBalance; NewPrintAllHavingBal)
                    {
                        Caption = 'Include All Customers with a Balance';
                        MultiLine = true;
                        ApplicationArea = all;

                        trigger OnValidate();
                        begin
                            IF NOT NewPrintAllHavingBal THEN
                                NewPrintAllHavingEntry := TRUE;
                        end;
                    }
                    field(IncludeReversedEntries; NewPrintReversedEntries)
                    {
                        Caption = 'Include Reversed Entries';
                        Enabled = false;
                        ApplicationArea = all;
                    }
                    field(IncludeUnappliedEntries; NewPrintUnappliedEntries)
                    {
                        Caption = 'Include Unapplied Entries';
                        Enabled = false;
                        ApplicationArea = all;
                    }
                    field(IncludeAgingBand; NewIncludeAgingBand)
                    {
                        Caption = 'Include Aging Band';
                        ApplicationArea = all;
                    }
                    field(AgingBandPeriodLengt; NewPeriodLength)
                    {
                        Caption = 'Aging Band Period Length';
                        ApplicationArea = all;
                    }
                    field(AgingBandby; NewDateChoice)
                    {
                        Caption = 'Aging Band by';
                        OptionCaption = 'Due Date,Posting Date';
                        ApplicationArea = all;
                    }
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
        NewPrintEntriesDue: Boolean;
        NewPrintAllHavingEntry: Boolean;
        NewPrintAllHavingBal: Boolean;
        NewPrintReversedEntries: Boolean;
        NewPrintUnappliedEntries: Boolean;
        NewIncludeAgingBand: Boolean;
        NewPeriodLength: Text[30];
        NewDateChoice: Option;
        NewLogInteraction: Boolean;
        NewStartDate: Date;
        NewEndDate: Date;
}