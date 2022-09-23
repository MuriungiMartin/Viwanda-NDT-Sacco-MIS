#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//50033_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50033 "Dormant Accounts Register"
{
    RDLCLayout = 'Layouts/DormantAccountsRegister.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = Status, "Account Type";
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
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
            column(VarCount; VarCount)
            {
            }
            column(Status_Vendor; Vendor.Status)
            {
            }
            column(AccountType_Vendor; Vendor."Account Type")
            {
            }
            column(No_Vendor; Vendor."No.")
            {
            }
            column(Name_Vendor; Vendor.Name)
            {
            }
            column(VarDormancyDate; Format(VarDormancyDate, 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(VarLastTransactionDate_; Format(VarLastTransactionDate, 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(VarDormancyDateTxt; VarDormancyDateTxt)
            {
            }
            column(LastTransactionDate_Vendor; Format("Last Transaction Date", 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(DormantDate_Vendor; Format("Dormant Date", 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(LastTransactionDateH_Vendor; Format("Last Transaction Date_H", 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            trigger OnAfterGetRecord();
            begin
                VarCount := VarCount + 1;
                VarLastTransactionDate := 0D;
                /*//==================================================================================Get Dormancy Date
				ObjAccounts.RESET;
				ObjAccounts.SETRANGE(ObjAccounts."No.","No.");
				IF ObjAccounts.FINDSET THEN
				  BEGIN
					IF ObjProductType.GET("Account Type") THEN
					  BEGIN
						ObjAccountLedger.RESET;
						ObjAccountLedger.SETRANGE(ObjAccountLedger."Vendor No.","No.");
						ObjAccountLedger.SETFILTER(ObjAccountLedger."Document No.",'<>%1','BALB/F9THNOV2018');
						IF ObjAccountLedger.FINDLAST THEN
						  BEGIN
							VarLastTransactionDate:=ObjAccountLedger."Posting Date";
							END;
						  IF VarLastTransactionDate=0D THEN
						   BEGIN
							  ObjAccountLedgerHistorical.RESET;
							  ObjAccountLedgerHistorical.SETRANGE(ObjAccountLedgerHistorical."Account No.","No.");
							  IF ObjAccountLedgerHistorical.FINDLAST THEN
								BEGIN
								  VarLastTransactionDate:=ObjAccountLedgerHistorical."Posting Date";
								  END;
								END;
						 IF  VarLastTransactionDate<>0D THEN BEGIN
						  VarDormancyDate:=CALCDATE(ObjProductType."Dormancy Period (M)",VarLastTransactionDate);
						  IF VarDormancyDate>WORKDATE THEN
							BEGIN
							VarDormancyDate:=0D;
							  END;
							//VarDormancyDateTxt:=FORMAT(VarDormancyDate);
						  END;
						END;
					END;
					*/
                /*VarLastTransactionDate:="Last Transaction Date";
				IF VarLastTransactionDate=0D THEN BEGIN
				CALCFIELDS("Last Transaction Date_H");
				VarLastTransactionDate:="Last Transaction Date_H"
				END;*/

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
        SFactory: Codeunit "SURESTEP Factory";
        ObjAccounts: Record Vendor;
        ObjProductType: Record "Account Types-Saving Products";
        ObjAccountLedger: Record "Vendor Ledger Entry";
        VarLastTransactionDate: Date;
        ObjAccountLedgerHistorical: Record "Member Historical Ledger Entry";
        VarDormancyDate: Date;
        Company: Record "Company Information";
        VarAmountinArrears: Decimal;
        ObjRepaymentSchedule: Record "Loan Repayment Schedule";
        VarCount: Integer;
        VarDepositsBal: Decimal;
        VarShareCapitalBal: Decimal;
        ObjCust: Record Customer;
        VarDormancyDateTxt: Text;
        ObjDetailedVendLedg: Record "Detailed Vendor Ledg. Entry";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //50033_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
