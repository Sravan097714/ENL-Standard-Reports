tableextension 50070 BankAccountReconineExt extends "Bank Acc. Reconciliation Line"
{
    fields
    {
        field(50000; "Debit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Credit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Debit Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Credit Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    /*
    BankAccReconLine."Debit Amount" := BankAccReconLine."Debit Amount" + BankAccLedgEntry."Debit Amount";
                BankAccReconLine."Credit Amount" := BankAccReconLine."Credit Amount" + BankAccLedgEntry."Credit Amount";
                BankAccReconLine."Debit Amount (LCY)" := BankAccReconLine."Debit Amount (LCY)" + BankAccLedgEntry."Debit Amount (LCY)";
                BankAccReconLine."Credit Amount (LCY)" := BankAccReconLine."Credit Amount (LCY)" + BankAccLedgEntry."Credit Amount (LCY)";
    */
    var
        myInt: Integer;
}