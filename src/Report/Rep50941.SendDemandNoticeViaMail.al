#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516941_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50941 "Send Demand Notice Via Mail"
{
    RDLCLayout = 'Layouts/SendDemandNoticeViaMail.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Payroll Employee."; "Payroll Employee.")
        {
            column(ReportForNavId_1102755000; 1102755000) { } // Autogenerated by ForNav - Do not delete
            column(No; "Payroll Employee."."No.")
            {
            }
            trigger OnPreDataItem();
            begin
                //HrEmps.SETRANGE(HrEmps."Contract Type",Contracttype);
            end;

            trigger OnAfterGetRecord()
            var
                recipient: list of [text];

            begin
                SMTPSetup.Get;
                Emps.Reset;
                Emps.SetRange(Emps."No.", "Payroll Employee."."No.");
                Emps.SetRange(Emps.Status, Emps.Status::Active);
                if Emps.Find('-') then begin
                    if Emps."Employee Email" <> '' then
                        repeat
                            SalCard.Reset;
                            SalCard.SetRange(SalCard."No.", Emps."No.");
                            if SalCard.Find('-') then begin
                                recipient.Add(emps."Employee Email");
                                Filename := '';
                                Filename := SMTPSetup."Path to Save Report" + 'Payslips.pdf';
                                Report.SaveAsPdf(Report::"Payroll Payslip.", Filename, SalCard);
                                SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address", recipient, 'Payslips', '', true);
                                SMTPMail.AppendBody('Dear Staff,');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('Please find attached your Payslip');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('Enjoy.');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('Regards');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody(SMTPSetup."Email Sender Name");
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('<HR>');
                                SMTPMail.AddAttachment(Filename, Attachment);
                                SMTPMail.Send;
                            end;
                        until Emps.Next = 0;
                end;
            end;

        }
    }

    requestpage
    {


        SaveValues = false;
        layout
        {
            area(content)
            {
                field(SelectedPeriod; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Filter';
                    TableRelation = "prPayroll Periods"."Date Opened";
                }

            }
        }

        actions
        {
        }
        trigger OnOpenPage()
        begin
            //:= false;
        end;
    }

    trigger OnInitReport()
    begin
        ;


    end;

    trigger OnPostReport()
    begin
        ;

    end;

    trigger OnPreReport()
    begin
        ;

    end;

    var
        Filename: Text[100];
        SMTPSetup: Record "SMTP Mail Setup";
        SMTPMail: Codeunit "SMTP Mail";
        SalCard: Record "Payroll Employee.";
        Attachment: Text[250];
        EmpEmail: Text;
        HrEmps: Record "Salary Processing Header";
        objPeriod: Record "prPayroll Periods";
        SelectedPeriod: Date;
        Contracttype: Option Contract;
        Emps: Record "Payroll Employee.";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516941_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
