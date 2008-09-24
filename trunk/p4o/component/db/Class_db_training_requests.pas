unit Class_db_training_requests;

interface

uses
  Class_db,
  Class_db_trail,
  Class_db_training_request_statuses;

type
  TClass_db_training_requests = class(TClass_db)
  private
    db_trail: TClass_db_trail;
    db_training_request_statuses: TClass_db_training_request_statuses;
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
    procedure SetNew
      (
      nature: string;
      dates: string;
      conducting_agency: string;
      location: string;
      cost_of_enrollment: string;
      cost_of_lodging: string;
      cost_of_meals: string;
      cost_of_transportation: string;
      reason: string;
      member_id: string
      );
  end;

implementation

uses
  kix,
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_training_requests.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
  db_training_request_statuses := TClass_db_training_request_statuses.Create;
end;

function TClass_db_training_requests.Bind
  (
  partial_id: string;
  target: system.object
  )
  : boolean;
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  //
  dr := mysqlcommand.Create
    (
    'SELECT id FROM training_request WHERE id like "' + partial_id + '%" order by id',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add
      (listitem.Create(dr['id'].tostring,dr['id'].tostring));
  end;
  dr.Close;
  self.Close;
  Bind := ListControl(target).items.count > 0;
end;

procedure TClass_db_training_requests.BindDirectToListControl(target: system.object);
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  //
  dr := mysqlcommand.Create('SELECT id,id FROM training_request order by id',connection).ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add
      (listitem.Create(dr['id'].tostring,dr['id'].tostring));
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_training_requests.Delete(id: string): boolean;
begin
  //
  Delete := TRUE;
  //
  self.Open;
  try
    mysqlcommand.Create(db_trail.Saved('delete from training_request where id = ' + id),connection).ExecuteNonquery;
  except on e: exception do
    if e.message.StartsWith('Cannot delete or update a parent row: a foreign key constraint fails',TRUE,nil) then begin
      Delete := FALSE;
    end else begin
      raise e;
    end;
  end;
  self.Close;
end;

function TClass_db_training_requests.Get
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
var
  dr: mysqldatareader;
  s: string;
begin
  Get := FALSE;
  self.Open;
  dr := mysqlcommand.Create('select * from training_request where CAST(id AS CHAR) = "' + id + '"',connection).ExecuteReader;
  if dr.Read then begin
    //
    id := dr['id'].tostring;
    nature := dr['nature'].tostring;
    dates := dr['dates'].tostring;
    conducting_agency := dr['conducting_agency'].tostring;
    location := dr['location'].tostring;
    cost_of_enrollment := dr['cost_of_enrollment'].tostring;
    cost_of_lodging := dr['cost_of_lodging'].tostring;
    cost_of_meals := dr['cost_of_meals'].tostring;
    cost_of_transportation := dr['cost_of_transportation'].tostring;
    reason := dr['reason'].tostring;
    //
    s := dr['disposition_training_timestamp'].tostring;
    if s <> EMPTY then begin
      disposition_training_timestamp := datetime.Parse(s);
      disposition_training_member_id := dr['disposition_training_member_id'].tostring;
      disposition_training_funding_source := dr['disposition_training_funding_source'].tostring;
      disposition_training_comments := dr['disposition_training_comments'].tostring;
      s := dr['disposition_squad_timestamp'].tostring;
      if s <> EMPTY then begin
        disposition_squad_timestamp := datetime.Parse(s);
        disposition_squad_member_id := dr['disposition_squad_member_id'].tostring;
        disposition_squad_be_approved := (dr['disposition_squad_be_approved'].tostring = '1');
        disposition_squad_comments := dr['disposition_squad_comments'].tostring;
        s := dr['disposition_unit_timestamp'].tostring;
        if s <> EMPTY then begin
          disposition_unit_timestamp := datetime.Parse(s);
          disposition_unit_member_id := dr['disposition_unit_member_id'].tostring;
          disposition_unit_be_approved := (dr['disposition_unit_be_approved'].tostring = '1');
          disposition_unit_comments := dr['disposition_unit_comments'].tostring;
          s := dr['disposition_division_timestamp'].tostring;
          if s <> EMPTY then begin
            disposition_division_timestamp := datetime.Parse(s);
            disposition_division_member_id := dr['disposition_division_member_id'].tostring;
            disposition_division_be_approved := (dr['disposition_division_be_approved'].tostring = '1');
            disposition_division_comments := dr['disposition_division_comments'].tostring;
            s := dr['disposition_assistant_chief_timestamp'].tostring;
            if s <> EMPTY then begin
              disposition_assistant_chief_timestamp := datetime.Parse(s);
              disposition_assistant_chief_member_id := dr['disposition_assistant_chief_member_id'].tostring;
              disposition_assistant_chief_be_approved := (dr['disposition_assistant_chief_be_approved'].tostring = '1');
              disposition_assistant_chief_comments := dr['disposition_assistant_chief_comments'].tostring;
              s := dr['payment_timestamp'].tostring;
              if s <> EMPTY then begin
                payment_timestamp := datetime.Parse(s);
                payment_member_id := dr['payment_member_id'].tostring;
                payment_be_done := (dr['payment_be_done'].tostring = '1');
                payment_actual_amount := dr['payment_actual_amount'].tostring;
                payment_comments := dr['payment_comments'].tostring;
              end;
            end;
          end;
        end;
      end;
    end;
    s := dr['finalization_timestamp'].tostring;
    if s <> EMPTY then begin
      finalization_timestamp := datetime.Parse(s);
    end;
    status_code := dr['status_code'].tostring;
    member_id := dr['member_id'].tostring;
    submission_timestamp := datetime.Parse(dr['submission_timestamp'].tostring);
    //
    Get := TRUE;
    //
  end;
  dr.Close;
  self.Close;
end;

procedure TClass_db_training_requests.&Set
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
//
// If any fields in this table are foreign keys for a subordinate table:
// a. Uncomment the "//1" lines.
// b. Customize the SQL as indicated by {bracketed comments}.
//
//1 var
//1   childless_field_assignments_clause: string;
begin
  //
//1  childless_field_assignments_clause := // {Move childless field assignments here.}
  //
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
//1      'insert training_request'
//1      + ' set // {Move parent field assignments here.}
//1      + ' , ' + childless_field_assignments_clause
//1      + ' on duplicate key update '
//1      + childless_field_assignments_clause
      'replace training_request'
      + ' set id = NULLIF("' + id + '","")'
      + ' , nature = NULLIF("' + nature + '","")'
      + ' , dates = NULLIF("' + dates + '","")'
      + ' , conducting_agency = NULLIF("' + conducting_agency + '","")'
      + ' , location = NULLIF("' + location + '","")'
      + ' , cost_of_enrollment = NULLIF("' + cost_of_enrollment + '","")'
      + ' , cost_of_lodging = NULLIF("' + cost_of_lodging + '","")'
      + ' , cost_of_meals = NULLIF("' + cost_of_meals + '","")'
      + ' , cost_of_transportation = NULLIF("' + cost_of_transportation + '","")'
      + ' , reason = NULLIF("' + reason + '","")'
      + ' , disposition_training_timestamp = "' + disposition_training_timestamp.tostring + '"'
      + ' , disposition_training_member_id = NULLIF("' + disposition_training_member_id + '","")'
      + ' , disposition_training_funding_source = NULLIF("' + disposition_training_funding_source + '","")'
      + ' , disposition_training_comments = NULLIF("' + disposition_training_comments + '","")'
      + ' , disposition_squad_timestamp = "' + disposition_squad_timestamp.tostring + '"'
      + ' , disposition_squad_member_id = NULLIF("' + disposition_squad_member_id + '","")'
      + ' , disposition_squad_be_approved = ' + disposition_squad_be_approved.tostring
      + ' , disposition_squad_comments = NULLIF("' + disposition_squad_comments + '","")'
      + ' , disposition_unit_timestamp = "' + disposition_unit_timestamp.tostring + '"'
      + ' , disposition_unit_member_id = NULLIF("' + disposition_unit_member_id + '","")'
      + ' , disposition_unit_be_approved = ' + disposition_unit_be_approved.tostring
      + ' , disposition_unit_comments = NULLIF("' + disposition_unit_comments + '","")'
      + ' , disposition_division_timestamp = "' + disposition_division_timestamp.tostring + '"'
      + ' , disposition_division_member_id = NULLIF("' + disposition_division_member_id + '","")'
      + ' , disposition_division_be_approved = ' + disposition_division_be_approved.tostring
      + ' , disposition_division_comments = NULLIF("' + disposition_division_comments + '","")'
      + ' , disposition_assistant_chief_timestamp = "' + disposition_assistant_chief_timestamp.tostring + '"'
      + ' , disposition_assistant_chief_member_id = NULLIF("' + disposition_assistant_chief_member_id + '","")'
      + ' , disposition_assistant_chief_be_approved = ' + disposition_assistant_chief_be_approved.tostring
      + ' , disposition_assistant_chief_comments = NULLIF("' + disposition_assistant_chief_comments + '","")'
      + ' , payment_timestamp = "' + payment_timestamp.tostring + '"'
      + ' , payment_member_id = NULLIF("' + payment_member_id + '","")'
      + ' , payment_be_done = ' + payment_be_done.tostring
      + ' , payment_actual_amount = NULLIF("' + payment_actual_amount + '","")'
      + ' , payment_comments = NULLIF("' + payment_comments + '","")'
      + ' , status_code = NULLIF("' + status_code + '","")'
      + ' , finalization_timestamp = "' + finalization_timestamp.tostring + '"'
      + ' , member_id = NULLIF("' + member_id + '","")'
      + ' , submission_timestamp = "' + submission_timestamp.tostring + '"'
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
  //
end;

procedure TClass_db_training_requests.SetNew
  (
  nature: string;
  dates: string;
  conducting_agency: string;
  location: string;
  cost_of_enrollment: string;
  cost_of_lodging: string;
  cost_of_meals: string;
  cost_of_transportation: string;
  reason: string;
  member_id: string
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'insert training_request'
      + ' set nature = NULLIF("' + nature + '","")'
      + ' , dates = NULLIF("' + dates + '","")'
      + ' , conducting_agency = NULLIF("' + conducting_agency + '","")'
      + ' , location = NULLIF("' + location + '","")'
      + ' , cost_of_enrollment = NULLIF("' + cost_of_enrollment + '","")'
      + ' , cost_of_lodging = NULLIF("' + cost_of_lodging + '","")'
      + ' , cost_of_meals = NULLIF("' + cost_of_meals + '","")'
      + ' , cost_of_transportation = NULLIF("' + cost_of_transportation + '","")'
      + ' , reason = NULLIF("' + reason + '","")'
      + ' , status_code = "' + db_training_request_statuses.IdOf('NEEDS_TRAINING_UNIT_COMMENTS') + '"'
      + ' , member_id = NULLIF("' + member_id + '","")'
      + ' , submission_timestamp = NOW()'
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

end.
