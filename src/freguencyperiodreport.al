report 50090 frequencyreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;


    dataset
    {
        dataitem("Loan Register"; "Loans Register")
        {
            


            trigger OnAfterGetRecord()
            var
                LoanRec: Record "Loans Register";
            begin
                LoanRec.Reset();
                LoanRec.SetRange(LoanRec."Loan  No.","Loan Register"."Loan  No.");
           //     LoanRec.SetFilter(LoanRec.Posted, '%1', true);

                if LoanRec.Find('-') then begin
                   // repeat

                        LoanRec."Repayment Frequency" := "Loan Register"."Repayment Frequency"::Monthly;
                        LoanRec."Repayment Start Date" := "Loan Register"."Loan Disbursement Date";
                        LoanRec."Approval Status" := "Loan Register"."Approval Status"::Approved;
                        LoanRec."Approved Amount" := "Loan Register"."Requested Amount";
                   // until (LoanRec.Next = 0);
                    LoanRec.Modify();

                end


            end;
        }

    }

}