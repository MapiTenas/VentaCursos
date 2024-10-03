table 50100 Course
{

    CaptionML = ENU = 'Course', ESP = 'Curso';

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.', ESP = 'Nº';
        }
        field(2; Name; Text[100])
        {
            CaptionML = ENU = 'Name', ESP = 'Nombre';
        }
        field(3; "Content Description"; Text[2048])
        {
            CaptionML = ENU = 'Content Description', ESP = 'Temario';
        }
        field(4; "Duration (hours)"; Integer)
        {
            CaptionML = ENU = 'Duration (hours)', ESP = 'Duracion (horas)';
        }
        field(5; Price; Decimal)
        {
            CaptionML = ENU = 'Price', ESP = 'Price';
        }
        field(6; "Language Code"; Code[10])
        {
            CaptionML = ENU = 'Language', ESP = 'Lenguaje';
            TableRelation = Language; //Asi relacionamos la tabla de idiomas 
        }
        field(7; "Type (Option)"; Option)
        {
            CaptionML = ENU = 'Type (Option)', ESP = 'Tipo (Opcion)';
            OptionMembers = " ","Instructor-Lead","Video Tutorial";
            OptionCaptionML = ENU = ' ,Instructor-Lead,Video tutorial', ESP = ' ,Con profesor,Video tutorial';
        }
        field(8; Type; Enum "Course Type")
        {
            CaptionML = ENU = 'Course Type', ESP = 'Tipo';

        }

    }

}