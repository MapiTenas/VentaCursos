codeunit 50100 "Course Sales Management"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignFieldsForNo, '', false, false)]
    local procedure OnAfterAssignFieldsForNo_SalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
        if SalesLine.Type <> SalesLine.Type::Course then
            exit;

        CopyFromCourse(SalesLine, SalesHeader);
    end;

    local procedure CopyFromCourse(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        Res: Record Course;
    begin
        Res.Get(SalesLine."No.");
        Res.TestField("Gen. Prod. Posting Group");
        SalesLine.Description := Res.Name;
        SalesLine."Unit Price" := Res.Price;
        SalesLine."Gen. Prod. Posting Group" := Res."Gen. Prod. Posting Group";
        SalesLine."VAT Prod. Posting Group" := Res."VAT Prod. Posting Group";
        SalesLine."Allow Item Charge Assignment" := false;
        OnAfterAssignResourceValues(SalesLine, Res, SalesHeader);
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterAssignResourceValues(var SalesLine: Record "Sales Line"; Res: Record Course; SalesHeader: Record "Sales Header")
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Option Lookup Buffer", OnBeforeIncludeOption, '', false, false)]
    local procedure "Option Lookup Buffer_OnBeforeIncludeOption"(OptionLookupBuffer: Record "Option Lookup Buffer" temporary; LookupType: Option; Option: Integer; var Handled: Boolean; var Result: Boolean; RecRef: RecordRef)
    begin
        if LookupType <> Enum::"Option Lookup Type"::Sales.AsInteger() then
            exit;
        if Option <> Enum::"Sales Line Type"::Course.AsInteger() then
            exit;
        Handled := true;
        Result := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnPostSalesLineOnBeforePostSalesLine, '', false, false)]
    local procedure "Sales-Post_OnPostSalesLineOnBeforePostSalesLine"(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; GenJnlLineDocNo: Code[20]; GenJnlLineExtDocNo: Code[35]; GenJnlLineDocType: Enum "Gen. Journal Document Type"; SrcCode: Code[10]; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var IsHandled: Boolean; SalesLineACY: Record "Sales Line")
    begin
        if SalesLine.Type <> SalesLine.Type::Course then
            exit;

        PostResJnlLine(SalesHeader, SalesLine);
    end;

    local procedure PostResJnlLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var JobTaskSalesLine: Record "Sales Line")
    var
        ResJnlLine: Record "Res. Journal Line";
        IsHandled: Boolean;
        ShouldExit: Boolean;
    begin
        IsHandled := false;
        OnBeforePostResJnlLine(SalesHeader, SalesLine, JobTaskSalesLine, IsHandled, GenJnlLineDocNo, GenJnlLineExtDocNo, SrcCode, SalesShptHeader, ReturnRcptHeader, ResJnlPostLine);
        if IsHandled then
            exit;

        ShouldExit := SalesLine."Qty. to Invoice" = 0;
        OnPostResJnlLineOnShouldExit(SalesLine, ShouldExit);
        if ShouldExit then
            exit;

        ResJnlLine.Init();
        ResJnlLine.CopyFromSalesHeader(SalesHeader);
        ResJnlLine.CopyDocumentFields(GenJnlLineDocNo, GenJnlLineExtDocNo, SrcCode, SalesHeader."Posting No. Series");
        ResJnlLine.CopyFromSalesLine(SalesLine);
        OnPostResJnlLineOnAfterInit(ResJnlLine, SalesLine);

        ResJnlPostLine.RunWithCheck(ResJnlLine);
        if JobTaskSalesLine."Job Contract Entry No." > 0 then
            PostJobContractLine(SalesHeader, JobTaskSalesLine);

        OnAfterPostResJnlLine(SalesHeader, SalesLine, JobTaskSalesLine, ResJnlLine);
    end;

}