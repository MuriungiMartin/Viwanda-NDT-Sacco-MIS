#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516287_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50287 "Active Accounts Deactivated"
{
    RDLCLayout = 'Layouts/ActiveAccountsDeactivated.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Change Request"; "Change Request")
        {
            DataItemTableView = where(Changed = const(true), "Member Account Status(NewValu)" = filter(<> " "));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Captured by", "Capture Date";
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

            column(SN; SN)
            {
            }
            column(No_ChangeRequest; "Change Request".No)
            {
            }
            column(Type_ChangeRequest; "Change Request".Type)
            {
            }
            column(Reasonforchange_ChangeRequest; "Change Request"."Reason for change")
            {
            }
            column(Capturedby_ChangeRequest; "Change Request"."Captured by")
            {
            }
            column(CaptureDate_ChangeRequest; "Change Request"."Capture Date")
            {
            }
            column(MemberStatus_ChangeRequest; "Change Request"."Member Account Status")
            {
            }
            column(MemberStatusNew_ChangeRequest; "Change Request"."Member Account Status(NewValu)")
            {
            }
            column(Name_ChangeRequest; "Change Request".Name)
            {
            }
            column(AccountNo_ChangeRequest; "Change Request"."Account No")
            {
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = field("Account No");
                column(ReportForNavId_15; 15) { } // Autogenerated by ForNav - Do not delete
                column(ComputerName_MembersRegister; Customer."Computer Name")
                {
                }
            }
            trigger OnAfterGetRecord();
            begin
                SN := SN + 1;
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
        Accname: Code[40];
        SN: Integer;
        Company: Record "Company Information";
        Amount: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516287_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
