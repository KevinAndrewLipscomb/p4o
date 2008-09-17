unit Class_biz_members;

interface

uses
  Class_db_members,
  kix;

type
  TClass_biz_members = class
  private
    db_members: TClass_db_members;
  public
    constructor Create;
    function Bind
      (
      partial_registration_code: string;
      target: system.object
      )
      : boolean;
    function BeValidProfile(id: string): boolean;
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
    function UserIdOf(member_id: string): string;
  end;

implementation

constructor TClass_biz_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_members := TClass_db_members.Create;
end;

function TClass_biz_members.BeValidProfile(id: string): boolean;
begin
  BeValidProfile := db_members.BeValidProfile(id);
end;

function TClass_biz_members.Bind
  (
  partial_registration_code: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_members.Bind(partial_registration_code,target);
end;

procedure TClass_biz_members.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Member --';
  selected_value: string = EMPTY
  );
begin
  db_members.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_members.Delete(registration_code: string): boolean;
begin
  Delete := db_members.Delete(registration_code);
end;

function TClass_biz_members.EmailAddressOf(member_id: string): string;
begin
  EmailAddressOf := db_members.EmailAddressOf(member_id);
end;

function TClass_biz_members.FirstNameOfMemberId(member_id: string): string;
begin
  FirstNameOfMemberId := db_members.FirstNameOfMemberId(member_id);
end;

function TClass_biz_members.Get
  (
      out last_name: string;
      out first_name: string;
      out email_address: string;
      registration_code: string;
      out squad_id: string
  )
  : boolean;
begin
  //
  Get := db_members.Get
    (
    last_name,
    first_name,
    email_address,
    registration_code,
    squad_id
    );
  //
end;

function TClass_biz_members.IdOfUserId(user_id: string): string;
begin
  IdOfUserId := db_members.IdOfUserId(user_id);
end;

function TClass_biz_members.LastNameOfMemberId(member_id: string): string;
begin
  LastNameOfMemberId := db_members.LastNameOfMemberId(member_id);
end;

procedure TClass_biz_members.&Set
  (
      last_name: string;
      first_name: string;
      email_address: string;
      registration_code: string;
      squad_id: string
  );
begin
  //
  db_members.&Set
    (
    last_name,
    first_name,
    email_address,
    registration_code,
    squad_id
    );
  //
end;

function TClass_biz_members.UserIdOf(member_id: string): string;
begin
  UserIdOf := db_members.UserIdOf(member_id);
end;

end.
