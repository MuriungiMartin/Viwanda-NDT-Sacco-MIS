#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 50136 "ATM Pin Receipt SubPage"
{
    PageType = ListPart;
    SourceTable = "ATM Pin Receipt Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ATM Application No"; "ATM Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ATM Card Account No"; "ATM Card Account No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ATM Card Application Date"; "ATM Card Application Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ATM Card No"; "ATM Card No")
                {
                    ApplicationArea = Basic;
                }
                field("Pin Received"; "Pin Received")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Pin Received By"; "Pin Received By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pin Received On"; "Pin Received On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

