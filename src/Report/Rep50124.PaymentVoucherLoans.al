#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516124_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50124 "Payment Voucher Loans"
{
    RDLCLayout = 'Layouts/PaymentVoucherLoans.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Payments Header"; "Payments Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_6437; 6437) { } // Autogenerated by ForNav - Do not delete
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(DOCNAME; DOCNAME)
            {
            }
            column(Payments_Header__No__; "Payments Header"."No.")
            {
            }
            column(CurrCode; CurrCode)
            {
            }
            column(StrCopyText; StrCopyText)
            {
            }
            column(Payments_Header__Cheque_No__; "Payments Header"."Cheque No.")
            {
            }
            column(Payments_Header_Payee; "Payments Header".Payee)
            {
            }
            column(VarApproverI; VarApproverI)
            {
            }
            column(VarApproverIDate; VarApproverIDate)
            {
            }
            column(VarApproverII; VarApproverII)
            {
            }
            column(Cashier_PaymentsHeader; "Payments Header".Cashier)
            {
            }
            column(VarApproverIIDate; VarApproverIIDate)
            {
            }
            column(PMODE; "Payments Header"."Pay Mode")
            {
            }
            column(Payments_Header__Payments_Header__Date; "Payments Header".Date)
            {
            }
            column(Date_PaymentsHeader; "Payments Header".Date)
            {
            }
            column(Payments_Header__Global_Dimension_1_Code_; "Payments Header"."Global Dimension 1 Code")
            {
            }
            column(Payments_Header__Shortcut_Dimension_2_Code_; "Payments Header"."Global Dimension 2 Code")
            {
            }
            column(UserId; UserId)
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(TTotal; TTotal)
            {
            }
            column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
            }
            column(CurrCode_Control1102756010; CurrCode)
            {
            }
            column(CurrCode_Control1102756012; CurrCode)
            {
            }
            column(Approved_; 'Approved')
            {
                AutoFormatType = 1;
            }
            column(Approval_Status_____; 'Approval Status' + ':')
            {
                AutoFormatType = 1;
            }
            column(TIME_PRINTED_____FORMAT_TIME__Control1102755003; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4__Control1102755004; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
            }
            column(USERID_Control1102755012; UserId)
            {
            }
            column(NumberText_1__Control1102755016; NumberText[1])
            {
            }
            column(TTotal_Control1102755034; TTotal)
            {
            }
            column(Bname; "Payments Header"."Bank Name")
            {
            }
            column(CurrCode_Control1102755035; CurrCode)
            {
            }
            column(CurrCode_Control1102755037; CurrCode)
            {
            }
            column(VATCaption; VATCaptionLbl)
            {
            }
            column(PAYMENT_DETAILSCaption; PAYMENT_DETAILSCaptionLbl)
            {
            }
            column(AMOUNTCaption; AMOUNTCaptionLbl)
            {
            }
            column(NET_AMOUNTCaption; NET_AMOUNTCaptionLbl)
            {
            }
            column(W_TAXCaption; W_TAXCaptionLbl)
            {
            }
            column(Document_No___Caption; Document_No___CaptionLbl)
            {
            }
            column(Currency_Caption; Currency_CaptionLbl)
            {
            }
            column(Payment_To_Caption; Payment_To_CaptionLbl)
            {
            }
            column(Document_Date_Caption; Document_Date_CaptionLbl)
            {
            }
            column(Cheque_No__Caption; Cheque_No__CaptionLbl)
            {
            }
            column(Payments_Header__Global_Dimension_1_Code_Caption; FieldCaption("Global Dimension 1 Code"))
            {
            }
            column(Payments_Header__Shortcut_Dimension_2_Code_Caption; FieldCaption("Global Dimension 2 Code"))
            {
            }
            column(R_CENTERCaption; R_CENTERCaptionLbl)
            {
            }
            column(PROJECTCaption; PROJECTCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Printed_By_Caption; Printed_By_CaptionLbl)
            {
            }
            column(Amount_in_wordsCaption; Amount_in_wordsCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102755013; EmptyStringCaption_Control1102755013Lbl)
            {
            }
            column(Amount_in_wordsCaption_Control1102755021; Amount_in_wordsCaption_Control1102755021Lbl)
            {
            }
            column(Printed_By_Caption_Control1102755026; Printed_By_Caption_Control1102755026Lbl)
            {
            }
            column(TotalCaption_Control1102755033; TotalCaption_Control1102755033Lbl)
            {
            }
            column(Signature_Caption; Signature_CaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Name_Caption; Name_CaptionLbl)
            {
            }
            column(RecipientCaption; RecipientCaptionLbl)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfoPic; CompanyInfo.Picture)
            {
            }
            column(Bank; "Payments Header"."Paying Bank Account")
            {
                IncludeCaption = true;
            }
            column(BankName; "Payments Header"."Bank Account Name")
            {
                IncludeCaption = true;
            }
            column(PayMode; "Payments Header"."Pay Mode")
            {
                IncludeCaption = true;
            }
            column(CreationDocNo_PaymentsHeader; "Payments Header"."No.")
            {
            }
            column(CreationDoc; CreationDoc)
            {
            }
            column(narrations; "Payments Header"."Payment Narration")
            {
            }
            column(InvoiceNumber_PaymentsHeader; "Payments Header"."Invoice Number")
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Applies-to ID" = field("No.");
                column(ReportForNavId_8; 8) { } // Autogenerated by ForNav - Do not delete
                column(DocNo; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(Amt; "Vendor Ledger Entry"."Amount (LCY)")
                {
                }
                trigger OnAfterGetRecord();
                begin
                    "Vendor Ledger Entry"."Amount (LCY)" := -("Vendor Ledger Entry"."Amount (LCY)")
                end;

            }
            dataitem("Payment Line"; "Payment Line")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting("Line No.", No, Type) order(ascending);
                column(ReportForNavId_3474; 3474) { } // Autogenerated by ForNav - Do not delete
                column(Payment_Line__Net_Amount__; "Payment Line"."Net Amount")
                {
                }
                column(Payment_Line_Amount; "Payment Line".Amount)
                {
                }
                column(Transaction_Name_______Account_No________Account_Name_____; "Transaction Name" + '[' + "Account No." + ':' + "Account Name" + ']')
                {
                }
                column(AccountNo_PaymentLine; "Payment Line"."Account No.")
                {
                }
                column(AccountName_PaymentLine; "Payment Line"."Account Name")
                {
                }
                column(Payment_remarks; "Payment Line".Remarks)
                {
                }
                column(Payment_Line__Withholding_Tax_Amount_; "Payment Line"."Withholding Tax Amount")
                {
                }
                column(Payment_Line__VAT_Amount_; "Payment Line"."VAT Amount")
                {
                }
                column(Payment_Line__Global_Dimension_1_Code_; "Payment Line"."Global Dimension 1 Code")
                {
                }
                column(Payment_Line__Shortcut_Dimension_2_Code_; "Payment Line"."Shortcut Dimension 2 Code")
                {
                }
                column(Payment_Line_Line_No_; "Payment Line"."Line No.")
                {
                }
                column(Payment_Line_No; "Payment Line".No)
                {
                }
                column(Payment_Line_Type; "Payment Line".Type)
                {
                }
                column(InvNum; InvNo)
                {
                }
                column(InvAmt; InvAmt)
                {
                }
                column(TTotal2; TTotal)
                {
                }
                trigger OnAfterGetRecord();
                begin
                    DimVal.Reset;
                    DimVal.SetRange(DimVal."Dimension Code", 'DEPARTMENT');
                    DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
                    DimValName := '';
                    if DimVal.FindFirst then begin
                        DimValName := DimVal.Name;
                    end;
                    TTotal := TTotal + "Net Amount";
                    //IF "Payment Line".COUNT>1 THEN CurrReport.SKIP;
                end;

            }
            dataitem(Total; Integer)
            {
                DataItemTableView = sorting(Number) order(ascending) where(Number = const(1));
                column(ReportForNavId_3476; 3476) { } // Autogenerated by ForNav - Do not delete
                trigger OnAfterGetRecord();
                begin
                    /*CheckReport.InitTextVariable();
					CheckReport.FormatNoText(NumberText,TTotal,'');*/

                end;

            }
            dataitem(Summary; "Supervisors Approval Levels")
            {
                DataItemLink = "Supervisor ID" = field("No.");
                column(ReportForNavId_3570; 3570) { } // Autogenerated by ForNav - Do not delete
                trigger OnAfterGetRecord();
                begin
                    DimVal.Reset;
                    DimVal.SetRange(DimVal."Dimension Code", 'Branch');
                    //DimVal.SETRANGE(DimVal.Code,"Global Dimension 2 Code");
                    DimValName := '';
                    if DimVal.FindFirst then begin
                        DimValName := DimVal.Name;
                    end;
                    //Hazina STotal:=STotal + "Amount";
                end;

            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number) order(ascending) where(Number = const(1));
                column(ReportForNavId_5444; 5444) { } // Autogenerated by ForNav - Do not delete
            }
            dataitem("CshMgt Application"; "CshMgt Application")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Line Number") order(ascending) where("Document Type" = const(PV));
                column(ReportForNavId_1937; 1937) { } // Autogenerated by ForNav - Do not delete
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Status = const(Approved));
                column(ReportForNavId_1000000014; 1000000014) { } // Autogenerated by ForNav - Do not delete
                column(SequenceNo_ApprovalEntry; "Approval Entry"."Sequence No.")
                {
                }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified")
                {
                }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID")
                {
                }
                column(SenderID_ApprovalEntry; "Approval Entry"."Sender ID")
                {
                }
            }
            dataitem(CreationApprovalEntry; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Status = const(Approved));
                column(ReportForNavId_1000000025; 1000000025) { } // Autogenerated by ForNav - Do not delete
                column(SequenceNo_CreationApprovalEntry; CreationApprovalEntry."Sequence No.")
                {
                }
                column(SenderID_CreationApprovalEntry; CreationApprovalEntry."Sender ID")
                {
                }
                column(ApproverID_CreationApprovalEntry; CreationApprovalEntry."Approver ID")
                {
                }
                column(DateTimeSentforApproval_CreationApprovalEntry; CreationApprovalEntry."Date-Time Sent for Approval")
                {
                }
                column(LastDateTimeModified_CreationApprovalEntry; CreationApprovalEntry."Last Date-Time Modified")
                {
                }
                trigger OnAfterGetRecord();
                begin
                    //message('%1 %2',CreationApprovalEntry."Document No.",CreationApprovalEntry."Approver ID");
                end;

            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("No.");
            end;

            trigger OnAfterGetRecord();
            begin
                /*
				VendEnrty.RESET;
				VendEnrty.SETRANGE(VendEnrty."Applies-to ID","Payments Header"."No.");
				IF VendEnrty.FIND ('-') THEN BEGIN
				REPEAT
				VendEnrty.DocNo:= VendEnrty."Document No.";
				VendEnrty."Applies ID":= VendEnrty."Applies-to ID";
				//VendEnrty.MODIFY;
				UNTIL VendEnrty.NEXT=0;
				END;
				*/
                StrCopyText := '';
                if "No. Printed" >= 1 then begin
                    StrCopyText := 'DUPLICATE';
                end;
                TTotal := 0;
                if "Payment Type" <> "payment type"::"Petty Cash" then
                    DOCNAME := 'PAYMENT VOUCHER'
                else
                    DOCNAME := 'PETTY CASH VOUCHER';
                //Set currcode to Default if blank
                GLSetup.Get();
                if "Currency Code" = '' then begin
                    CurrCode := GLSetup."LCY Code";
                end else
                    CurrCode := "Currency Code";
                //For Inv Curr Code
                if InvoiceCurrCode = '' then begin
                    InvoiceCurrCode := GLSetup."LCY Code";
                end else
                    InvoiceCurrCode := InvoiceCurrCode;
                //End;
                CalcFields("Net Amount", "WithHolding Tax Amount");
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, ("Net Amount" - "WithHolding Tax Amount"), '');
                //CheckReport.FormatNoText(NumberText,("Net Amount" - "WithHolding Tax Amount"),'');
                if "No." = '' then
                    CreationDoc := false
                else
                    CreationDoc := true;
                ObjApprovalEntry.Reset;
                ObjApprovalEntry.SetRange(ObjApprovalEntry."Document No.", "No.");
                ObjApprovalEntry.SetRange(ObjApprovalEntry.Status, ObjApprovalEntry.Status::Approved);
                if ObjApprovalEntry.FindFirst then begin
                    VarApproverI := ObjApprovalEntry."First Modified By User ID";
                    VarApproverIDate := Format(ObjApprovalEntry."First Modified On", 0, '<Day,2> <Month Text,3> <Year4>');
                end;
                ObjApprovalEntry.Reset;
                ObjApprovalEntry.SetRange(ObjApprovalEntry."Document No.", "No.");
                ObjApprovalEntry.SetRange(ObjApprovalEntry.Status, ObjApprovalEntry.Status::Approved);
                if ObjApprovalEntry.FindLast then begin
                    VarApproverII := ObjApprovalEntry."Last Modified By User ID";
                    VarApproverIIDate := Format(ObjApprovalEntry."Last Date-Time Modified", 0, '<Day,2> <Month Text,3> <Year4>');
                    ;
                end;

            end;

            trigger OnPostDataItem();
            begin
                if CurrReport.Preview = false then begin
                    "No. Printed" := "No. Printed" + 1;
                    Modify;
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
        CI.Get();
        CI.CalcFields(CI.Picture);
        ;

    end;

    var
        StrCopyText: Text[30];
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        DimVal: Record "Dimension Value";
        DimValName: Text[30];
        TTotal: Decimal;
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        STotal: Decimal;
        InvoiceCurrCode: Code[10];
        CurrCode: Code[10];
        GLSetup: Record "General Ledger Setup";
        DOCNAME: Text[30];
        VATCaptionLbl: label 'VAT';
        PAYMENT_DETAILSCaptionLbl: label 'PAYMENT DETAILS';
        AMOUNTCaptionLbl: label 'AMOUNT';
        NET_AMOUNTCaptionLbl: label 'AMOUNT';
        W_TAXCaptionLbl: label 'W/TAX';
        Document_No___CaptionLbl: label 'Document No. :';
        Currency_CaptionLbl: label 'Currency:';
        Payment_To_CaptionLbl: label 'Payment To:';
        Document_Date_CaptionLbl: label 'Document Date:';
        Cheque_No__CaptionLbl: label 'Cheque No.:';
        R_CENTERCaptionLbl: label 'R.CENTER CODE';
        PROJECTCaptionLbl: label 'PROJECT CODE';
        TotalCaptionLbl: label 'Total';
        Printed_By_CaptionLbl: label 'Printed By:';
        Amount_in_wordsCaptionLbl: label 'Amount in words';
        EmptyStringCaptionLbl: label '================================================================================================================================================================================================';
        EmptyStringCaption_Control1102755013Lbl: label '================================================================================================================================================================================================';
        Amount_in_wordsCaption_Control1102755021Lbl: label 'Amount in words';
        Printed_By_Caption_Control1102755026Lbl: label 'Printed By:';
        TotalCaption_Control1102755033Lbl: label 'Total';
        Signature_CaptionLbl: label 'Signature:';
        Date_CaptionLbl: label 'Date:';
        Name_CaptionLbl: label 'Name:';
        RecipientCaptionLbl: label 'Recipient';
        CompanyInfo: Record "Company Information";
        BudgetLbl: label 'Budget';
        CreationDoc: Boolean;
        DtldVendEntry: Record "Detailed Vendor Ledg. Entry";
        InvNo: Code[20];
        InvAmt: Decimal;
        ApplyEnt: Record "Vendor Ledger Entry";
        VendEnrty: Record "Vendor Ledger Entry";
        CI: Record "Company Information";
        ObjApprovalEntry: Record "Approval Entry";
        VarApproverI: Code[20];
        VarApproverIDate: Text;
        VarApproverII: Code[20];
        VarApproverIIDate: Text;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516124_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
