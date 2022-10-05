page 51401 "MpesaBilling"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = MpesaBillings;
    Caption = 'Mpesa Billing Card';


    layout
    {
        area(Content)
        {
            usercontrol(Mpesa; MpesaAddin)
            {

                ApplicationArea = all;

                trigger ControlReady()
                var
                    myInt: Integer;
                begin
                    //Message('ready to execute javascript');
                    //CurrPage.Mpesa.pay(myInt);

                end;

            }
            group(GroupName)
            {
                field(BillingNo; BillingNo)
                {
                    ApplicationArea = All;

                }
                field("Bill to Phone No."; "Bill to Phone No.")
                {

                }
                field("Bill Amount"; "Bill Amount")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Pay)
            {
                ApplicationArea = All;
                Image = Production;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                begin
                    CurrPage.Mpesa.Pay("Bill to Phone No.", "Bill Amount");
                end;
            }
        }
    }


}