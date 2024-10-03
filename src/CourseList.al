page 50100 "Course List"
{
    //Propiedades globales
    CaptionML = ENU = 'Courses', ESP = 'Cursos';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl) //¿El bucle?
            {
                //Todos los parametros de la tabla, el rec entiendo que es de Recuperar
                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field("Content Description"; Rec."Content Description") { }
                field("Duration (hours)"; Rec."Duration (hours)") { }
                field("Price"; Rec.Price) { }
                field("Language Code"; Rec."Language Code") { }
                field("Type (Option)"; Rec."Type (Option)") { }
                field(Type; Rec.Type) { }

            }
        }

    }

}