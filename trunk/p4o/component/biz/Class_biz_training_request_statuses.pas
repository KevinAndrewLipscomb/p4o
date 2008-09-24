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
    function IdOf(description: string): string;
    procedure &Set
      (
      code: string;
      description: string
      );
  public
    constructor Create;
  strict private
    db_training_request_statuses: TClass_db_training_request_statuses;
    id_of_needs_training_unit_comments: string;
    id_of_needs_squad_approval: string;
    id_of_needs_unit_approval: string;
    id_of_needs_division_approval: string;
    id_of_needs_assistant_chief_approval: string;
    id_of_needs_graduation: string;
    id_of_needs_payment: string;
    id_of_canceled: string;
  end;

implementation

constructor TClass_biz_training_request_statuses.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_training_request_statuses := TClass_db_training_request_statuses.Create;
  id_of_needs_training_unit_comments := db_training_request_statuses.IdOf('NEEDS_TRAINING_UNIT_COMMENTS');
  id_of_needs_squad_approval := db_training_request_statuses.IdOf('NEEDS_SQUAD_APPROVAL');
  id_of_needs_unit_approval := db_training_request_statuses.IdOf('NEEDS_UNIT_APPROVAL');
  id_of_needs_division_approval := db_training_request_statuses.IdOf('NEEDS_DIVISION_APPROVAL');
  id_of_needs_assistant_chief_approval := db_training_request_statuses.IdOf('NEEDS_ASSISTANT_CHIEF_APPROVAL');
  id_of_needs_graduation := db_training_request_statuses.IdOf('NEEDS_GRADUATION');
  id_of_needs_payment := db_training_request_statuses.IdOf('NEEDS_PAYMENT');
  id_of_canceled := db_training_request_statuses.IdOf('CANCELED');
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

function TClass_biz_training_request_statuses.IdOf(description: string): string;
begin
  if description = 'NEEDS_TRAINING_UNIT_COMMENTS' then begin
    IdOf := id_of_needs_training_unit_comments;
  end else if description = 'NEEDS_SQUAD_APPROVAL' then begin
    IdOf := id_of_needs_squad_approval;
  end else if description = 'NEEDS_UNIT_APPROVAL' then begin
    IdOf := id_of_needs_unit_approval;
  end else if description = 'NEEDS_DIVISION_APPROVAL' then begin
    IdOf := id_of_needs_division_approval;
  end else if description = 'NEEDS_ASSISTANT_CHIEF_APPROVAL' then begin
    IdOf := id_of_needs_assistant_chief_approval;
  end else if description = 'NEEDS_GRADUATION' then begin
    IdOf := id_of_needs_graduation;
  end else if description = 'NEEDS_PAYMENT' then begin
    IdOf := id_of_needs_payment;
  end else if description = 'CANCELED' then begin
    IdOf := id_of_canceled;
  end;
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
