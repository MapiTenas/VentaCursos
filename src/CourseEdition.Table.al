namespace ClipPlatform.Course.MasterData;
table 50102 "Course Edition"
{
    Caption = 'Course Edition', Comment = 'ESP="Edición curso"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Course No."; Code[20])  //Code20 porque tiene relación con la tabla Course y no quiero que el usuario pueda introducir cualquier cosa. 
        {
            Caption = 'Course No.', Comment = 'ESP="Nº curso"';
            TableRelation = Course;
        }
        field(2; Edition; Code[20])
        {
            Caption = 'Edition', Comment = 'ESP="Edición"';
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date', Comment = 'ESP="Fecha inicio"';
        }
        field(4; "Max. Students"; Integer)
        {
            Caption = 'Max. Students', Comment = 'ESP="Nº máx. alumnos"';
        }
    }

    keys
    {
        key(PK; "Course No.", Edition) //Asi tenemos dos claves primarias, lista de campos separados por comas.
        {
            Clustered = true;
        }
    }
    fieldgroups //para escoger que se muestra en los dropdowns
    {
        fieldgroup(DropDown; Edition, "Start Date", "Max. Students") { }
    }

}