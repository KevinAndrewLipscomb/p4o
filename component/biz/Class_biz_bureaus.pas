unit Class_biz_bureaus;

interface

uses
  Class_db_bureaus,
  kix;

type
  TClass_biz_bureaus = class
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
      unselected_literal: string = '-- bureau --';
      selected_value: string = EMPTY
      );
    function Delete(code: string): boolean;
    function Get
      (
      code: string;
      out description: string
      )
      : boolean;
    procedure &Set
      (
      code: string;
      description: string
      );
  public
    constructor Create;
  strict private
    db_bureaus: TClass_db_bureaus;
  end;

implementation

constructor TClass_biz_bureaus.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_bureaus := TClass_db_bureaus.Create;
end;

function TClass_biz_bureaus.Bind
  (
  partial_code: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_bureaus.Bind(partial_code,target);
end;

procedure TClass_biz_bureaus.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- bureau --';
  selected_value: string = EMPTY
  );
begin
  db_bureaus.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_bureaus.Delete(code: string): boolean;
begin
  Delete := db_bureaus.Delete(code);
end;

function TClass_biz_bureaus.Get
  (
      code: string;
      out description: string
  )
  : boolean;
begin
  //
  Get := db_bureaus.Get
    (
    code,
    description
    );
  //
end;

procedure TClass_biz_bureaus.&Set
  (
      code: string;
      description: string
  );
begin
  //
  db_bureaus.&Set
    (
    code,
    description
    );
  //
end;

end.
