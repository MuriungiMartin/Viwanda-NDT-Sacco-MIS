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
                Variant: Variant;
                FirstCharacter: Text;
            begin
                for i := 1 to StrLen("Phone No") do begin
                    if i = 1 then begin
                        Variant := "Phone No"[i];
                        Message(Variant);
                        FirstCharacter := Variant;
                        if FirstCharacter <> '+' then begin
                            if not Character.IsNumber("Phone No"[i]) then begin
                                Error('First Character should be a digit or +.');
                            end;
                        end;
                    end else begin
                        if not Character.IsNumber("Phone No"[i]) then begin
                            Error('Phone Number canot contain letters');
                        end;
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