unit Class_biz_role_member_map;

interface

uses
  Class_db_role_member_map,
  Class_biz_notifications,
  Class_biz_user,
  system.collections;

type
  TClass_biz_role_member_map = class
  private
    db_role_member_map: TClass_db_role_member_map;
    biz_notifications: TClass_biz_notifications;
    biz_user: TClass_biz_user;
  public
    constructor Create;
    function BePrivilegedToModifyTuple
      (
      has_config_roles_and_matrices: boolean;
      has_assign_roles_to_members: boolean;
      role_natural_text: string
      )
      : boolean;
    procedure Bind
      (
      sort_order: string;
      be_sort_order_descending: boolean;
      target: system.object;
      out crosstab_metadata: arraylist
      );
    procedure BindActuals
      (
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
    procedure BindHolders
      (
      role_name: string;
      target: system.object;
      sort_order: string;
      be_sort_order_ascending: boolean
      );
    procedure Save
      (
      member_id: string;
      role_id: string;
      be_granted: boolean
      );
  end;

implementation

uses
  kix;

constructor TClass_biz_role_member_map.Create;
begin
  inherited Create;
  db_role_member_map := TClass_db_role_member_map.Create;
  biz_notifications := TClass_biz_notifications.Create;
  biz_user := TClass_biz_user.Create;
end;

function TClass_biz_role_member_map.BePrivilegedToModifyTuple
  (
  has_config_roles_and_matrices: boolean;
  has_assign_roles_to_members: boolean;
  role_natural_text: string
  )
  : boolean;
begin
  BePrivilegedToModifyTuple := has_config_roles_and_matrices
    or ((role_natural_text <> 'Application Administrator') and has_assign_roles_to_members);
end;

procedure TClass_biz_role_member_map.Bind
  (
  sort_order: string;
  be_sort_order_descending: boolean;
  target: system.object;
  out crosstab_metadata: arraylist
  );
begin
  db_role_member_map.Bind
    (
    sort_order,
    be_sort_order_descending,
    target,
    crosstab_metadata
    );
end;

procedure TClass_biz_role_member_map.BindActuals
  (
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  db_role_member_map.BindActuals(sort_order,be_sort_order_ascending,target);
end;

procedure TClass_biz_role_member_map.BindHolders
  (
  role_name: string;
  target: system.object;
  sort_order: string;
  be_sort_order_ascending: boolean
  );
begin
  db_role_member_map.BindHolders(role_name,target,sort_order,be_sort_order_ascending);
end;

procedure TClass_biz_role_member_map.Save
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  db_role_member_map.Save(member_id,role_id,be_granted);
  biz_notifications.IssueForRoleChange(member_id,role_id,be_granted);
end;

end.
