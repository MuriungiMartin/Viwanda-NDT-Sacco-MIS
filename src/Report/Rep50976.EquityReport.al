#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516976_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50976 "Equity Report"
{
    RDLCLayout = 'Layouts/EquityReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Sacco General Set-Up"; "Sacco General Set-Up")
        {
            column(ReportForNavId_2; 2) { } // Autogenerated by ForNav - Do not delete
            trigger OnPreDataItem();
            begin
                Datefilter := "Sacco General Set-Up".GetFilter("Sacco General Set-Up"."Date Filter");
                ASAt := "Sacco General Set-Up".GetRangemax("Sacco General Set-Up"."Date Filter");
            end;

            trigger OnAfterGetRecord();
            begin
                GL.Reset;
                GL.SetRange(GL."G/L Account No.", "Sacco General Set-Up"."Eq Account");
                GL.SetFilter(GL."Posting Date", Datefilter);
                if GL.FindSet then begin
                    repeat
                        // GL.CALCFIELDS(Balance);
                        CurrentBalance += GL.Amount;
                    until GL.Next = 0;
                end;
                PreviousPeriod := CalcDate('-5M', ASAt);
                PreviousDateFilter := Format(20000101D) + '..' + Format(PreviousPeriod);
                GL.Reset;
                GL.SetRange(GL."G/L Account No.", "Sacco General Set-Up"."Eq Account");
                GL.SetFilter(GL."Posting Date", PreviousDateFilter);
                if GL.FindSet then begin
                    repeat
                        //GL.CALCFIELDS(Balance);
                        PreviousBalance += GL.Amount;
                    until GL.Next = 0;
                end;
                Message('%1|%2', PreviousBalance, CurrentBalance);
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
                group(Options)
                {
                    Caption = 'Options';

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
        Datefilter: Text;
        ASAt: Date;
        PreviousPeriod: Date;
        PreviousDateFilter: Text;
        CurrentBalance: Decimal;
        PreviousBalance: Decimal;
        GL: Record "G/L Entry";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516976_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
