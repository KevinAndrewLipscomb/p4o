unit Class_db_role_privilege_map;

interface

uses
  Class_db,
  Class_db_trail,
  system.collections;

const
  CI_PRIVILEGE_ID = 0;
  CI_PRIVILEGE_NAME = 1;
  CI_FIRST_CROSSTAB = 2;

  type
  TClass_db_role_privilege_map = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure Bind
      (
      sort_order: string;
      be_sort_order_descending: boolean;
      target: system.object;
      out crosstab_metadata_rec_arraylist: arraylist
      );
    procedure BindActuals
      (
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
    procedure Save
      (
      privilege_id: string;
      role_id: string;
      be_granted: boolean
      );
  end;

implementation

uses
  Class_db_roles,
  kix,
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_role_privilege_map.Create;
begin
  inherited Create;
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_role_privilege_map.Bind
  (
  sort_order: string;
  be_sort_order_descending: boolean;
  target: system.object;
  out crosstab_metadata_rec_arraylist: arraylist
  );
var
  crosstab_metadata_rec: crosstab_metadata_rec_type;
  crosstab_sql: string;
  dr: mysqldatareader;
  where_clause: string;
begin
  //
  crosstab_metadata_rec.index := 1;  // init to index of last non-dependent column
  crosstab_metadata_rec_arraylist := arraylist.Create;
  crosstab_sql := EMPTY;
  //
  self.Open;
  //
  dr := mysqlcommand.Create('select id,name,soft_hyphenation_text from role where name <> "Member"',connection).ExecuteReader;
  while dr.Read do begin
    crosstab_metadata_rec.index := crosstab_metadata_rec.index + 1;
    crosstab_metadata_rec.id := dr['id'].tostring;
    crosstab_metadata_rec.natural_text := dr['name'].tostring;
    crosstab_metadata_rec.soft_hyphenation_text := dr['soft_hyphenation_text'].tostring;
    crosstab_metadata_rec.sql_name := Safe(crosstab_metadata_rec.natural_text,ECMASCRIPT_WORD);
    crosstab_sql := crosstab_sql
    + COMMA_SPACE
    + 'IFNULL((select 1 from role_privilege_map where role_id = "'
    + dr['id'].tostring
    + '" and privilege_id = privilege.id),0) as ' + crosstab_metadata_rec.sql_name;
    crosstab_metadata_rec_arraylist.Add(crosstab_metadata_rec);
  end;
  dr.Close;
  //
//  if filter = EMPTY then begin
    where_clause := EMPTY;
//  end else begin
//    // where_clause := ' where agency_id = "' + filter + '"';
//  end;
  //
  if be_sort_order_descending then begin
    sort_order := sort_order.Replace('%',' desc');
  end else begin
    sort_order := sort_order.Replace('%',' asc');
  end;
  //
  GridView(target).datasource := mysqlcommand.Create
    (
    'select privilege.id as privilege_id'
    + ' , privilege.name as privilege_name'
    + crosstab_sql
    + ' from privilege'
    +   ' left outer join role_privilege_map on (role_privilege_map.privilege_id=privilege.id)'
    +   ' left outer join role on (role.id=role_privilege_map.role_id)'
    + where_clause
    + ' group by privilege.id'
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
  //
end;

procedure TClass_db_role_privilege_map.BindActuals
  (
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  self.Open;
  GridView(target).datasource := mysqlcommand.Create
    (
    'select role_id'
    + ' , pecking_order as role_pecking_order'
    + ' , role.name as role_name'
    + ' , privilege.name as privilege_name'
    + ' , privilege_id'
    + ' from role_privilege_map'
    +   ' join privilege on (privilege.id=role_privilege_map.privilege_id)'
    +   ' join role on (role.id=role_privilege_map.role_id)'
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
  //
end;

procedure TClass_db_role_privilege_map.Save
  (
  privilege_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  self.Open;
  if be_granted then begin
    mysqlcommand.Create
      (
      db_trail.Saved('insert ignore role_privilege_map set privilege_id = "' + privilege_id + '", role_id = "' + role_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end else begin
    mysqlcommand.Create
      (
      db_trail.Saved('delete from role_privilege_map where privilege_id = "' + privilege_id + '" and role_id = "' + role_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end;
  self.Close;
end;

end.
