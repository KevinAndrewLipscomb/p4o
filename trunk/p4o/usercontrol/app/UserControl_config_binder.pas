unit UserControl_config_binder;

interface

uses
  AjaxControlToolkit,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_config_binder = class(ki_web_ui.usercontrol_class)
  published
    function Fresh: TWebUserControl_config_binder;
  protected
    procedure OnInit(e: System.EventArgs); override;
  strict protected
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    TabContainer_control: AjaxControlToolkit.TabContainer;
    TabPanel_business_objects: AjaxControlToolkit.TabPanel;
    TabPanel_members: AjaxControlToolkit.TabPanel;
    TabPanel_users_and_mappings: AjaxControlToolkit.TabPanel;
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        content_id: string;
        tab_index: cardinal;
        END;
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_config_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabContainer_control_ActiveTabChanged(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration,
  UserControl_business_objects_binder,
  UserControl_member,
  UserControl_roles_and_matrices_binder,
  UserControl_users_and_mapping_binder;

const
  TSSI_ROLES_AND_MATRICES = 0;
  TSSI_USERS_AND_MAPPING = 1;
  TSSI_MEMBERS = 2;
  TSSI_BUSINESS_OBJECTS_BINDER = 3;

procedure TWebUserControl_config_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    TabPanel_business_objects.enabled := Has(string_array(session['privilege_array']),'config-business-objects');
    TabPanel_members.enabled := Has(string_array(session['privilege_array']),'config-members');
    TabPanel_users_and_mappings.enabled := Has(string_array(session['privilege_array']),'config-users');
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_config_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_config_binder.p'] <> nil then begin
    p := p_type(session['UserControl_config_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_PlaceHolder_content']) = 'UserControl_config_binder');
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_ROLES_AND_MATRICES:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_roles_and_matrices_binder(LoadControl('~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx')),
        'UserControl_roles_and_matrices_binder',
        PlaceHolder_content
        );
    TSSI_USERS_AND_MAPPING:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_users_and_mapping_binder(LoadControl('~/usercontrol/app/UserControl_users_and_mapping_binder.ascx')),
        'UserControl_users_and_mapping_binder',
        PlaceHolder_content
        );
    TSSI_MEMBERS:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_member(LoadControl('~/usercontrol/app/UserControl_member.ascx')),
        'UserControl_member',
        PlaceHolder_content
        );
    TSSI_BUSINESS_OBJECTS_BINDER:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_business_objects_binder(LoadControl('~/usercontrol/app/UserControl_business_objects_binder.ascx')),
        'UserControl_business_objects_binder',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_ROLES_AND_MATRICES;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roles_and_matrices_binder(LoadControl('~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx')).Fresh,
      'UserControl_roles_and_matrices_binder',
      PlaceHolder_content
      );
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_config_binder.InitializeComponent;
begin
  Include(Self.TabContainer_control.ActiveTabChanged, Self.TabContainer_control_ActiveTabChanged);
  Include(Self.PreRender, Self.TWebUserControl_config_binder_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_config_binder.TWebUserControl_config_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_config_binder.p',p);
  //
end;

function TWebUserControl_config_binder.Fresh: TWebUserControl_config_binder;
begin
  session.Remove('UserControl_config_binder.p');
  Fresh := self;
end;

procedure TWebUserControl_config_binder.TabContainer_control_ActiveTabChanged(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabContainer_control.activetabindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_ROLES_AND_MATRICES:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roles_and_matrices_binder(LoadControl('~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx')).Fresh,
      'UserControl_roles_and_matrices_binder',
      PlaceHolder_content
      );
  TSSI_USERS_AND_MAPPING:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_users_and_mapping_binder(LoadControl('~/usercontrol/app/UserControl_users_and_mapping_binder.ascx')).Fresh,
      'UserControl_users_and_mapping_binder',
      PlaceHolder_content
      );
  TSSI_MEMBERS:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_member(LoadControl('~/usercontrol/app/UserControl_member.ascx')).Fresh,
      'UserControl_member',
      PlaceHolder_content
      );
  TSSI_BUSINESS_OBJECTS_BINDER:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_business_objects_binder(LoadControl('~/usercontrol/app/UserControl_business_objects_binder.ascx')).Fresh,
      'UserControl_business_objects_binder',
      PlaceHolder_content
      );
  end;
end;

end.
