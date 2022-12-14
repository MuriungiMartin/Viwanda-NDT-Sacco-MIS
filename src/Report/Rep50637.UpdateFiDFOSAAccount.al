#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//50026_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50637 "Update FiD FOSA Account"
{
    RDLCLayout = 'Layouts/UpdateFiDFOSAAccount.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Loans Register"; "Loans Register")
        {
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            trigger OnAfterGetRecord();
            begin
                "Loans Register"."Loan Installments to Skip" := 1;
                "Loans Register".CalcFields("Loans Register"."Interest Due", "Loans Register"."Interest Paid");
                if "Loans Register"."Interest Paid" > "Loans Register"."Interest Due" then begin
                    "Loans Register"."Loan Installments to Skip" := 1;
                    "Loans Register".Modify;
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
        ObjMemberAccount: Record Vendor;
        ObjLoanPortfolio: Record "Loan Portfolio Provision";
        ObjGLEntry: Record "G/L Entry";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //50026_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
