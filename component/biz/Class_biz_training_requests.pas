unit Class_biz_training_requests;

interface

uses
  Class_db_training_requests;

type
  TClass_biz_training_requests = class
  private
    db_training_requests: TClass_db_training_requests;
  public
    constructor Create;
    function Bind
      (
      partial_id: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl(target: system.object);
    function Delete(id: string): boolean;
    function Get
      (
      id: string;
      out nature: string;
      out dates: string;
      out conducting_agency: string;
      out location: string;
      out cost_of_enrollment: string;
      out cost_of_lodging: string;
      out cost_of_meals: string;
      out cost_of_transportation: string;
      out reason: string;
      out disposition_training_timestamp: datetime;
      out disposition_training_member_id: string;
      out disposition_training_funding_source: string;
      out disposition_training_comments: string;
      out disposition_squad_timestamp: datetime;
      out disposition_squad_member_id: string;
      out disposition_squad_be_approved: boolean;
      out disposition_squad_comments: string;
      out disposition_unit_timestamp: datetime;
      out disposition_unit_member_id: string;
      out disposition_unit_be_approved: boolean;
      out disposition_unit_comments: string;
      out disposition_division_timestamp: datetime;
      out disposition_division_member_id: string;
      out disposition_division_be_approved: boolean;
      out disposition_division_comments: string;
      out disposition_assistant_chief_timestamp: datetime;
      out disposition_assistant_chief_member_id: string;
      out disposition_assistant_chief_be_approved: boolean;
      out disposition_assistant_chief_comments: string;
      out payment_timestamp: datetime;
      out payment_member_id: string;
      out payment_be_done: boolean;
      out payment_actual_amount: string;
      out payment_comments: string;
      out status_code: string;
      out finalization_timestamp: datetime;
      out member_id: string;
      out submission_timestamp: datetime
      )
      : boolean;
    procedure &Set
      (
      id: string;
      nature: string;
      dates: string;
      conducting_agency: string;
      location: string;
      cost_of_enrollment: string;
      cost_of_lodging: string;
      cost_of_meals: string;
      cost_of_transportation: string;
      reason: string;
      disposition_training_timestamp: datetime;
      disposition_training_member_id: string;
      disposition_training_funding_source: string;
      disposition_training_comments: string;
      disposition_squad_timestamp: datetime;
      disposition_squad_member_id: string;
      disposition_squad_be_approved: boolean;
      disposition_squad_comments: string;
      disposition_unit_timestamp: datetime;
      disposition_unit_member_id: string;
      disposition_unit_be_approved: boolean;
      disposition_unit_comments: string;
      disposition_division_timestamp: datetime;
      disposition_division_member_id: string;
      disposition_division_be_approved: boolean;
      disposition_division_comments: string;
      disposition_assistant_chief_timestamp: datetime;
      disposition_assistant_chief_member_id: string;
      disposition_assistant_chief_be_approved: boolean;
      disposition_assistant_chief_comments: string;
      payment_timestamp: datetime;
      payment_member_id: string;
      payment_be_done: boolean;
      payment_actual_amount: string;
      payment_comments: string;
      status_code: string;
      finalization_timestamp: datetime;
      member_id: string;
      submission_timestamp: datetime
      );
  end;

implementation

constructor TClass_biz_training_requests.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_training_requests := TClass_db_training_requests.Create;
end;

function TClass_biz_training_requests.Bind
  (
  partial_id: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_training_requests.Bind(partial_id,target);
end;

procedure TClass_biz_training_requests.BindDirectToListControl(target: system.object);
begin
  db_training_requests.BindDirectToListControl(target);
end;

function TClass_biz_training_requests.Delete(id: string): boolean;
begin
  Delete := db_training_requests.Delete(id);
end;

function TClass_biz_training_requests.Get
  (
  id: string;
  out nature: string;
  out dates: string;
  out conducting_agency: string;
  out location: string;
  out cost_of_enrollment: string;
  out cost_of_lodging: string;
  out cost_of_meals: string;
  out cost_of_transportation: string;
  out reason: string;
  out disposition_training_timestamp: datetime;
  out disposition_training_member_id: string;
  out disposition_training_funding_source: string;
  out disposition_training_comments: string;
  out disposition_squad_timestamp: datetime;
  out disposition_squad_member_id: string;
  out disposition_squad_be_approved: boolean;
  out disposition_squad_comments: string;
  out disposition_unit_timestamp: datetime;
  out disposition_unit_member_id: string;
  out disposition_unit_be_approved: boolean;
  out disposition_unit_comments: string;
  out disposition_division_timestamp: datetime;
  out disposition_division_member_id: string;
  out disposition_division_be_approved: boolean;
  out disposition_division_comments: string;
  out disposition_assistant_chief_timestamp: datetime;
  out disposition_assistant_chief_member_id: string;
  out disposition_assistant_chief_be_approved: boolean;
  out disposition_assistant_chief_comments: string;
  out payment_timestamp: datetime;
  out payment_member_id: string;
  out payment_be_done: boolean;
  out payment_actual_amount: string;
  out payment_comments: string;
  out status_code: string;
  out finalization_timestamp: datetime;
  out member_id: string;
  out submission_timestamp: datetime
  )
  : boolean;
begin
  //
  Get := db_training_requests.Get
    (
    id,
    nature,
    dates,
    conducting_agency,
    location,
    cost_of_enrollment,
    cost_of_lodging,
    cost_of_meals,
    cost_of_transportation,
    reason,
    disposition_training_timestamp,
    disposition_training_member_id,
    disposition_training_funding_source,
    disposition_training_comments,
    disposition_squad_timestamp,
    disposition_squad_member_id,
    disposition_squad_be_approved,
    disposition_squad_comments,
    disposition_unit_timestamp,
    disposition_unit_member_id,
    disposition_unit_be_approved,
    disposition_unit_comments,
    disposition_division_timestamp,
    disposition_division_member_id,
    disposition_division_be_approved,
    disposition_division_comments,
    disposition_assistant_chief_timestamp,
    disposition_assistant_chief_member_id,
    disposition_assistant_chief_be_approved,
    disposition_assistant_chief_comments,
    payment_timestamp,
    payment_member_id,
    payment_be_done,
    payment_actual_amount,
    payment_comments,
    status_code,
    finalization_timestamp,
    member_id,
    submission_timestamp
    );
  //
end;

procedure TClass_biz_training_requests.&Set
  (
  id: string;
  nature: string;
  dates: string;
  conducting_agency: string;
  location: string;
  cost_of_enrollment: string;
  cost_of_lodging: string;
  cost_of_meals: string;
  cost_of_transportation: string;
  reason: string;
  disposition_training_timestamp: datetime;
  disposition_training_member_id: string;
  disposition_training_funding_source: string;
  disposition_training_comments: string;
  disposition_squad_timestamp: datetime;
  disposition_squad_member_id: string;
  disposition_squad_be_approved: boolean;
  disposition_squad_comments: string;
  disposition_unit_timestamp: datetime;
  disposition_unit_member_id: string;
  disposition_unit_be_approved: boolean;
  disposition_unit_comments: string;
  disposition_division_timestamp: datetime;
  disposition_division_member_id: string;
  disposition_division_be_approved: boolean;
  disposition_division_comments: string;
  disposition_assistant_chief_timestamp: datetime;
  disposition_assistant_chief_member_id: string;
  disposition_assistant_chief_be_approved: boolean;
  disposition_assistant_chief_comments: string;
  payment_timestamp: datetime;
  payment_member_id: string;
  payment_be_done: boolean;
  payment_actual_amount: string;
  payment_comments: string;
  status_code: string;
  finalization_timestamp: datetime;
  member_id: string;
  submission_timestamp: datetime
  );
begin
  //
  db_training_requests.&Set
    (
    id,
    nature,
    dates,
    conducting_agency,
    location,
    cost_of_enrollment,
    cost_of_lodging,
    cost_of_meals,
    cost_of_transportation,
    reason,
    disposition_training_timestamp,
    disposition_training_member_id,
    disposition_training_funding_source,
    disposition_training_comments,
    disposition_squad_timestamp,
    disposition_squad_member_id,
    disposition_squad_be_approved,
    disposition_squad_comments,
    disposition_unit_timestamp,
    disposition_unit_member_id,
    disposition_unit_be_approved,
    disposition_unit_comments,
    disposition_division_timestamp,
    disposition_division_member_id,
    disposition_division_be_approved,
    disposition_division_comments,
    disposition_assistant_chief_timestamp,
    disposition_assistant_chief_member_id,
    disposition_assistant_chief_be_approved,
    disposition_assistant_chief_comments,
    payment_timestamp,
    payment_member_id,
    payment_be_done,
    payment_actual_amount,
    payment_comments,
    status_code,
    finalization_timestamp,
    member_id,
    submission_timestamp
    );
  //
end;

end.
