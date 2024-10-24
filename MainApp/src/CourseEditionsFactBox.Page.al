page 50103 "Course Editions FactBox"
{
    Caption = 'Course Editions', Comment = 'ESP="Ediciones curso"';
    PageType = ListPart; //Tiene que ser una ListPart para poder usarla en la parte de factboxes
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Course Edition";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Course No."; Rec."Course No.")
                {
                    Visible = false;
                }
                field("Edition"; Rec.Edition) { }
                field("Start Date"; Rec."Start Date") { }
                field("Max. Students"; Rec."Max. Students") { }
            }
        }
    }
}