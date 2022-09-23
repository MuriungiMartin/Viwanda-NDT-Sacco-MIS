#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516019_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50019 "Cashier Report"
{
    Caption = 'Bank Acc. - Detail Trial Bal.';
    RDLCLayout = 'Layouts/CashierReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Bank Acc. Posting Group", "Date Filter";
            column(ReportForNavId_4558; 4558) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_BankAccDateFilter_; StrSubstNo(Text000, BankAccDateFilter))
            {
            }

            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(UserId; UserId)
            {
            }
            column(STRSUBSTNO___1___2___Bank_Account__TABLECAPTION_BankAccFilter_; StrSubstNo('%1: %2', "Bank Account".TableCaption, BankAccFilter))
            {
            }
            column(Bank_Account__No__; "Bank Account"."No.")
            {
            }
            column(Bank_Account_Name; "Bank Account".Name)
            {
            }
            column(Bank_Account__Currency_Code_; "Bank Account"."Currency Code")
            {
            }
            column(StartBalance; StartBalance)
            {
                AutoFormatExpression = "Bank Account Ledger Entry"."Currency Code";
                AutoFormatType = 1;
            }
            column(Cashier_ReportCaption; Cashier_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry__Posting_Date_Caption; "Bank Account Ledger Entry".FieldCaption("Posting Date"))
            {
            }
            column(Bank_Account_Ledger_Entry__Document_No__Caption; "Bank Account Ledger Entry".FieldCaption("Document No."))
            {
            }
            column(Bank_Account_Ledger_Entry_DescriptionCaption; "Bank Account Ledger Entry".FieldCaption(Description))
            {
            }
            column(BankAccBalance_StartBalance_tellerIssuesCaption; BankAccBalance_StartBalance_tellerIssuesCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry__Entry_No__Caption; "Bank Account Ledger Entry".FieldCaption("Entry No."))
            {
            }
            column(Account_NameCaption; Account_NameCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry__Debit_Amount_Caption; "Bank Account Ledger Entry".FieldCaption("Debit Amount"))
            {
            }
            column(Bank_Account_Ledger_Entry__Credit_Amount_Caption; "Bank Account Ledger Entry".FieldCaption("Credit Amount"))
            {
            }
            column(Account_No_Caption; Account_No_CaptionLbl)
            {
            }
            column(Bank_Account__Currency_Code_Caption; FieldCaption("Currency Code"))
            {
            }
            column(Teller__Sign_Date_Caption; Teller__Sign_Date_CaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Accountant_Manager__Sign_Date_Caption; Accountant_Manager__Sign_Date_CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102760026; EmptyStringCaption_Control1102760026Lbl)
            {
            }
            column(Bank_Account_Date_Filter; "Bank Account"."Date Filter")
            {
            }
            column(Bank_Account_Global_Dimension_2_Filter; "Bank Account"."Global Dimension 2 Filter")
            {
            }
            column(Bank_Account_Global_Dimension_1_Filter; "Bank Account"."Global Dimension 1 Filter")
            {
            }
            column(Balance_At_date; "Bank Account"."Balance at Date (LCY)")
            {
            }
            column(Bank_Account_Cashier_ID; CashierID)
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter");
                DataItemTableView = sorting("Bank Account No.", "Posting Date");
                column(ReportForNavId_4920; 4920) { } // Autogenerated by ForNav - Do not delete
                column(StartBalance____Bank_Account_Ledger_Entry__Amount; StartBalance + "Bank Account Ledger Entry".Amount)
                {
                    AutoFormatExpression = "Bank Account Ledger Entry"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Bank_Account_Ledger_Entry__Posting_Date_; "Bank Account Ledger Entry"."Posting Date")
                {
                }
                column(Bank_Account_Ledger_Entry__Document_No__; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(Bank_Account_Ledger_Entry_Description; "Bank Account Ledger Entry".Description)
                {
                }
                column(BankAccBalance_StartBalance_tellerIssues; BankAccBalance + StartBalance + tellerIssues)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Bank_Account_Ledger_Entry__Entry_No__; "Bank Account Ledger Entry"."Entry No.")
                {
                }
                column(Bank_Account_Ledger_Entry_Amount; "Bank Account Ledger Entry".Amount)
                {
                }
                column(Names_Control1102760001; Names)
                {
                }
                column(Bank_Account_Ledger_Entry__Debit_Amount_; "Bank Account Ledger Entry"."Debit Amount")
                {
                }
                column(Bank_Account_Ledger_Entry__Credit_Amount_; "Bank Account Ledger Entry"."Credit Amount")
                {
                }
                column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Bal__Account_No__; "Bank Account Ledger Entry"."Bal. Account No.")
                {
                }
                column(StartBalance____Bank_Account_Ledger_Entry__Amount_Control47; StartBalance + "Bank Account Ledger Entry".Amount)
                {
                    AutoFormatExpression = "Bank Account Ledger Entry"."Currency Code";
                    AutoFormatType = 1;
                }
                column(ContinuedCaption; ContinuedCaptionLbl)
                {
                }
                column(ContinuedCaption_Control46; ContinuedCaption_Control46Lbl)
                {
                }
                column(Bank_Account_Ledger_Entry_Bank_Account_No_; "Bank Account Ledger Entry"."Bank Account No.")
                {
                }
                column(Bank_Account_Ledger_Entry_Global_Dimension_2_Code; "Bank Account Ledger Entry"."Global Dimension 2 Code")
                {
                }
                column(Bank_Account_Ledger_Entry_Global_Dimension_1_Code; "Bank Account Ledger Entry"."Global Dimension 1 Code")
                {
                }
                column(SN; SN)
                {
                }
                column(Users; "Bank Account Ledger Entry"."User ID")
                {
                }
                trigger OnPreDataItem();
                begin
                    BankAccLedgEntryExists := false;

                end;

                trigger OnAfterGetRecord();
                begin
                    if not PrintReversedEntries and Reversed then
                        CurrReport.Skip;
                    BankAccLedgEntryExists := true;
                    BankAccBalance := BankAccBalance + Amount;
                    BankAccBalanceLCY := BankAccBalanceLCY + "Amount (LCY)";
                    Names := '';
                    if "Bank Account Ledger Entry"."Bal. Account Type" = "Bank Account Ledger Entry"."bal. account type"::Customer then begin
                        if Cust.Get("Bank Account Ledger Entry"."Bal. Account No.") then
                            Names := Cust.Name;
                    end else
                        if "Bank Account Ledger Entry"."Bal. Account Type" = "Bank Account Ledger Entry"."bal. account type"::Vendor then begin
                            if Vend.Get("Bank Account Ledger Entry"."Bal. Account No.") then
                                Names := Vend.Name;
                        end
                        else
                            if "Bank Account Ledger Entry"."Bal. Account Type" = "Bank Account Ledger Entry"."bal. account type"::"Bank Account" then begin
                                if Bank.Get("Bank Account Ledger Entry"."Bal. Account No.") then
                                    Names := Bank.Name;
                            end;
                    TCredit := TCredit + "Bank Account Ledger Entry"."Credit Amount";
                    TDebit := TDebit + "Bank Account Ledger Entry"."Debit Amount";
                    SN := SN + 1;
                end;

            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(ReportForNavId_5444; 5444) { } // Autogenerated by ForNav - Do not delete
                column(Bank_Account__Name; "Bank Account".Name)
                {
                }
                column(Bank_Account_Ledger_Entry__Amount; "Bank Account Ledger Entry".Amount)
                {
                }
                column(StartBalance____Bank_Account_Ledger_Entry__Amount_tellerIssues; StartBalance + "Bank Account Ledger Entry".Amount + tellerIssues)
                {
                    AutoFormatExpression = "Bank Account Ledger Entry"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TDebit; TDebit)
                {
                }
                column(TCredit; TCredit)
                {
                }
                column(Integer_Number; Integer.Number)
                {
                }
                trigger OnAfterGetRecord();
                begin
                    if not BankAccLedgEntryExists and ((StartBalance = 0) or ExcludeBalanceOnly) then begin
                        StartBalanceLCY := 0;
                        CurrReport.Skip;
                    end;
                end;

            }
            dataitem(Transactions; Transactions)
            {
                DataItemLink = "Transaction Date" = field("Date Filter"), Cashier = field(CashierID);
                DataItemTableView = sorting(No) where(Type = const('Cheque Deposit'), Posted = const(true), Reversed = filter(false));
                column(ReportForNavId_5806; 5806) { } // Autogenerated by ForNav - Do not delete
                column(Transactions_No; Transactions.No)
                {
                }
                column(Transactions__Account_No_; Transactions."Account No")
                {
                }
                column(Transactions__Account_Name_; Transactions."Account Name")
                {
                }
                column(Transactions__Cheque_Type_; Transactions."Cheque Type")
                {
                }
                column(Transactions__Cheque_No_; Transactions."Cheque No")
                {
                }
                column(Transactions__Cheque_Date_; Transactions."Cheque Date")
                {
                }
                column(Transactions_Amount; Transactions.Amount)
                {
                }
                column(Transactions__Expected_Maturity_Date_; Transactions."Expected Maturity Date")
                {
                }
                column(Transactions_Amount_Control1102755015; Transactions.Amount)
                {
                }
                column(Transactions__Cheque_Date_Caption; FieldCaption("Cheque Date"))
                {
                }
                column(Transactions__Cheque_No_Caption; FieldCaption("Cheque No"))
                {
                }
                column(Transactions__Cheque_Type_Caption; FieldCaption("Cheque Type"))
                {
                }
                column(Transactions__Account_Name_Caption; FieldCaption("Account Name"))
                {
                }
                column(Transactions__Account_No_Caption; FieldCaption("Account No"))
                {
                }
                column(Transactions_NoCaption; FieldCaption(No))
                {
                }
                column(CHEQUE_DEPOSITSCaption; CHEQUE_DEPOSITSCaptionLbl)
                {
                }
                column(Transactions_AmountCaption; FieldCaption(Amount))
                {
                }
                column(Maturity_DateCaption; Maturity_DateCaptionLbl)
                {
                }
                column(Total_Cheque_DepositsCaption; Total_Cheque_DepositsCaptionLbl)
                {
                }
                column(Transactions_Transaction_Date; Transactions."Transaction Date")
                {
                }
                column(Transactions_Cashier; Transactions.Cashier)
                {
                }
                column(Reversed_Transactions; Transactions.Reversed)
                {
                }
                column(TotalCheques; TotalCheques)
                {
                }
            }
            trigger OnPreDataItem();
            begin
                //('BankAccount').NewPagePerRecord := PrintOnlyOnePerPage;

                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                StartBalance := 0;
                TCredit := 0;
                TDebit := 0;
                if BankAccDateFilter <> '' then
                    if GetRangeMin("Date Filter") <> 0D then begin
                        SetRange("Date Filter", 0D, GetRangeMin("Date Filter") - 1);
                        CalcFields("Net Change", "Net Change (LCY)");
                        StartBalance := "Net Change";
                        StartBalanceLCY := "Net Change (LCY)";
                        SetFilter("Date Filter", BankAccDateFilter);
                    end;
                //('BankAccount').PrintOnlyIfDetail := ExcludeBalanceOnly or (StartBalance = 0);
                BankAccBalance := StartBalance;
                BankAccBalanceLCY := StartBalanceLCY;
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
        BankAccFilter := "Bank Account".GetFilters;
        BankAccDateFilter := "Bank Account".GetFilter("Date Filter");
        ;

    end;

    var
        Text000: label 'Period: %1';
        PrintOnlyOnePerPage: Boolean;
        ExcludeBalanceOnly: Boolean;
        BankAccFilter: Text[250];
        BankAccDateFilter: Text[30];
        BankAccBalance: Decimal;
        BankAccBalanceLCY: Decimal;
        StartBalance: Decimal;
        StartBalanceLCY: Decimal;
        BankAccLedgEntryExists: Boolean;
        PrintReversedEntries: Boolean;
        Cust: Record Customer;
        Bank: Record "Bank Account";
        Vend: Record Vendor;
        Names: Text[50];
        TCredit: Decimal;
        TDebit: Decimal;
        CompanyInfo: Record "Company Information";
        tellerIssues: Decimal;
        IssueAmount: Decimal;
        Cashier_ReportCaptionLbl: label 'Cashier Report';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        BankAccBalance_StartBalance_tellerIssuesCaptionLbl: label 'Balance';
        Account_NameCaptionLbl: label 'Account Name';
        Account_No_CaptionLbl: label 'Account No.';
        Teller__Sign_Date_CaptionLbl: label 'Teller (Sign/Date)';
        EmptyStringCaptionLbl: label '.....................................................................';
        Accountant_Manager__Sign_Date_CaptionLbl: label 'Accountant/Manager (Sign/Date)';
        EmptyStringCaption_Control1102760026Lbl: label '.....................................................................';
        Teller_IssuesCaptionLbl: label 'Teller Issues';
        Total_Teller_IssuesCaptionLbl: label 'Total Teller Issues';
        ContinuedCaptionLbl: label 'Continued';
        ContinuedCaption_Control46Lbl: label 'Continued';
        CHEQUE_DEPOSITSCaptionLbl: label 'CHEQUE DEPOSITS';
        Maturity_DateCaptionLbl: label 'Maturity Date';
        Total_Cheque_DepositsCaptionLbl: label 'Total Cheque Deposits';
        SN: Integer;
        TotalCheques: Decimal;
        Trans: Record Transactions;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516019_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
