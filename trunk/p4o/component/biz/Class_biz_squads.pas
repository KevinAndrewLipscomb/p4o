unit Class_biz_squads;

interface

uses
  Class_db_squads,
  kix;

type
  TClass_biz_squads = class
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
      unselected_literal: string = '-- Squad --';
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
    db_squads: TClass_db_squads;
  end;

implementation

constructor TClass_biz_squads.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_squads := TClass_db_squads.Create;
end;

function TClass_biz_squads.Bind
  (
  partial_code: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_squads.Bind(partial_code,target);
end;

procedure TClass_biz_squads.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Squad --';
  selected_value: string = EMPTY
  );
begin
  db_squads.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_squads.Delete(code: string): boolean;
begin
  Delete := db_squads.Delete(code);
end;

function TClass_biz_squads.Get
  (
      code: string;
      out description: string
  )
  : boolean;
begin
  //
  Get := db_squads.Get
    (
    code,
    description
    );
  //
end;

procedure TClass_biz_squads.&Set
  (
      code: string;
      description: string
  );
begin
  //
  db_squads.&Set
    (
    code,
    description
    );
  //
end;

end.
