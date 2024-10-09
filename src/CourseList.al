page 50100 "Course List"
{
    //Propiedades globales
    CaptionML = ENU = 'Courses', ESP = 'Cursos';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;
    Editable = false; //Conseguimos que la lista no sea editable
    CardPageId = "Course Card";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl) //¿El bucle?
            {
                //Todos los parametros de la tabla, el rec entiendo que es de Recuperar
                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field("Duration (hours)"; Rec."Duration (hours)") { }
                field("Language Code"; Rec."Language Code") { }
                field(Type; Rec.Type) { }

            }
        }
        area(FactBoxes)
        {
            part(CourseEditions; "Course Editions")
            {
                SubPageLink = "Course No." = field("No."); //Cojo un campo de la tabla de ediciones y lo relaciono con la tabla de cursos.
            }
        }
    }
}