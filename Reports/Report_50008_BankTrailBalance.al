report 50008 "Bank Trail Balance"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    UseRequestPage = true;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\BankTrailBalance.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.", "Date Filter";
            column(CompanyInfo; CompanyInfo.Name) { }
            column(Bank_Account_No_; "No.") { }
            column(AsOfDate; AsOfDate) { }
            column(GLAccountNo; GLAccountNo) { }
            column(GLBalance; GLBalance) { }
            column(LastStatementNo; LastStatementNo) { }
            column(LastStatementBal; LastStatementBal) { }
            column(UnreconsiledAmount; UnreconsiledAmount) { }
            column(BankAccountName; BankAccountName) { }
            column(PostingDate; PostingDate) { }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemTableView = sorting("Posting Date") where(Open = const(true));
                DataItemLink = "Bank Account No." = field("No.");

                column(Posting_Date; "Posting Date") { }
                column(Document_No_; "Document No.") { }
                column(Description; Description) { }
                column(Amount; Amount) { }
                column(Amount__LCY_; "Amount (LCY)") { }
                column(Entry_No_; "Entry No.") { }
                trigger OnPreDataItem()
                begin
                    "Bank Account Ledger Entry".SetFilter("Posting Date", '<=%1', PostingDate);
                end;
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                if "Bank Account".GetFilter("Date Filter") <> '' then
                    PostingDate := "Bank Account".GetRangeMax("Date Filter");

                BankAccountNovar := "Bank Account"."No.";
                if BankAccountNovar = '' then
                    Error('Bank Account Must be selected');

                BankAccount.get(BankAccountNovar);
                BankPostingGroup.Get(BankAccount."Bank Acc. Posting Group");
                BankAccountName := BankAccount.Name;
                GLAccountNo := BankPostingGroup."G/L Bank Account No.";

                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", GLAccountNo);
                GLEntry.SetFilter("Posting Date", '<=%1', PostingDate);
                if GLEntry.FindSet() then begin
                    GLEntry.CalcSums(Amount);
                    GLBalance := GLEntry.Amount;
                end;

                BankStatement.Reset();
                BankStatement.SetCurrentKey("Statement Date");
                BankStatement.SetRange("Bank Account No.", BankAccountNovar);
                BankStatement.SetFilter("Statement Date", '<=%1', PostingDate);
                if BankStatement.FindLast() then begin
                    LastStatementNo := BankStatement."Statement No.";
                    LastStatementBal := BankStatement."Statement Ending Balance";
                end;
                BankLedEntry.Reset();
                BankLedEntry.SetRange("Bank Account No.", BankAccountNovar);
                BankLedEntry.SetRange(Open, true);
                BankLedEntry.SetFilter("Posting Date", '<=%1', PostingDate);
                if BankLedEntry.FindSet() then begin
                    BankLedEntry.CalcSums(Amount);
                    UnreconsiledAmount := BankLedEntry.Amount;
                end;
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
        GLAccount: Record "G/L Account";
        BankAccount: Record "Bank Account";
        BankPostingGroup: Record "Bank Account Posting Group";
        BankStatement: Record "Bank Account Statement";
        BankAccountName: Text[50];
        GLEntry: Record "G/L Entry";
        AsOfDate: Text;
        GLAccountNo: Code[20];
        GLBalance: Decimal;
        LastStatementNo: Code[20];
        LastStatementBal: Decimal;
        UnreconsiledAmount: Decimal;
        PostingDate: Date;
        BankLedEntry: Record "Bank Account Ledger Entry";
        BankAccountNovar: Code[20];

}