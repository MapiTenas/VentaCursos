page 50102 "Courses Setup"
{
    AccessByPermission = TableData Course = R; //Si el usuario tiene acceso a la tabla de cursos, se le da permiso a esta tabla
    ApplicationArea = Jobs;
    CaptionML = ENU = 'Courses Setup', ESP = 'Config. cursos';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Courses Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                CaptionML = ENU = 'Numbering', ESP = 'Numeración';
                field("Course Nos."; Rec."Course Nos.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number series code you can use to assign numbers to courses.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

//Tabla de configuración, que dará valor al nº de serie de los cursos. 
