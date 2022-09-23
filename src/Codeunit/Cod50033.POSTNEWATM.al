#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Codeunit 50033 "POST NEW  ATM"
{
    Permissions = TableData "ATM Transactions" = rimd;
    TableNo = "ATM Transactions";

    trigger OnRun()
    begin
        //MESSAGE('%1',InsertFBAtmCharges('0200','001401012073','254713213296','00250604',3000,'0000324411515','15010115','ELDORET UGANDA RD 2 Eldoret',TODAY,'00',FALSE,TODAY));
        //MESSAGE(FORMAT(fnFBATMCHARGES('Family')));
        //MESSAGE(FORMAT(getAccountBalance('001405000026')));
        //MESSAGE(FORMAT(fnFBATMCHARGES('FAMILY')));
    end;

    var
        GenJournalLine: Record "Gen. Journal Line";
        ATMTrans: Record "ATM Transactions";
        LineNo: Integer;
        Acct: Record Vendor;
        ATMCharges: Decimal;
        BankCharges: Decimal;
        ExciseGLAcc: Code[20];
        ExciseFee: Decimal;
        GenBatches: Record "Gen. Journal Batch";
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        ATM_CHARGES: Record "ATM Charges";
        DocNo: Code[20];
        BankAccount: Code[20];
        GLAccount: Code[20];
        Reversals2: Record "ATM Transactions";
        iEntryNo: Integer;
        SMSMessage: Record "SMS Messages";
        Vend1: Record Vendor;
        VendL: Record "Vendor Ledger Entry";
        Pos: Record "POS Commissions";
        AccountCharges: Decimal;
        SFactory: Codeunit "SURESTEP FactoryMobile";
        GenSetUp: Record "Sacco General Set-Up";
        ATMMessages: Text;
        BATCH_TEMPLATE: Code[100];
        BATCH_NAME: Code[100];
        DOCUMENT_NO: Code[100];
        Vendor: Record Vendor;
        AccountTypes: Record "Account Types-Saving Products";
        miniBalance: Decimal;
        acctFrozen: Code[10];
        ProdID: Code[10];
        DormantAccount: Code[10];
        accountBal: Decimal;
        closureDate: Date;
        ProductAppSignatories: Record "Product App Signatories";
        "Count": Integer;
        ExciseCharges: Decimal;
        DrCharge: Text;


    procedure PostTrans(ReferenceNo: Code[50]): Boolean
    var
        processed: Boolean;
        time_processed: Time;
        CrNarration: Text;
        DrNarration: Text;
        CrTax: Text;
        DrTax: Text;
        SaccoGen: Record "Sacco General Set-Up";
        DrVendor: Text;
        Members: Record Customer;
        CloudPesa: Codeunit CloudPESALivetest;
        VarLocationlength: Integer;
    begin
        BATCH_TEMPLATE := 'GENERAL';
        BATCH_NAME := 'ATMTRANS';

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", BATCH_TEMPLATE);
        GenJournalLine.SetRange("Journal Batch Name", BATCH_NAME);
        GenJournalLine.DeleteAll;
        //end of deletion

        GenBatches.Reset;
        GenBatches.SetRange(GenBatches."Journal Template Name", BATCH_TEMPLATE);
        GenBatches.SetRange(GenBatches.Name, BATCH_NAME);
        if GenBatches.Find('-') = false then begin
            GenBatches.Init;
            GenBatches."Journal Template Name" := BATCH_TEMPLATE;
            GenBatches.Name := BATCH_NAME;
            GenBatches.Description := 'ATM Transactions';
            GenBatches.Validate(GenBatches."Journal Template Name");
            GenBatches.Validate(GenBatches.Name);
            GenBatches.Insert;
        end;

        ATMTrans.LockTable;
        ATMTrans.Reset;
        ATMTrans.SetRange(ATMTrans.Posted, false);
        ATMTrans.SetRange(ATMTrans."Reference No", ReferenceNo);
        if ATMTrans.Find('-') then begin
            //REPEAT
            DOCUMENT_NO := ATMTrans."Reference No";
            ATM_CHARGES.Reset;
            ATM_CHARGES.SetRange(ATM_CHARGES."Transaction Type", ATMTrans."Transaction Type Charges");
            if ATM_CHARGES.Find('-') then begin
                BankAccount := ATM_CHARGES."Atm Bank Settlement A/C";
                GLAccount := ATM_CHARGES."Atm Income A/c";
                ExciseGLAcc := ATM_CHARGES."Excise Duty";
            end;

            SaccoGen.Reset;
            SaccoGen.Get;


            if ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::Reversal then begin

            end;

            ATMCharges := 0;
            BankCharges := 0;
            ExciseCharges := SaccoGen."Excise Duty(%)" / 100;

            ATM_CHARGES.Reset;
            ATM_CHARGES.SetRange(ATM_CHARGES."Transaction Type", ATMTrans."Transaction Type Charges");
            if (ATM_CHARGES.Find('-')) then begin
                ATMCharges := ATM_CHARGES."Total Amount";
                BankCharges := ATMCharges - ATM_CHARGES."Sacco Amount";
                ExciseFee := ATMCharges * ExciseCharges;

            end;

            if (ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::"Utility Payment") and (ATMTrans."POS Vendor" = ATMTrans."pos vendor"::"Agent Banking") then begin
                ATM_CHARGES.Reset;
                ATM_CHARGES.SetRange(ATM_CHARGES."Transaction Type", 20);
                if (ATM_CHARGES.Find('-')) then begin
                    ATMCharges := ATM_CHARGES."Total Amount";
                    BankCharges := ATMCharges - ATM_CHARGES."Sacco Amount";
                    ExciseFee := ATMCharges * ExciseCharges;

                end;
            end;

            if (ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::"POS - Cash Withdrawal") and (ATMTrans."POS Vendor" <> ATMTrans."pos vendor"::"Coop Branch POS") then begin
                Pos.Reset;
                Pos.SetFilter(Pos."Lower Limit", '<=%1', ATMTrans.Amount);
                Pos.SetFilter(Pos."Upper Limit", '>=%1', ATMTrans.Amount);
                if Pos.FindFirst then begin
                    ATMCharges := Pos."Charge Amount" * (-1);
                    BankCharges := Pos."Bank charge" * (-1);
                end;
            end;
            //**************************IF REVERSAL, THEN REVERSE THE SIGN*******************************
            if ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::Reversal then begin
                Reversals2.Reset;
                Reversals2.SetRange(Reversals2."Trace ID", ATMTrans."Reversal Trace ID");
                Reversals2.SetRange(Reversals2."Account No", ATMTrans."Account No");
                Reversals2.SetRange(Reversals2.Reversed, false);
                if (Reversals2.Find('-')) then begin

                    DOCUMENT_NO := 'REV-' + ATMTrans."Reference No";
                    ATM_CHARGES.Reset;
                    ATM_CHARGES.SetRange(ATM_CHARGES."Transaction Type", Reversals2."Transaction Type Charges");
                    if (ATM_CHARGES.Find('-')) then begin
                        BankAccount := ATM_CHARGES."Atm Bank Settlement A/C";
                        GLAccount := ATM_CHARGES."Atm Income A/c";
                        ExciseGLAcc := ATM_CHARGES."Excise Duty";
                        ATMCharges := ATM_CHARGES."Total Amount";
                        BankCharges := ATMCharges - ATM_CHARGES."Sacco Amount";
                        ATMCharges := ATMCharges * (-1);
                        BankCharges := BankCharges * (-1);
                        ExciseFee := -(((ATM_CHARGES."Total Amount") - (ATM_CHARGES."Total Amount" - ATM_CHARGES."Sacco Amount")) * ExciseCharges);
                    end;

                    if (Reversals2."Transaction Type Charges" = Reversals2."transaction type charges"::"POS - Cash Withdrawal") and (Reversals2."POS Vendor" <> Reversals2."pos vendor"::"Coop Branch POS") then begin
                        Pos.Reset;
                        Pos.SetFilter(Pos."Lower Limit", '<=%1', ATMTrans.Amount);
                        Pos.SetFilter(Pos."Upper Limit", '>=%1', ATMTrans.Amount);
                        if Pos.FindFirst then begin
                            ATMCharges := Pos."Charge Amount" * (-1);
                            BankCharges := Pos."Bank charge" * (-1);
                        end;
                    end;

                    if (Reversals2."Transaction Type Charges" = Reversals2."transaction type charges"::"Utility Payment") and (Reversals2."POS Vendor" = Reversals2."pos vendor"::"Agent Banking") then begin
                        ATM_CHARGES.Reset;
                        ATM_CHARGES.SetRange(ATM_CHARGES."Transaction Type", 20);
                        if (ATM_CHARGES.Find('-')) then begin
                            ATMCharges := ATM_CHARGES."Total Amount" * (-1);
                            BankCharges := ATMCharges - ATM_CHARGES."Sacco Amount" * (-1);
                            ;

                        end;
                    end;
                    DrNarration := 'REVERSE ' + Format(Reversals2."Transaction Type Charges") + ' ' +
                      Reversals2."Withdrawal Location" +
                      ' - ' + Reversals2."ATM Card No" + ' Acc. ' + Reversals2."Account No";
                    DrVendor := 'REVERSE - ' + Format(Reversals2."Transaction Type Charges") + ' ' +
                      Reversals2."Withdrawal Location" + ' - ' + Reversals2."ATM Card No";

                    DrCharge := 'REVERSE Charge: ' + Format(Reversals2."Transaction Type Charges") + ' - ' + Reversals2."ATM Card No";
                    DrTax := 'REVERSE Tax: ' + Format(Reversals2."Transaction Type Charges") + ' - ' + Reversals2."ATM Card No";
                    CrTax := 'REVERSE Tax: ' + Format(Reversals2."Transaction Type Charges") + ' - ' + Reversals2."ATM Card No" + ' ' + Acct.Name;
                    CrNarration := 'REVERSE Charge: ' + Format(Reversals2."Transaction Type Charges") + ' - ' + Reversals2."ATM Card No" + ' Acc. ' + Reversals2."Account No";

                    //ATMTrans.Amount:=ATMTrans.Amount*-1;
                end;
            end;


            //IF(ATMTrans."Transaction Type Charges">=ATMTrans."Transaction Type Charges"::"POS - Purchase With Cash Back")THEN BEGIN
            //  IF(ATMTrans."Transaction Type Charges"=ATMTrans."Transaction Type Charges"::"POS - Balance Enquiry")THEN
            //    IF(ATMTrans."POS Vendor"=ATMTrans."POS Vendor"::"Coop Branch POS") AND (ATMTrans."Transaction Type Charges"=ATMTrans."Transaction Type Charges"::"POS - Cash Withdrawal") THEN
            //      ATMCharges:=100;//refer to e-mail from coop bank

            //      BankCharges:=ATMCharges-ATM_CHARGES."Sacco Amount";
            // END;


            if (ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::"POS - Cash Withdrawal") and (ATMTrans."POS Vendor" <> ATMTrans."pos vendor"::"Coop Branch POS") then begin
                Pos.Reset;
                Pos.SetFilter(Pos."Lower Limit", '<=%1', ATMTrans.Amount);
                Pos.SetFilter(Pos."Upper Limit", '>=%1', ATMTrans.Amount);
                if Pos.FindFirst then begin
                    ATMCharges := Pos."Charge Amount";
                    BankCharges := Pos."Bank charge";
                end;
            end;


            if Acct.Get(ATMTrans."Account No") then begin

                if (ATMTrans."Transaction Type Charges" <> ATMTrans."transaction type charges"::Reversal) then begin

                    DrNarration := Format(ATMTrans."Transaction Type Charges") + ' ' + ATMTrans."Withdrawal Location"
                                + ' - ' + ATMTrans."ATM Card No" + ' Acc. ' + ATMTrans."Account No";
                    DrVendor := Format(ATMTrans."Transaction Type Charges") + ' ' + ATMTrans."Withdrawal Location"
                            + ' - ' + ATMTrans."ATM Card No";

                    DrCharge := 'Charge: ' + Format(ATMTrans."Transaction Type Charges") + ' - ' + ATMTrans."ATM Card No";
                    DrTax := 'Tax: ' + Format(ATMTrans."Transaction Type Charges") + ' - ' + ATMTrans."ATM Card No";
                    CrTax := 'Tax: ' + Format(ATMTrans."Transaction Type Charges") + ' - ' + ATMTrans."ATM Card No" + ' ' + Acct.Name;
                    CrNarration := 'Charge: ' + Format(ATMTrans."Transaction Type Charges") + ' - ' + ATMTrans."ATM Card No" + ' Acc. ' + ATMTrans."Account No";

                end;



                //-----------------------1. Debit FOSA A/C(Amount Transacted)---------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLineAtm(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::Vendor, ATMTrans."Account No", ATMTrans."Posting Date", ATMTrans.Amount, 'FOSA', '',
                DrVendor, '', ATMTrans."Trace ID");

                //-----------------------2. Credit Bank(Amount Transacted)--------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::"Bank Account", BankAccount, ATMTrans."Posting Date", ATMTrans.Amount * -1, 'FOSA', '', DrNarration, '');
                //-----------------------3. Debit FOSA (Transaction Charge)--------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::Vendor, ATMTrans."Account No", ATMTrans."Posting Date", ATMCharges, 'FOSA', '', DrCharge, '');

                //-----------------------4. Debit FOSA (10% Excise Duty sacco)------------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::Vendor, ATMTrans."Account No", ATMTrans."Posting Date", (ATMCharges) * ExciseCharges, 'FOSA', '', DrTax, '');

                //-----------------------5. Credit Excise G/L(10% Excise Duty)------------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::"G/L Account", ExciseGLAcc, ATMTrans."Posting Date", ((ATMCharges - BankCharges) * -1) * ExciseCharges, 'FOSA', '', CrTax, '');
                //-----------------------5. Credit Excise G/L(10% Excise Duty)------------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::"Bank Account", BankAccount, ATMTrans."Posting Date", ((BankCharges) * -1) * ExciseCharges, 'FOSA', '', CrTax, '');

                //-----------------------6. Credit Bank(Bank Charges)------------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::"Bank Account", BankAccount, ATMTrans."Posting Date", BankCharges * -1, 'FOSA', '', CrNarration, '');
                //-----------------------7. Credit Settlement G/L(Sacco Charges)------------------------------------------------------------------------------------
                LineNo := LineNo + 10000;
                SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                GenJournalLine."account type"::"G/L Account", GLAccount, ATMTrans."Posting Date", (ATMCharges - BankCharges) * -1, 'FOSA', '', CrNarration, '');

                //-----------------------8. Charge  &Earn SMS Fee (From Sacco General Setup)------------------------------------------------------------------------------------
                GenSetUp.Get();
                if ((GenSetUp."SMS Fee Account" <> '') and (GenSetUp."SMS Fee Amount" > 0)) then begin
                    LineNo := LineNo + 10000;
                    SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                    GenJournalLine."account type"::Vendor, ATMTrans."Account No", ATMTrans."Posting Date", GenSetUp."SMS Fee Amount", 'FOSA', '', Format(ATMTrans."Transaction Type Charges") + ' SMS Charge', '');

                    LineNo := LineNo + 10000;
                    SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::" ",
                    GenJournalLine."account type"::"G/L Account", GenSetUp."SMS Fee Account", ATMTrans."Posting Date", GenSetUp."SMS Fee Amount" * -1, 'FOSA', '', Format(ATMTrans."Transaction Type Charges") + ' SMS Charge', '');
                end;

                //Reverse Excise Duty
                if ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::Reversal then begin
                    /*  //CO-OP TRANS
                      VendL.RESET();
                      VendL.SETRANGE(VendL."Vendor No.",ATMTrans."Account No");
                      VendL.SETRANGE(VendL."Document No.",ATMTrans."Reference No");
                      VendL.CALCFIELDS(VendL.Amount);
                      VendL.SETRANGE(VendL.Amount,ExciseFee);

                      IF VendL.FIND('+') THEN BEGIN
                      //--------------------------------------Credit FOSA A/C(Excise Duty)------------------------------------------------------------------------------------
                      LineNo:=LineNo+10000;
                      SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE,BATCH_NAME,DOCUMENT_NO,LineNo,GenJournalLine."Transaction Type"::" ",
                      GenJournalLine."Account Type"::Vendor,ATMTrans."Account No",ATMTrans."Posting Date",(ATMCharges)*ExciseCharges*-1,'FOSA','',FORMAT(ATMTrans."Transaction Type Charges")+' Reverse ExciseDuty','');

                      //--------------------------------------Debit Excise G/L(Excise Duty)------------------------------------------------------------------------------------
                      LineNo:=LineNo+10000;
                      SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE,BATCH_NAME,DOCUMENT_NO,LineNo,GenJournalLine."Transaction Type"::" ",
                      GenJournalLine."Account Type"::"G/L Account",ExciseGLAcc,ATMTrans."Posting Date",(ATMCharges)*ExciseCharges,'FOSA','',FORMAT(ATMTrans."Transaction Type Charges")+' Reverse ExciseDuty On ATM Trans','');
                      END;
                      //VISA TRANS
                      VendL.RESET();
                      VendL.SETRANGE(VendL."Vendor No.",ATMTrans."Account No");
                      VendL.SETRANGE(VendL."Document No.",ATMTrans."Reference No");
                      VendL.CALCFIELDS(VendL.Amount);
                      VendL.SETRANGE(VendL.Amount,4);
                      IF VendL.FIND('+') THEN BEGIN
                      //--------------------------------------Credit FOSA A/C(Excise Duty)------------------------------------------------------------------------------------
                      LineNo:=LineNo+10000;
                      SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE,BATCH_NAME,DOCUMENT_NO,LineNo,GenJournalLine."Transaction Type"::" ",
                      GenJournalLine."Account Type"::Vendor,ATMTrans."Account No",ATMTrans."Posting Date",4*-1,'FOSA','',FORMAT(ATMTrans."Transaction Type Charges")+' Reverse ExciseDuty','');

                      //--------------------------------------Debit Excise G/L(Excise Duty)------------------------------------------------------------------------------------
                      LineNo:=LineNo+10000;
                      SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE,BATCH_NAME,DOCUMENT_NO,LineNo,GenJournalLine."Transaction Type"::" ",
                      GenJournalLine."Account Type"::"G/L Account",ExciseGLAcc,ATMTrans."Posting Date",4,'FOSA','',FORMAT(ATMTrans."Transaction Type Charges")+' Reverse ExciseDuty On ATM Trans','');


                      END;*/
                    ATMTrans.Reversed := true;
                    ATMTrans."Reversed Posted" := true;
                    ATMTrans.Modify;
                end;



                ATMTrans.Posted := true;
                ATMTrans.Modify;
                processed := true;
                time_processed := Dt2Time(CurrentDatetime);
                GenSetUp.Get();
                //-----------------------------Send SMS---------------------------------------------------------------
                if GenSetUp."Send ATM Withdrawal SMS" = true then begin
                    Count := 0;

                    VarLocationlength := StrPos(ATMTrans."Withdrawal Location", '  ');
                    if VarLocationlength > 0 then begin
                        if ATMTrans.Amount > 0 then begin

                            ATMMessages := 'Dear ' + CloudPesa.SplitString(Acct.Name, ' ') + ', Ksh.' + Format(ATMTrans.Amount) + ' Withdrawn from your Acc. ' +
                            ATMTrans."Account No" + ' via ATM at ' + ATMTrans."Withdrawal Location" + ' on ' +
                            Format(CurrentDatetime, 0, '<Day,2> <Month Text,3> <Year4> <Hours24,2>:<Minutes,2>. Kingdom Sacco');
                        end;
                        if ATMTrans.Amount < 0 then begin
                            if ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::Reversal then begin
                                ATMMessages := 'Dear ' + CloudPesa.SplitString(Acct.Name, ' ') + ', Ksh.' + Format(ATMTrans.Amount * -1) + ' Withdrawn from your Acc. ' +
                                ATMTrans."Account No" + ' via ATM at ' + ATMTrans."Withdrawal Location"
                                + ' has Declined and Reversed on ' + Format(CurrentDatetime, 0, '<Day,2> <Month Text,3> <Year4> <Hours24,2>:<Minutes,2>');
                            end else begin
                                ATMMessages := 'Dear ' + CloudPesa.SplitString(Acct.Name, ' ') + ', Ksh.' + Format(ATMTrans.Amount * -1) + ' Deposited to your Acc. ' +
                                ATMTrans."Account No" + ' via ATM at ' + ATMTrans."Withdrawal Location" + ' on ' +
                                Format(CurrentDatetime, 0, '<Day,2> <Month Text,3> <Year4> <Hours24,2>:<Minutes,2>. Kingdom Sacco');
                            end;
                        end;
                    end else begin
                        if ATMTrans.Amount > 0 then begin

                            ATMMessages := 'Dear ' + CloudPesa.SplitString(Acct.Name, ' ') + ', Ksh.' + Format(ATMTrans.Amount) + ' Withdrawn from your Acc. ' +
                            ATMTrans."Account No" + ' via ATM at ' + ATMTrans."Withdrawal Location" + ' on ' +
                            Format(CurrentDatetime, 0, '<Day,2> <Month Text,3> <Year4> <Hours24,2>:<Minutes,2>. Kingdom Sacco');
                        end;
                        if ATMTrans.Amount < 0 then begin
                            if ATMTrans."Transaction Type Charges" = ATMTrans."transaction type charges"::Reversal then begin
                                ATMMessages := 'Dear ' + CloudPesa.SplitString(Acct.Name, ' ') + ', Ksh.' + Format(ATMTrans.Amount * -1) + ' Withdrawn from your Acc. ' +
                                ATMTrans."Account No" + ' via ATM at ' + ATMTrans."Withdrawal Location"
                                + ' has Declined and Reversed on ' + Format(CurrentDatetime, 0, '<Day,2> <Month Text,3> <Year4> <Hours24,2>:<Minutes,2>');
                            end else begin
                                ATMMessages := 'Dear ' + CloudPesa.SplitString(Acct.Name, ' ') + ', Ksh.' + Format(ATMTrans.Amount * -1) + ' Deposited to your Acc. ' +
                                ATMTrans."Account No" + ' via ATM at ' + ATMTrans."Withdrawal Location" + ' on ' +
                                Format(CurrentDatetime, 0, '<Day,2> <Month Text,3> <Year4> <Hours24,2>:<Minutes,2>. Kingdom Sacco');
                            end;
                        end;
                    end;
                    if ATMTrans.Amount <> 0 then begin
                        Members.Reset;
                        Members.SetRange(Members."No.", Acct."BOSA Account No");
                        if Members.Find('-') then begin
                            ProductAppSignatories.Reset;
                            ProductAppSignatories.SetRange(ProductAppSignatories."Account No", ATMTrans."Account No");
                            if ProductAppSignatories.Find('-') then begin
                                repeat
                                    SFactory.FnSendSMS('ATM TRANS', ATMMessages, ATMTrans."Account No", ProductAppSignatories."Mobile Phone No.");
                                until ProductAppSignatories.Next = 0;
                            end else
                                SFactory.FnSendSMS('ATM TRANS', ATMMessages, ATMTrans."Account No", Members."Mobile Phone No");
                        end;
                    end;
                end;
            end else begin
                Error('%1', 'Account No. %1 not found.', ATMTrans."Account No");
            end;

            //NTIL ATMTrans.NEXT = 0;
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", BATCH_TEMPLATE);
            GenJournalLine.SetRange("Journal Batch Name", BATCH_NAME);
            if GenJournalLine.Find('-') then begin
                repeat
                    GLPosting.Run(GenJournalLine);
                until GenJournalLine.Next = 0;
                processed := true;
            end else
                processed := false;
        end;

        exit(processed);

    end;


    procedure fnTotalUnposted() unposted: Integer
    begin
        ATMTrans.LockTable;
        ATMTrans.Reset;
        ATMTrans.SetFilter(ATMTrans.Posted, '%1', false);
        if ATMTrans.Find('-') then begin
            unposted := ATMTrans.Count;
        end;
        exit(unposted);
    end;


    procedure InsertFBAtmCharges(MessageType: Text[50]; AccountID: Code[50]; Mobile: Code[20]; AuthCode: Code[50]; Amount: Decimal; Reference: Code[50]; TerminalID: Code[50]; TerminalLocation: Code[50]; RequestDate: Date; ResponseCode: Code[10]; Posted: Boolean) result: Boolean
    begin

        ATMTrans.Reset;
        ATMTrans.Init;
        ATMTrans."Account No" := AccountID;
        ATMTrans."Trace ID" := AuthCode;
        ATMTrans."Card Acceptor Terminal ID" := TerminalID;
        ATMTrans.Description := TerminalLocation;
        ATMTrans."Posting Date" := Today;
        ATMTrans."Process Code" := AuthCode;
        ATMTrans."Reference No" := Reference;
        if (MessageType = '0420') or (MessageType = '0421') then begin
            ATMTrans."Reversal Trace ID" := AuthCode;
            ATMTrans."Transaction Type Charges" := ATMTrans."transaction type charges"::Reversal;
            ATMTrans."Transaction Type" := 'Cash Withdrawal -Reversal';
            ATMTrans.Description := 'Cash Withdrawal -FB ATM ';
            ATMTrans.Amount := -Amount;
        end else begin
            ATMTrans."Transaction Type Charges" := ATMTrans."transaction type charges"::"Cash Withdrawal - FB ATM";
            ATMTrans."Transaction Type" := 'Cash Withdrawal -FB ATM';
            ATMTrans.Amount := Amount;
            ATMTrans.Description := Format(ATMTrans."transaction type charges"::"Cash Withdrawal - FB ATM");
        end;
        ATMTrans."Mobile Phone No" := Mobile;
        ATMTrans."Transaction Date" := Today;
        ATMTrans."Transaction Description" := TerminalLocation;
        ATMTrans."Withdrawal Location" := TerminalLocation;
        ATMTrans.Source := ATMTrans.Source::MBanking;

        if ATMTrans.Insert = true then begin
            ATMTrans.Reset;
            ATMTrans.SetRange(ATMTrans."Reference No", Reference);
            if ATMTrans.Find('-') then begin
                result := PostTrans(Reference);
            end
            else begin
                result := false;
            end;
        end;

    end;


    procedure fnFBATMCHARGES(atmName: Code[1024]) result: Decimal
    begin
        ATM_CHARGES.Reset;
        //ATM_CHARGES.GET()(ATM_CHARGES."Transaction Type",ATM_CHARGES."Transaction Type"::"Cash Withdrawal - FB ATM");
        if ATM_CHARGES.Get(ATM_CHARGES."transaction type"::"Cash Withdrawal - Coop ATM") then begin
            ATMCharges := ATM_CHARGES."Total Amount";
            BankCharges := ATMCharges - ATM_CHARGES."Sacco Amount";
            ExciseFee := ATM_CHARGES."Total Amount" * 20 / 100;
            result := ATMCharges + ExciseFee;
        end;

    end;


    procedure getAccountBalance(Acc: Code[30]) Bal: Code[1024]
    var
        DateClosed: Code[50];
        SURESTEPFACTORY: Codeunit "SURESTEP Factory";
    begin
        begin
            Vendor.Reset;
            Vendor.SetRange(Vendor."No.", Acc);
            if Vendor.Find('-') then begin
                AccountTypes.Reset;
                AccountTypes.SetRange(AccountTypes.Code, Vendor."Account Type");
                if AccountTypes.Find('-') then begin
                    miniBalance := AccountTypes."Minimum Balance";
                end;
                Vendor.CalcFields(Vendor."Balance (LCY)");
                Vendor.CalcFields(Vendor."ATM Transactions");
                Vendor.CalcFields(Vendor."Uncleared Cheques");
                Vendor.CalcFields(Vendor."EFT Transactions");
                accountBal := SURESTEPFACTORY.FnRunGetAccountAvailableBalance(Vendor."No.");
                // Bal:=Bal-TotalCharges;
                if (Vendor."Account Frozen" = true) then begin
                    acctFrozen := '1';
                end
                else begin
                    acctFrozen := '0';
                end;
                if (Vendor.Status = Vendor.Status::Dormant) then begin
                    DormantAccount := '1';
                end
                else begin
                    DormantAccount := '0';
                end;
                ProdID := Vendor."Account Type";
                closureDate := Vendor."Closure Notice Date";

                if (Format(closureDate) = '') then begin
                    DateClosed := Format(closureDate);
                    //DateClosed:='Null';
                end
                else begin
                    DateClosed := Format(closureDate);
                end;

                Bal := Format(accountBal) + ':::' + acctFrozen + ':::' + DormantAccount + ':::' + ProdID + ':::' + Vendor.Name + ':::' + DateClosed;
            end;
        end;
    end;


    procedure getTransactionsLimit(AccountNo: Code[50]; Amount: Decimal) Limit: Decimal
    var
        DailyLimit: Decimal;
        DefaultLimit: Decimal;
    begin
        Limit := 0;

        GenSetUp.Reset;
        GenSetUp.Get;
        Vendor.Reset;
        Vendor.SetRange(Vendor."No.", AccountNo);
        if Vendor.Find('-') then begin
            ATMTrans.Reset;
            ATMTrans.SetRange(ATMTrans."Account No", AccountNo);
            ATMTrans.SetRange(ATMTrans.Posted, true);
            ATMTrans.SetRange(ATMTrans.Reversed, false);
            ATMTrans.SetRange(ATMTrans."Posting Date", Today);
            ATMTrans.SetRange(ATMTrans."Transaction Type Charges", ATMTrans."transaction type charges"::"Cash Withdrawal - FB ATM");
            ATMTrans.CalcSums(ATMTrans.Amount);
            DailyLimit := ATMTrans.Amount;
            Limit := GenSetUp."FB ATM Withdrawal Limit" - DailyLimit;
        end;
    end;


    procedure FnGetAvailableBalanceATM(AccountNo: Code[50]) balance: Decimal
    var
        SURESTEPFACTORY: Codeunit "SURESTEP Factory";
    begin
        balance := 0;
        Vendor.Reset;
        Vendor.SetRange(Vendor."No.", AccountNo);
        if Vendor.Find('-') then begin
            balance := SURESTEPFACTORY.FnRunGetAccountAvailableBalance(Vendor."No.");
        end;
    end;


    procedure FnGetBookBalanceATM(AccountNo: Code[50]) balance: Decimal
    var
        SURESTEPFACTORY: Codeunit "SURESTEP Factory";
    begin
        balance := 0;
        Vendor.Reset;
        Vendor.SetRange(Vendor."No.", AccountNo);
        if Vendor.Find('-') then begin
            balance := SURESTEPFACTORY.FnRunGetAccountBookBalance(Vendor."No.");
        end;
    end;
}

