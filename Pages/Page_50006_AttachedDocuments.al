page 50006 "Attached Documents"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = Attachment;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Storage Pointer"; Rec."Storage Pointer")
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open File")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBLOB: Codeunit "Temp Blob";
                    Attachment: Record Attachment;
                    FileName: Text;
                    FileMgt: Codeunit "File Management";
                begin
                    Attachment.Get(Rec."No.");
                    Attachment.CalcFields("Attachment File");
                    if Attachment."Attachment File".HasValue then
                        TempBLOB.FromRecord(Attachment, Attachment.FieldNo("Attachment File"));
                    FileName := Rec."Storage Pointer";
                    FileName := FileMgt.GetFileNameWithoutExtension(FileName);  // Description may have extension. (on file upload, filename goes to Description field)
                    FileName := FileName + '.' + Attachment."File Extension";
                    FileMgt.BLOBExport(TempBLOB, FileName, true); //MG200805

                end;
            }
        }
    }
}