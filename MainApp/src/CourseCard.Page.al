namespace ClipPlatform.Course.MasterData;
page 50101 "Course Card"
{
    Caption = 'Course Card', Comment = 'ESP="Ficha curso"';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None; //Asi no se indexa en el buscador
    SourceTable = Course; //Origen de los datos 

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'ESP="General"';
                field("No."; Rec."No.")
                {
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Name; Rec.Name) { }
                field(Type; Rec.Type) { }
            }
            part(CourseEditions; "Course Editions Factbox")
            {
                SubPageLink = "Course No." = field("No.");
            }
            group(TrainingDetails)
            {
                Caption = 'Training Details', Comment = 'ESP="Detalles formativos"';
                field("Content Description"; Rec."Content Description") { }
                field("Duration (hours)"; Rec."Duration (hours)") { }
                field("Language Code"; Rec."Language Code") { }

            }
            group(Invoicing)
            {
                Caption = 'Invoicing', Comment = 'ESP="Facturación"';
                field("Price"; Rec.Price) { }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group") { }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group") { }

            }
        }

    }
    actions
    {
        area(Navigation)
        {
            action(Editions)
            {
                Caption = 'Editions', Comment = 'ESP="Ediciones"';
                RunObject = page "Course Editions";
                RunPageLink = "Course No." = field("No.");
                Image = ListPage;
            }
        }
    }

}