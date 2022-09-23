#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516057_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50057 "Products Performance Summary"
{
    RDLCLayout = 'Layouts/ProductsPerformanceSummary.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Loan Products Setup"; "Loan Products Setup")
        {
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
            column(VarEntryNo; VarEntryNo)
            {
            }
            column(Code_LoanProductsSetup; "Loan Products Setup".Code)
            {
            }
            column(ProductDescription_LoanProductsSetup; "Loan Products Setup"."Product Description")
            {
            }
            column(VarReportDate; Format(VarReportDate, 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(VarTotalLoanBalance; VarTotalLoanBalance)
            {
            }
            column(VarTotalLoanCount; VarTotalLoanCount)
            {
            }
            column(VarTotalPerformingBalance; VarTotalPerformingBalance)
            {
            }
            column(VarTotalPerformingCount; VarTotalPerformingCount)
            {
            }
            column(VarTotalNonPerformingBalance; VarTotalNonPerformingBalance)
            {
            }
            column(VarTotalNonPerformingCount; VarTotalNonPerformingCount)
            {
            }
            column(VarPercenatgeNonPerforming; VarPercenatgeNonPerforming)
            {
            }
            column(VarTotalArrears; VarTotalArrears)
            {
            }
            trigger OnPreDataItem();
            begin
                Company.Get();
                Company.CalcFields(Company.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                VarEntryNo := VarEntryNo + 1;
                VarTotalLoanBalance := 0;
                VarTotalArrears := 0;
                VarTotalLoanCount := 0;
                VarTotalPerformingBalance := 0;
                VarTotalPerformingCount := 0;
                VarTotalNonPerformingBalance := 0;
                VarTotalNonPerformingCount := 0;
                VarPercenatgeNonPerforming := 0;
                //====================================================Total Balances
                ObjLoans.Reset;
                ObjLoans.SetRange(ObjLoans."Loan Product Code", Code);
                ObjLoans.SetFilter(ObjLoans."Report Date", '%1', VarReportDate);
                ObjLoans.SetFilter(ObjLoans."Outstanding Balance", '<>%1', 0);
                if ObjLoans.FindSet then begin
                    ObjLoans.CalcSums(ObjLoans."Outstanding Balance", ObjLoans."Arrears Amount");
                    VarTotalLoanBalance := ObjLoans."Outstanding Balance";
                    VarTotalArrears := ObjLoans."Arrears Amount";
                    VarTotalLoanCount := ObjLoans.Count;
                end;
                //====================================================Total Performing
                ObjLoans.Reset;
                ObjLoans.SetRange(ObjLoans."Loan Product Code", Code);
                ObjLoans.SetRange(ObjLoans.Classification, ObjLoans.Classification::Perfoming);
                ObjLoans.SetFilter(ObjLoans."Report Date", '%1', VarReportDate);
                ObjLoans.SetFilter(ObjLoans."Outstanding Balance", '<>%1', 0);
                if ObjLoans.FindSet then begin
                    ObjLoans.CalcSums(ObjLoans."Outstanding Balance");
                    VarTotalPerformingBalance := ObjLoans."Outstanding Balance";
                    VarTotalPerformingCount := ObjLoans.Count;
                end;
                //====================================================Total Non Performing
                ObjLoans.Reset;
                ObjLoans.SetRange(ObjLoans."Loan Product Code", Code);
                ObjLoans.SetFilter(ObjLoans.Classification, '<>%1', ObjLoans.Classification::Perfoming);
                ObjLoans.SetFilter(ObjLoans."Report Date", '%1', VarReportDate);
                ObjLoans.SetFilter(ObjLoans."Outstanding Balance", '<>%1', 0);
                if ObjLoans.FindSet then begin
                    ObjLoans.CalcSums(ObjLoans."Outstanding Balance");
                    VarTotalNonPerformingBalance := ObjLoans."Outstanding Balance";
                    VarTotalNonPerformingCount := ObjLoans.Count;
                end;
                if VarTotalNonPerformingCount <> 0 then
                    VarPercenatgeNonPerforming := ROUND((VarTotalNonPerformingCount / VarTotalLoanCount) * 100, 1, '=');
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
                field(VarReportDate; VarReportDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'As At';
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
        AsAt: Date;
        Company: Record "Company Information";
        SFactory: Codeunit "SURESTEP Factory";
        ObjGensetup: Record "Sacco General Set-Up";
        CurrReport_PAGENOCaptionLbl: label 'Page';
        RISK_CLASSIFICATION_OF_ASSETS_AND_PROVISIONINGCaptionLbl: label 'RISK CLASSIFICATION OF ASSETS AND PROVISIONING';
        FORM_4CaptionLbl: label 'FORM 4';
        SASRA_2_004CaptionLbl: label 'SASRA 2/004';
        R__46_CaptionLbl: label 'R.(46)';
        ObjMembers: Record Customer;
        VarEntryNo: Integer;
        ObjDetailedVendLedger: Record "Detailed Vendor Ledg. Entry";
        VarReportDate: Date;
        VarLoansDateFilter: Text;
        VarAccountTypeBalance: Decimal;
        ObjLoans: Record "Loan Portfolio Provision";
        VarTotalLoanBalance: Decimal;
        VarTotalLoanCount: Integer;
        VarTotalPerformingBalance: Decimal;
        VarTotalPerformingCount: Integer;
        VarTotalNonPerformingBalance: Decimal;
        VarTotalNonPerformingCount: Integer;
        VarPercenatgeNonPerforming: Decimal;
        VarTotalArrears: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516057_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
