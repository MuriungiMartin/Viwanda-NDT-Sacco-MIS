codeunit 50165 "Approval Notifications"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, 454, 'OnAfterInsertEvent', '', false, false)]

    procedure SendMailNotificationToApprover(var Rec: Record "Approval Entry")
    begin
        LastDocumentNo := '';
        Rec.SetFilter(Rec.Status, '%1|%2', Rec.Status::Open, Rec.Status::Created);
        if Rec.FindLast() then begin
            LastDocumentNo := Rec."Document No.";
        end;
        Rec.Reset();
        Rec.SetCurrentKey(rec."Document No.");
        Rec.SetRange(rec."Document No.", LastDocumentNo);
        Rec.SetFilter(Rec.Status, '%1|%2', Rec.Status::Open, Rec.Status::Created);
        if Rec.FindSet() then begin
            repeat
                users.Reset();
                users.SetRange(Users."User Name", Rec."Approver ID");
                if Users.Find('-') then begin
                    ObjSmtp.Get();
                    if Sfactory.FnValidateEmailAddress(Users."Contact Email") then begin
                        Recipient.Add(Users."Contact Email");
                        SMTP.CreateMessage((ObjSmtp."Email Sender Name" + ' Approvals'), ObjSmtp."Email Sender Address", Recipient, (Format(Rec."Document Type") + ' Approval Request'), StrSubstNo(BodyMessage, Users."Full Name", Format(Rec."Document Type"), Rec."Sender ID", Rec."Document No.", Rec."Date-Time Sent for Approval"), true);
                        SMTP.Send();
                        Message('Approver(s) has been notified!');
                    end;
                end;
            until Rec.Next() = 0;
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
        LastDocumentNo: Code[50];
        BodyMessage: Label 'Dear %1. </br> </br> Kindly login int to the system to approve the %2 approval request from %3, Document No %4 Sent on %5 ';
}