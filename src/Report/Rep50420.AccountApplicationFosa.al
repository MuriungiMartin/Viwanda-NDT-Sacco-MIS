#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516420_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50420 "Account Application Fosa"
{
    RDLCLayout = 'Layouts/AccountApplicationFosa.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Membership Applications"; "Membership Applications")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Global Dimension 1 Code", Status;
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(No; "Membership Applications"."No.")
            {
            }
            column(Name; "Membership Applications".Name)
            {
            }
            column(Application_Type; "Membership Applications"."Application Category")
            {
            }
            column(Employer_Code; "Membership Applications"."Employer Code")
            {
            }
            column(Account_Category; "Membership Applications"."Account Category")
            {
            }
            column(Registration_Date; "Membership Applications"."Registration Date")
            {
            }
            column(Application_Date; "Membership Applications".Status)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address2; Company."Address 2")
            {
            }
            column(Company_PhoneNo; Company."Phone No.")
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }

            column(UserId; UserId)
            {
            }
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

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516420_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
