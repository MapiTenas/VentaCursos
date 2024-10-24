permissionset 50100 "Course - SUPER"
{
    Caption = 'User permission', Comment = 'ESP="Permisos usuarios"';
    Assignable = true;
    // IncludedPermissionSets = SomePermissionSet; //Puedo asignar algun otro set de permisos a este set. 
    Permissions = tabledata Course = RIMD,
        tabledata "Course Edition" = RIMD,
        tabledata "Courses Setup" = RIMD,
        table Course = X,
        table "Course Edition" = X,
        table "Courses Setup" = X,
        page "Course Card" = X,
        page "Course Editions" = X,
        page "Course Editions FactBox" = X,
        page "Course List" = X,
        page "Courses Setup" = X,
        table "Course Ledger Entry" = X,
        tabledata "Course Ledger Entry" = RMID,
        codeunit "Course Sales Management" = X;
}