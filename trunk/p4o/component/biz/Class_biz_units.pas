unit Class_biz_units;

interface

uses
  Class_db_units,
  kix;

type
  TClass_biz_units = class
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
      unselected_literal: string = '-- Unit --';
      selected_value: string = EMPTY
      );
    function Delete(code: string): boolean;
    function Get
      (
      code: string;
      out description: string;
      out division_id: string
      )
      : boolean;
    procedure &Set
      (
      code: string;
      description: string;
      division_id: string
      );
  public
    constructor Create;
  strict private
    db_units: TClass_db_units;
  end;

implementation

constructor TClass_biz_units.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_units := TClass_db_units.Create;
end;

function TClass_biz_units.Bind
  (
  partial_code: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_units.Bind(partial_code,target);
end;

procedure TClass_biz_units.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Unit --';
  selected_value: string = EMPTY
  );
begin
  db_units.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_units.Delete(code: string): boolean;
begin
  Delete := db_units.Delete(code);
end;

function TClass_biz_units.Get
  (
  code: string;
  out description: string;
  out division_id: string
  )
  : boolean;
begin
  //
  Get := db_units.Get
    (
    code,
    description,
    division_id
    );
  //
end;

procedure TClass_biz_units.&Set
  (
  code: string;
  description: string;
  division_id: string
  );
begin
  //
  db_units.&Set
    (
    code,
    description,
    division_id
    );
  //
end;

end.
