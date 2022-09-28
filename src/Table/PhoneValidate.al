table 50995 "Phone Validation Buffer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Phone No"; code[30])
        {
            trigger OnValidate()
            var
                Character: DotNet Char;
                i: Integer;
            begin
                for i := 1 to StrLen("Phone No") do begin
                    if Character.IsLetter("Phone No"[i]) then begin
                        Error('Phone Number canot contain letters');
                    end;
                end;
            end;
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