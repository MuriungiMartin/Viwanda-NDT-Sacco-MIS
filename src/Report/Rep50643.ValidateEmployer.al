#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516036_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50643 "Validate Employer"
{
    RDLCLayout = 'Layouts/ValidateEmployer.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Buffer 2016-b"; "Buffer 2016-b")
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            trigger OnAfterGetRecord();
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."Payroll No", "Payroll number"); //"Account No."
                                                                        //Vendor.SETRANGE(Vendor."Global Dimension 2 Code","Global Dimension 2 Code");
                                                                        //Vendor.SETRANGE(Vendor."Employer Code","Employer Code");
                if Vendor.Find('-') then begin
                    "Member No" := Vendor."No.";
                    Modify;
                end;
                /*
				//Get BOSA No
				  Cust.RESET;
				  Cust.SETRANGE(Cust."Personal No","Staff No."); //"Account No."
					Cust.SETRANGE(Cust."Employer Code","Employer Code");
				  IF Cust.FIND('-') THEN BEGIN
					"BOSA No":=Cust."No.";
					MODIFY;
					END;
					*/

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
        Vendor: Record Customer;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516036_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
