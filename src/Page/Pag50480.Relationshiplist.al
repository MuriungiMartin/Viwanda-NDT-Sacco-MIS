#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 50480 "Relationship list"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Relationship Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("code"; code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

