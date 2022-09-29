codeunit 50166 "Notifications' Handling"
{
    trigger OnRun()
    begin
        FnSendLoanDueNotifications();
        FnSendLoanDueNotifications();
        FnSendRegAnniversaryMessages();
        FnSendDefaulterNotices();
    end;

    procedure FnSendRegAnniversaryMessages()
    begin
        ObjCust.Reset();
        ObjCust.SetFilter(ObjCust."Registration Date", '<>%1', 0D);
        if ObjCust.FindSet() then begin
            Message('found');
            repeat
                objcompInfo.get();
                AnniversaryYear := Round(((Today - ObjCust."Registration Date") / 365), 1, '<');
                Message('Anvyear %1 RegDate %2', AnniversaryYear, ObjCust."Registration Date");
                if (Date2DMY(Today, 1) = Date2DMY(ObjCust."Registration Date", 1)) and (Date2DMY(Today, 2) = Date2DMY(ObjCust."Registration Date", 2)) then begin
                    Sfactory.FnSendSMS('REGANIVERSARY', StrSubstNo(AniversaryMsg, ObjCust."First Name", AnniversaryYear, objcompInfo.Name), Format(ObjCust."No."), Format(ObjCust."Mobile Phone No"));
                end;
            until ObjCust.Next() = 0;
        end;
    end;

    procedure FnSendBirthdaySmsMessegages()
    begin
        ObjCust.Reset();
        ObjCust.SetFilter(ObjCust."Date Of Birth", '<>%1', 0D);
        if ObjCust.FindSet() then begin
            Message('found');
            repeat
                objcompInfo.get();
                if (Date2DMY(Today, 1) = Date2DMY(ObjCust."Date Of Birth", 1)) and (Date2DMY(Today, 2) = Date2DMY(ObjCust."Date Of Birth", 2)) then begin
                    Sfactory.FnSendSMS('MEMBERBIRTHDAY', StrSubstNo(bIRTHDAYMSG, ObjCust."First Name", objcompInfo.Name), Format(ObjCust."No."), Format(ObjCust."Mobile Phone No"));
                end;
            until ObjCust.Next() = 0;
        end;
    end;

    procedure FnSendLoanDueNotifications()
    begin
        Tomorrow := CalcDate('1D', Today);
        ObjLoansRec.Reset();
        ObjLoansRec.SetAutoCalcFields(ObjLoansRec."Outstanding Balance");
        ObjLoansRec.SetRange(ObjLoansRec.Posted, true);
        ObjLoansRec.SetFilter(ObjLoansRec."Outstanding Balance", '>%1', 0);
        if ObjLoansRec.FindSet() then begin
            repeat
                objLschedule.reset;
                objLschedule.setrange(objLschedule."Loan No.", ObjLoansRec."Loan  No.");
                objLschedule.SetRange(objLschedule."Repayment Date", Tomorrow);
                if objLschedule.Find('-') then begin
                    ObjCust.Reset();
                    ObjCust.SetRange(ObjCust."No.", objLschedule."Member No.");
                    if ObjCust.Find('-') then
                        Sfactory.FnSendSMS('LOANREMINDER', 'Dear Member, Remember to make your Loan repayment due tomorrow.', Format(ObjCust."No."), Format(ObjCust."Mobile Phone No"));
                end;
            until ObjLoansRec.Next() = 0;
        end
    end;

    procedure FnSendDefaulterNotices()
    begin
        ObjLoansRec.Reset();
        ObjLoansRec.SetAutoCalcFields(ObjLoansRec."Outstanding Balance");
        ObjLoansRec.SetRange(ObjLoansRec.Posted, true);
        ObjLoansRec.SetRange(ObjLoansRec."Loans Category", ObjLoansRec."Loans Category"::Loss);
        ObjLoansRec.SetFilter(ObjLoansRec."Outstanding Balance", '>%1', 0);
        if ObjLoansRec.FindSet() then begin
            repeat

                ObjCust.Reset();
                ObjCust.SetRange(ObjCust."No.", objLschedule."Member No.");
                if ObjCust.Find('-') then
                    Sfactory.FnSendSMS('LOANDEFAULTER', StrSubstNo(DefaulterMsg, ObjCust."First Name", ObjLoansRec."Loan Product Type Name", ObjLoansRec."Amount in Arrears"), Format(ObjCust."No."), Format(ObjCust."Mobile Phone No"));
            until ObjLoansRec.Next() = 0;
        end
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