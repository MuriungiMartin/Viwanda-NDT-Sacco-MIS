#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//50015_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50015 "Delete Records"
{
    RDLCLayout = 'Layouts/DeleteRecords.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            trigger OnPreDataItem();
            begin
                FnRunRecoverRegistrationFee;
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
        ObjGensetup: Record "Sacco General Set-Up";
        GenJournalLine: Record "Gen. Journal Line";
        BATCH_TEMPLATE: Code[30];
        BATCH_NAME: Code[30];
        DOCUMENT_NO: Code[30];
        LineNo: Integer;
        SFactory: Codeunit "SURESTEP Factory";
        VarShareCapVariance: Decimal;
        VarAmountPosted: Decimal;
        VarBenfundVariance: Decimal;
        VarDepositBufferEntryNo: Integer;
        VarMonthlyContribution: Decimal;
        ObjDetailedVendorLedger: Record "Detailed Vendor Ledg. Entry";
        VarLedgerDateFilter: Text;
        VarCurrYearBeginDate: Date;
        VarCurrYear: Integer;
        VarBenfundCurrYearCredits: Decimal;
        ObjMemberIV: Record Customer;
        ObjMemberBenfundHistorical: Record "Member Historical Ledger Entry";
        VarBenfundCurrYearCreditsHistorical: Decimal;

    local procedure FnRunRecoverRegistrationFee()
    var
        VarRegistrationFeeVariance: Integer;
        ObjGensetup: Record "Sacco General Set-Up";
        ObjMember: Record Customer;
        VarTaxonFee: Decimal;
        VarRegistrationFeeSeparate: Decimal;
        VarTaxOnFeeSeprate: Decimal;
        VarMemberNo: Code[30];
    begin
        BATCH_TEMPLATE := 'GENERAL';
        BATCH_NAME := 'DEFAULT';
        ObjGensetup.Get;
        ObjMember.Reset;
        ObjMember.SetFilter(ObjMember."Registration Date", '>%1', ObjGensetup."Go Live Date"); //To Ensure deduction is for New Members Only
        ObjMember.SetFilter(ObjMember."Deposits Account No", '<>%1', '');
        if ObjMember.Find('-') then begin
            repeat
                DOCUMENT_NO := SFactory.FnRunGetNextTransactionDocumentNo;
                ObjMember.CalcFields(ObjMember."Registration Fee Paid", ObjMember."Current Shares");
                if Abs(ObjMember."Registration Fee Paid") < ObjGensetup."BOSA Registration Fee Amount" then begin
                    VarRegistrationFeeVariance := (ObjGensetup."BOSA Registration Fee Amount" - ObjMember."Registration Fee Paid");
                    VarTaxonFee := VarRegistrationFeeVariance * (ObjGensetup."Excise Duty(%)" / 100);
                    if ObjMember."Current Shares" >= (VarRegistrationFeeVariance + VarTaxonFee) then begin
                        VarAmountPosted := VarRegistrationFeeVariance
                    end else
                        VarAmountPosted := ObjMember."Current Shares";
                    VarRegistrationFeeSeparate := VarAmountPosted;
                    VarTaxOnFeeSeprate := VarAmountPosted * (ObjGensetup."Excise Duty(%)" / 100);
                    //=======================================================================================================1. DEBIT MEMBER DEPOSITS A/C
                    LineNo := LineNo + 10000;
                    SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::"Deposit Contribution",
                    GenJournalLine."account type"::Vendor, ObjMember."Deposits Account No", WorkDate, VarRegistrationFeeSeparate, 'BOSA', '',
                    'Registration Fee Paid', '', GenJournalLine."application source"::CBS);
                    //=====================================================================================================2. CREDIT MEMBER REGISTRATION FEE A/C
                    LineNo := LineNo + 10000;
                    SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::"Registration Fee",
                    GenJournalLine."account type"::None, ObjMember."No.", WorkDate, VarRegistrationFeeSeparate * -1, 'BOSA', '',
                    'Registration Fee Paid By- ' + ObjMember."No.", '', GenJournalLine."application source"::CBS);
                    //=======================================================================================================3. DEBIT TAX MEMBER DEPOSITS A/C
                    LineNo := LineNo + 10000;
                    SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::"Deposit Contribution",
                    GenJournalLine."account type"::Vendor, ObjMember."Deposits Account No", WorkDate, VarTaxOnFeeSeprate, 'BOSA', '',
                    'Tax: Registration Fee Paid', '', GenJournalLine."application source"::CBS);
                    //=====================================================================================================4. CREDIT TAX ON FEE A/C
                    LineNo := LineNo + 10000;
                    SFactory.FnCreateGnlJournalLine(BATCH_TEMPLATE, BATCH_NAME, DOCUMENT_NO, LineNo, GenJournalLine."transaction type"::"Registration Fee",
                    GenJournalLine."account type"::"G/L Account", ObjGensetup."Excise Duty Account", WorkDate, VarTaxOnFeeSeprate * -1, 'BOSA', '',
                    'Tax: Registration Fee Paid By- ' + ObjMember."No.", '', GenJournalLine."application source"::CBS);
                    //CU posting
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'GENERAL');
                    GenJournalLine.SetRange("Journal Batch Name", 'DEFAULT');
                    if GenJournalLine.Find('-') then
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Sacco", GenJournalLine);
                end;
            until ObjMember.Next = 0;
        end;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //50015_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
