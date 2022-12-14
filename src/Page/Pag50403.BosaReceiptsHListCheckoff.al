#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 50403 "Bosa Receipts H List-Checkoff"
{
    CardPageID = "Bosa Receipts H Card-Checkoff";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "ReceiptsProcessing_H-Checkoff";
    SourceTableView = order(ascending) where(Posted = filter
    (false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Account No"; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled Amount"; "Scheduled Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Code"; "Employer Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

