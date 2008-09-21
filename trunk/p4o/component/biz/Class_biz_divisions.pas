unit Class_biz_divisions;

interface

uses
  Class_db_divisions,
  kix;

type
  TClass_biz_divisions = class
  published
    function Bind
      (
      partial_code: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Division --';
      selected_value: string = EMPTY
      );
    function Delete(code: string): boolean;
    function Get
      (
      code: string;
      out description: string;
      out bureau_id: string
      )
      : boolean;
    procedure &Set
      (
      code: string;
      description: string;
      bureau_id: string
      );
  public
    constructor Create;
  strict private
    db_divisions: TClass_db_divisions;
  end;

implementation

constructor TClass_biz_divisions.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_divisions := TClass_db_divisions.Create;
end;

function TClass_biz_divisions.Bind
  (
  partial_code: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_divisions.Bind(partial_code,target);
end;

procedure TClass_biz_divisions.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Division --';
  selected_value: string = EMPTY
  );
begin
  db_divisions.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_divisions.Delete(code: string): boolean;
begin
  Delete := db_divisions.Delete(code);
end;

function TClass_biz_divisions.Get
  (
  code: string;
  out description: string;
  out bureau_id: string
  )
  : boolean;
begin
  //
  Get := db_divisions.Get
    (
    code,
    description,
    bureau_id
    );
  //
end;

procedure TClass_biz_divisions.&Set
  (
  code: string;
  description: string;
  bureau_id: string
  );
begin
  //
  db_divisions.&Set
    (
    code,
    description,
    bureau_id
    );
  //
end;

end.
