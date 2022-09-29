codeunit 50165 "Approval Notifications"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Approvals Mgmt.", 'OnAfterPopulateApprovalEntryArgument', '', false, false)]

    procedure SendMailNotificationToApprover(var ApprovalEntryArgument: Record "Approval Entry")
    begin

        ApprovalEntryArgument.SetFilter(ApprovalEntryArgument.Status, '%1|%2', ApprovalEntryArgument.Status::Open, ApprovalEntryArgument.Status::Created);
        if ApprovalEntryArgument.FindSet() then begin
            repeat
                users.Reset();
                users.SetRange(Users."User Name", ApprovalEntryArgument."Approver ID");
                if Users.Find('-') then begin
                    ObjSmtp.Get();
                    if Sfactory.FnValidateEmailAddress(Users."Contact Email") then begin
                        Recipient.Add(Users."Contact Email");
                        SMTP.CreateMessage((ObjSmtp."Email Sender Name" + ' Approvals'), ObjSmtp."Email Sender Address", Recipient, (Format(ApprovalEntryArgument."Document Type") + ' Approval Request'), StrSubstNo(BodyMessage, Users."Full Name", Format(ApprovalEntryArgument."Document Type"), ApprovalEntryArgument."Sender ID", ApprovalEntryArgument."Document No.", ApprovalEntryArgument."Date-Time Sent for Approval"), true);
                    end;
                end;
            until ApprovalEntryArgument.Next() = 0;
        end;

    end;

    var
        ObjApprovalNotifications: record "Approval Notifications";
        ApprovManagementBase: Codeunit "Approvals Mgmt.";
        ApprovMgmtCustom: codeunit WorkflowIntegration;
        ObjSmtp: record "SMTP Mail Setup";
        SMTP: Codeunit "SMTP Mail";
        Users: record User;
        Recipient: List of [Text];
        Sfactory: Codeunit "SURESTEP Factory";
        BodyMessage: Label 'Dear %1. </br> </br> Kindly login int to the system to approve the %2 approval request from %3, Document No %4 Sent on %5 ';
}