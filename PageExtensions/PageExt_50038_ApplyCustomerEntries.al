pageextension 50038 ApplyCustomerEntriesExt extends 232
{
    layout
    {
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Pmt. Disc. Tolerance Date")
        {
            Visible = false;
        }
        modify("Remaining Pmt. Disc. Possible")
        {
            Visible = false;
        }
        modify("Max. Payment Tolerance")
        {
            Visible = false;
        }
        modify("CalcApplnRemainingAmount(""Remaining Pmt. Disc. Possible"")")
        {
            Visible = false;
        }
        modify("Pmt. Disc. Amount")
        {
            Visible = false;
        }
        modify("Available Amount")
        {
            Visible = false;
        }
        modify("ApplyingCustLedgEntry.Amount")
        {
            Visible = false;
        }
        modify("ApplyingCustLedgEntry.""Remaining Amount""")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}