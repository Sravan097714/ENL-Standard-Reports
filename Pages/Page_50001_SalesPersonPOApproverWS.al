page 50001 "Salespersons/PurchasersWSer"
{
    AdditionalSearchTerms = 'sales representative';
    ApplicationArea = Basic, Suite;
    Caption = 'Salespeople/PurchasersWService';
    CardPageID = "Salesperson/Purchaser Card";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Salesperson';
    SourceTable = "Salesperson/Purchaser";
    SourceTableView = where("Requisition Approver" = filter(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the record.';
                }
                field(Name; Name)
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the name of the record.';
                }
                field("Commission %"; "Commission %")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the percentage to use to calculate the salesperson''s commission.';
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the salesperson''s or purchaser''s telephone number.';
                }
                field("POApprover"; "Privacy Blocked")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                    Visible = true;
                    Caption = 'PO Approver';
                }
                field("Requisition Approver"; "Requisition Approver")
                {
                    ApplicationArea = all;
                }
            }
        }

    }
}

