#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516439_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50439 "Un Allocated"
{
    RDLCLayout = 'Layouts/UnAllocated.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Member Ledger Entry"; "Member Ledger Entry")
        {
            DataItemTableView = where("Transaction Type" = filter("Loan Insurance Paid"), Amount = filter(<> 0));
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(Description_MemberLedgerEntry; "Member Ledger Entry".Description)
            {
            }
            column(DocumentNo_MemberLedgerEntry; "Member Ledger Entry"."Document No.")
            {
            }
            column(CustomerNo_MemberLedgerEntry; "Member Ledger Entry"."Customer No.")
            {
            }
            column(TransactionType_MemberLedgerEntry; "Member Ledger Entry"."Transaction Type")
            {
            }
            column(Amount_MemberLedgerEntry; "Member Ledger Entry".Amount)
            {
            }
            column(Amounts; memberledger.Amount)
            {
            }
            column(entry; memberledger."Entry No.")
            {
            }
            column(EntryNo_MemberLedgerEntry; "Member Ledger Entry"."Entry No.")
            {
            }
            trigger OnAfterGetRecord();
            begin
                memberledger.Reset;
                memberledger.SetRange(memberledger."Customer No.", "Member Ledger Entry"."Customer No.");
                //memberledger.SETRANGE(memberledger."Transaction Type"
                if memberledger.Find('-') then begin
                    "Member Ledger Entry".Amount := memberledger.Amount;
                end;
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
        memberledger: Record "Member Ledger Entry";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516439_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
