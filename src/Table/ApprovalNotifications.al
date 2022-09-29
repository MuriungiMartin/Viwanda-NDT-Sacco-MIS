table 50996 "Approval Notifications"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Table Caption"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Document Type"; enum "Approval Document Type")
        {

        }
        field(6; "Sender ID"; Code[50])
        { }
        field(7; "Sent Date"; DateTime)
        {

        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}