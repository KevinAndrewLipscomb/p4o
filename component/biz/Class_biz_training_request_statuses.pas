unit Class_biz_training_request_statuses;

interface

uses
  Class_db_training_request_statuses,
  kix;

type
  TClass_biz_training_request_statuses = class
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
      unselected_literal: string = '-- Status --';
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
    db_training_request_statuses: TClass_db_training_request_statuses;
  end;

implementation

constructor TClass_biz_training_request_statuses.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_training_request_statuses := TClass_db_training_request_statuses.Create;
end;

function TClass_biz_training_request_statuses.Bind
  (
  partial_code: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_training_request_statuses.Bind(partial_code,target);
end;

procedure TClass_biz_training_request_statuses.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Status --';
  selected_value: string = EMPTY
  );
begin
  db_training_request_statuses.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_training_request_statuses.Delete(code: string): boolean;
begin
  Delete := db_training_request_statuses.Delete(code);
end;

function TClass_biz_training_request_statuses.Get
  (
      code: string;
      out description: string
  )
  : boolean;
begin
  //
  Get := db_training_request_statuses.Get
    (
    code,
    description
    );
  //
end;

procedure TClass_biz_training_request_statuses.&Set
  (
      code: string;
      description: string
  );
begin
  //
  db_training_request_statuses.&Set
    (
    code,
    description
    );
  //
end;

end.
