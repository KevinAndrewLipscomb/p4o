unit Class_db_squads;

interface

uses
  Class_db,
  Class_db_trail,
  kix;

type
  TClass_db_squads = class(TClass_db)
  published
    function Bind
      (
      partial_spec: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Squad --';
      selected_value: string = EMPTY
      );
    function Delete(id: string): boolean;
    function Get
      (
      id: string;
      out description: string
      )
      : boolean;
    procedure &Set
      (
      id: string;
      description: string
      );
  public
    constructor Create;
  strict private
    db_trail: TClass_db_trail;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_squads.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_squads.Bind
  (
  partial_spec: string;
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
    'SELECT lpad(id,4,"0") as id'
    + ' , description'
    + ' FROM squad'
    + ' WHERE concat(lpad(id,4,"0")," -- ",description) like "%' + partial_spec + '%"'
    + ' order by description',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add
      (listitem.Create(dr['id'].tostring + SPACE_HYPHENS_SPACE + dr['description'].tostring,dr['id'].tostring));
  end;
  dr.Close;
  self.Close;
  Bind := ListControl(target).items.count > 0;
end;

procedure TClass_db_squads.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Squad --';
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
  dr := mysqlcommand.Create('SELECT id,description FROM squad where description <> "(none specified)" order by id',connection).ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['description'].tostring,dr['id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

function TClass_db_squads.Delete(id: string): boolean;
begin
  //
  Delete := TRUE;
  //
  self.Open;
  try
    mysqlcommand.Create(db_trail.Saved('delete from squad where id = ' + id),connection).ExecuteNonquery;
  except on e: exception do
    if e.message.StartsWith('Cannot delete or update a parent row: a foreign key constraint fails',TRUE,nil) then begin
      Delete := FALSE;
    end else begin
      raise e;
    end;
  end;
  self.Close;
end;

function TClass_db_squads.Get
  (
  id: string;
  out description: string
  )
  : boolean;
var
  dr: mysqldatareader;
begin
  Get := FALSE;
  self.Open;
  dr := mysqlcommand.Create('select description from squad where id = "' + id + '"',connection).ExecuteReader;
  if dr.Read then begin
    //
    description := dr['description'].tostring;
    //
    Get := TRUE;
    //
  end;
  dr.Close;
  self.Close;
end;

procedure TClass_db_squads.&Set
  (
  id: string;
  description: string
  );
var
  childless_field_assignments_clause: string;
begin
  //
  childless_field_assignments_clause := 'description = "' + description + '"';
  //
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'insert squad'
      + ' set id = NULLIF("' + id + '","")'
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

end.
