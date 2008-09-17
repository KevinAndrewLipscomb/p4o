unit Class_db_members;

interface

uses
  Class_db,
  Class_db_trail,
  kix;

type
  TClass_db_members = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    function BeValidProfile(id: string): boolean;
    function Bind
      (
      partial_registration_code: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Member --';
      selected_value: string = EMPTY
      );
    function Delete(registration_code: string): boolean;
    function EmailAddressOf(member_id: string): string;
    function FirstNameOfMemberId(member_id: string): string;
    function Get
      (
      out last_name: string;
      out first_name: string;
      out email_address: string;
      registration_code: string;
      out squad_id: string
      )
      : boolean;
    function IdOfUserId(user_id: string): string;
    function LastNameOfMemberId(member_id: string): string;
    procedure &Set
      (
      last_name: string;
      first_name: string;
      email_address: string;
      registration_code: string;
      squad_id: string
      );
    procedure SetEmailAddress
      (
      id: string;
      email_address: string
      );
    function UserIdOf(member_id: string): string;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.web.ui.HtmlControls,
  system.web.ui.webcontrols;

constructor TClass_db_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_members.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = mysqlCommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

function TClass_db_members.Bind
  (
  partial_registration_code: string;
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
    'SELECT registration_code FROM member WHERE registration_code like "' + partial_registration_code + '%" order by registration_code',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add
      (listitem.Create(dr['registration_code'].tostring,dr['registration_code'].tostring));
  end;
  dr.Close;
  self.Close;
  Bind := ListControl(target).items.count > 0;
end;

procedure TClass_db_members.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Member --';
  selected_value: string = EMPTY
  );
var
  dr: mysqldatareader;
begin
  //
  ListControl(target).items.Clear;
  if unselected_literal <> EMPTY then begin
    ListControl(target).items.Add(listitem.Create(unselected_literal,EMPTY));
  end;
  //
  self.Open;
  dr := mysqlcommand.Create
    (
    'select member.id as member_id'
    + ' , concat(last_name,", ",first_name) as member_designator'
    + ' from member'
    + ' order by member_designator',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['member_designator'].tostring,dr['member_id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

function TClass_db_members.Delete(registration_code: string): boolean;
begin
  //
  Delete := TRUE;
  //
  self.Open;
  try
    mysqlcommand.Create(db_trail.Saved('delete from member where registration_code = ' + registration_code),connection).ExecuteNonquery;
  except on e: exception do
    if e.message.StartsWith('Cannot delete or update a parent row: a foreign key constraint fails',TRUE,nil) then begin
      Delete := FALSE;
    end else begin
      raise e;
    end;
  end;
  self.Close;
end;

function TClass_db_members.EmailAddressOf(member_id: string): string;
var
  email_address_obj: system.object;
begin
  //
  self.Open;
  email_address_obj :=
    mysqlcommand.Create('select email_address from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  if email_address_obj <> nil then begin
    EmailAddressOf := email_address_obj.tostring;
  end else begin
    EmailAddressOf := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.FirstNameOfMemberId(member_id: string): string;
begin
  self.Open;
  FirstNameOfMemberId :=
    mysqlcommand.Create('select first_name from member where id = "' + member_id + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.Get
  (
      out last_name: string;
      out first_name: string;
      out email_address: string;
      registration_code: string;
      out squad_id: string
  )
  : boolean;
var
  dr: mysqldatareader;
begin
  Get := FALSE;
  self.Open;
  dr := mysqlcommand.Create('select * from member where CAST(registration_code AS CHAR) = "' + registration_code + '"',connection).ExecuteReader;
  if dr.Read then begin
    //
    last_name := dr['last_name'].tostring;
    first_name := dr['first_name'].tostring;
    email_address := dr['email_address'].tostring;
    registration_code := dr['registration_code'].tostring;
    squad_id := dr['squad_id'].tostring;
    //
    Get := TRUE;
    //
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_members.IdOfUserId(user_id: string): string;
var
  member_id_obj: system.object;
begin
  self.Open;
  member_id_obj := mysqlcommand.Create('select member_id from user_member_map where user_id = ' + user_id,connection).ExecuteScalar;
  if member_id_obj <> nil then begin
    IdOfUserId := member_id_obj.tostring;
  end else begin
    IdOfUserId := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.LastNameOfMemberId(member_id: string): string;
begin
  self.Open;
  LastNameOfMemberId :=
    mysqlcommand.Create('select last_name from member where id = "' + member_id + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_members.&Set
  (
      last_name: string;
      first_name: string;
      email_address: string;
      registration_code: string;
      squad_id: string
  );
var
  childless_field_assignments_clause: string;
begin
  //
  childless_field_assignments_clause := ' last_name = NULLIF("' + last_name + '","")'
  + ' , first_name = NULLIF("' + first_name + '","")'
  + ' , email_address = NULLIF("' + email_address + '","")'
  + ' , squad_id = NULLIF("' + squad_id + '","")';
  //
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'insert member'
      + ' set registration_code = NULLIF("' + registration_code + '","")'
      + ' , ' + childless_field_assignments_clause
      + ' on duplicate key update '
      + childless_field_assignments_clause
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
  //
end;

procedure TClass_db_members.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE member'
      + ' SET email_address = "' + email_address + '"'
      + ' WHERE id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

function TClass_db_members.UserIdOf(member_id: string): string;
var
  user_id_obj: system.object;
begin
  //
  self.Open;
  user_id_obj := mysqlcommand.Create('select user_id from user_member_map where member_id = ' + member_id,connection).ExecuteScalar;
  if user_id_obj <> nil then begin
    UserIdOf := user_id_obj.tostring;
  end else begin
    UserIdOf := EMPTY;
  end;
  self.Close;
end;

end.
