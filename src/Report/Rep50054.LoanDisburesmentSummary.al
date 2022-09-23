#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516054_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50054 "Loan Disburesment Summary"
{
    RDLCLayout = 'Layouts/LoanDisburesmentSummary.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Loan Products Setup"; "Loan Products Setup")
        {
            PrintOnlyIfDetail = false;
            column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address_2; Company."Address 2")
            {
            }
            column(Company_Phone_No; Company."Phone No.")
            {
            }
            column(Company_Fax_No; Company."Fax No.")
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }

            column(UserId; UserId)
            {
            }
            column(Code_LoanProductsSetup; "Loan Products Setup".Code)
            {
            }
            column(ProductDescription_LoanProductsSetup; "Loan Products Setup"."Product Description")
            {
            }
            column(VarCount; VarCount)
            {
            }
            column(VarTotalIssued; VarTotalIssued)
            {
            }
            column(VarEntryNo; VarEntryNo)
            {
            }
            column(VarDateFilter; VarDateFilter)
            {
            }
            column(VarFromDate; Format(VarFromDate, 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(VarToDate; Format(VarToDate, 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            trigger OnAfterGetRecord();
            begin
                VarDateFilter := Format(VarFromDate) + '..' + Format(VarToDate);
                VarTotalIssued := 0;
                VarCount := 0;
                ObjLoans.Reset;
                ObjLoans.SetRange(ObjLoans.Posted, true);
                ObjLoans.SetRange(ObjLoans."Loan Product Type", Code);
                ObjLoans.SetFilter(ObjLoans."Issued Date", VarDateFilter);
                ObjLoans.SetRange(ObjLoans.Rescheduled, false);
                if ObjLoans.FindSet then begin
                    ObjLoans.CalcSums(ObjLoans."Approved Amount");
                    if (ObjLoans."Disburesment Type" = ObjLoans."disburesment type"::"Full/Single disbursement") or
                      (ObjLoans."Disburesment Type" = ObjLoans."disburesment type"::" ") then begin
                        ObjLoans.CalcSums(ObjLoans."Approved Amount");
                        VarTotalIssued := ObjLoans."Approved Amount"
                    end else
                        ObjLoans.CalcSums(ObjLoans."Amount to Disburse on Tranch 1");
                    VarTotalIssued := VarTotalIssued + ObjLoans."Amount to Disburse on Tranch 1";
                    VarCount := ObjLoans.Count;
                end;
                VarEntryNo := VarEntryNo + 1;
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
                field(VarFromDate; VarFromDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'From Date';
                }
                field(VarToDate; VarToDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'To Date';
                }

            }
        }

        actions
        {
        }
        trigger OnOpenPage()
        begin

        end;
    }

    trigger OnInitReport()
    begin
        Company.Get();
        Company.CalcFields(Company.Picture);
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
        Company: Record "Company Information";
        VarFromDate: Date;
        VarToDate: Date;
        ObjLoans: Record "Loans Register";
        VarDateFilter: Text;
        VarTotalIssued: Decimal;
        VarCount: Integer;
        VarEntryNo: Integer;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516054_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
