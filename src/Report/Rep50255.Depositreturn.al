#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516255_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50255 "Deposit return"
{
    RDLCLayout = 'Layouts/Depositreturn.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            column(CompanyName; "Company Information".Name)
            {
            }
            column(Count2; Count2)
            {
            }
            column(Balance2; Balance2)
            {
            }
            column(Count3; Count3)
            {
            }
            column(Balance3; Balance3)
            {
            }
            column(Count4; Count4)
            {
            }
            column(Balance4; Balance4)
            {
            }
            column(Count5; Count5)
            {
            }
            column(Balance5; Balance5)
            {
            }
            column(GrandTotalCount; GrandTotalCount)
            {
            }
            column(GrantTotalBalances; GrantTotalBalance)
            {
            }
            column(Count1; Count1)
            {
            }
            column(Balance; Balance)
            {
            }
            column(FinancialYear; FinancialYear)
            {
            }
            column(YearBeginDate; YearBeginDate)
            {
            }
            column(AsAt; AsAt)
            {
            }
            trigger OnAfterGetRecord();
            begin
                DateFilter := '..' + Format(AsAt);
                FinancialYear := Date2dmy(AsAt, 3);
                YearBeginDate := CalcDate('-CY', AsAt);
                MemberRegister.Reset;
                MemberRegister.SetAutocalcFields("Current Shares");
                MemberRegister.SetFilter(MemberRegister."Date Filter", DateFilter);
                if MemberRegister.Find('-') then begin
                    repeat
                        Shares := MemberRegister."Current Shares";
                        if (Shares <> 0) and (Shares <= 50000) then begin
                            Count1 += 1;
                            Balance += MemberRegister."Current Shares";
                        end
                        else
                            if (Shares > 50000.01) and (Shares <= 100000) then begin
                                Count2 += 1;
                                Balance2 += MemberRegister."Current Shares";
                            end else
                                if (Shares > 100000.01) and (Shares <= 300000) then begin
                                    Count3 += 1;
                                    Balance3 += MemberRegister."Current Shares";
                                end else
                                    if (Shares > 300000.01) and (Shares <= 1000000) then begin
                                        Count4 += 1;
                                        Balance4 += MemberRegister."Current Shares";
                                    end else
                                        if (Shares > 1000000) then begin
                                            Count5 += 1;
                                            Balance5 += MemberRegister."Current Shares";
                                        end;
                    //END;
                    until MemberRegister.Next = 0;
                end;
                GrandTotalCount := Count1 + Count2 + Count3 + Count4 + Count5;
                GrantTotalBalance := Balance + Balance2 + Balance3 + Balance4 + Balance5;
                //MESSAGE('%1|%2',GrandTotalCount,GrantTotalBalance);
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
                field(AsAt; AsAt)
                {
                    ApplicationArea = Basic;
                    Caption = 'AsAt';
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
        MemberRegister: Record Customer;
        Shares: Decimal;
        Count1: Integer;
        Balance: Decimal;
        Balance2: Decimal;
        Count2: Integer;
        Count3: Integer;
        Balance3: Decimal;
        Count4: Integer;
        Balance4: Decimal;
        Balance5: Decimal;
        Count5: Integer;
        GrantTotalBalance: Decimal;
        GrandTotalCount: Integer;
        FinancialYear: Integer;
        AsAt: Date;
        YearBeginDate: Date;
        DateFilter: Text;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516255_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
