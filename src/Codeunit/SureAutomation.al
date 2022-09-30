codeunit 50167 "Sure Automation"
{
    trigger OnRun()
    begin

    end;

    procedure FnRunGuarantorCurrentGuaranteedAmount()
    var
        LoanApprovedAmount: Decimal;
    begin
        ObjGuarantors.Reset();
        ObjGuarantors.SetAutoCalcFields(ObjGuarantors."Outstanding Balance");
        if ObjGuarantors.FindSet() then begin
            repeat
                ObjLoansRec.Reset();
                ObjLoansRec.SetRange(ObjLoansRec."Loan  No.", ObjGuarantors."Loan No");
                if ObjLoansRec.Find('-') then begin
                    LoanApprovedAmount := ObjLoansRec."Approved Amount";
                end;
                ObjGuarantors."Current Amount Guaranteed" := (ObjGuarantors."Amont Guaranteed" / LoanApprovedAmount) * ObjGuarantors."Oustanding Interest";
                ObjGuarantors.Modify();
            until ObjGuarantors.Next() = 0;
        end;
    end;

    procedure FnGetMemberFreeShares()
    var
        varTotalGuaranteedAmount: decimal;
        VarTotalLoansOutstanding: Decimal;
        ObjCustRec: record Customer;
    begin
        ObjCust.Reset();
        ObjCust.SetAutoCalcFields(ObjCust."Outstanding Balance");
        if ObjCust.FindSet() then begin
            repeat
                ObjCustRec.Reset();
                ObjCustRec.SetRange(ObjCustRec."No.", ObjCust."No.");
                if ObjCustRec.find('-') then begin
                    repeat
                        VarTotalLoansOutstanding += ObjCustRec."Outstanding Balance";
                    until ObjCustRec.Next() = 0;
                end;
                ObjGuarantors.Reset();
                ObjGuarantors.SetRange(ObjGuarantors."Member No");
                ObjGuarantors.SetAutoCalcFields(ObjGuarantors."Outstanding Balance");
                if ObjGuarantors.FindSet() then begin
                    repeat
                        varTotalGuaranteedAmount += ObjGuarantors."Current Amount Guaranteed";
                    until ObjGuarantors.Next() = 0;
                end;
                ObjCust."Free Shares" := (ObjCust."Current Shares" - (varTotalGuaranteedAmount + VarTotalLoansOutstanding));
                ObjCust.Modify();
            until ObjCust.Next() = 0;
        end;
    end;

    var
        Sfactory: Codeunit "SURESTEP Factory";
        ObjLoansRec: Record "Loans Register";
        ObjCust: record Customer;
        ObjGuarantors: Record "Loans Guarantee Details";
        ObjSaccoGenSetup: Record "Sacco General Set-Up";
        ObjSmsMessage: record "SMS Messages";
        objSMTPSetup: record "SMTP Mail Setup";
        SMTP: Codeunit "SMTP Mail";
        objcompInfo: record "Company Information";
        AnniversaryYear: Integer;
        AniversaryMsg: Label 'Dear %1. Happy %2th Membership Anniversary. %3 Values You!';
        bIRTHDAYMSG: Label 'Dear %1. Happy Birthday. %2 Values You!';
        DefaulterMsg: Label 'Dear %1. Your %2 is in arrears of %3 Ksh. Kindly make full payments to avoid CRB Listing';
        objLschedule: Record "Loan Repayment Schedule";
        iEntryNo: Integer;
        Tomorrow: Date;
}