unit UserControl_current_binder;

interface

uses
  AjaxControlToolkit,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_training_request;

type
  p_type =
    RECORD
    be_loaded: boolean;
    content_id: string;
    tab_index: cardinal;
    END;
  TWebUserControl_current_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_current_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabContainer_control_ActiveTabChanged(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabContainer_control: AjaxControlToolkit.TabContainer;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    UserControl_training_request_control: TWebUserControl_training_request;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_current_binder;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

const
  TSSI_TIME_AND_ATTENDANCE_RECORD = 0;
  TSSI_TRAINING_REQUEST = 1;
//  TSSI_INTERNAL_REQUISITION = 2;
//  TSSI_LATERAL_TANSFER_REQUEST = 3;

procedure TWebUserControl_current_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    TabContainer_control.activetabindex := p.tab_index;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_current_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  UserControl_training_request_control := TWebUserControl_training_request(LoadControl('~/usercontrol/app/UserControl_training_request.ascx'));
  //
  if session['UserControl_current_binder.p'] <> nil then begin
    p := p_type(session['UserControl_current_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_PlaceHolder_content']) = 'UserControl_current_binder');
    //
    if assigned(session['UserControl_current_binder_selected_tab']) then begin
      p.tab_index := session['UserControl_current_binder_selected_tab'].GetHashCode;
      session.Remove('UserControl_current_binder_selected_tab');
    end;
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_TRAINING_REQUEST:
      BEGIN
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        UserControl_training_request_control,
        'UserControl_training_request',
        PlaceHolder_content
        );
      UserControl_training_request_control.mode := CURRENT;
      END;
//    TSSI_INTERNAL_REQUISITION:
//      p.content_id := AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')),
//        'UserControl2',
//        PlaceHolder_content
//        );
//    TSSI_LATERAL_TANSFER_REQUEST:
//      p.content_id := AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')),
//        'UserControl3',
//        PlaceHolder_content
//        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_TRAINING_REQUEST;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      UserControl_training_request_control.Fresh,
      'UserControl_training_request',
      PlaceHolder_content
      );
    UserControl_training_request_control.mode := CURRENT;
    //
  end;
  //
end;

procedure TWebUserControl_current_binder.TabContainer_control_ActiveTabChanged(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabContainer_control.activetabindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_TRAINING_REQUEST:
    BEGIN
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      UserControl_training_request_control,
      'UserControl_training_request',
      PlaceHolder_content
      );
    UserControl_training_request_control.mode := CURRENT;
    END;
//  TSSI_INTERNAL_REQUISITION:
//    p.content_id := AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')).Fresh,
//      'UserControl2',
//      PlaceHolder_content
//      );
//  TSSI_LATERAL_TANSFER_REQUEST:
//    p.content_id := AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')).Fresh,
//      'UserControl3',
//      PlaceHolder_content
//      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_current_binder.InitializeComponent;
begin
  Include(Self.TabContainer_control.ActiveTabChanged, Self.TabContainer_control_ActiveTabChanged);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_current_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_current_binder.TWebUserControl_current_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_current_binder.p',p);
  //
end;

function TWebUserControl_current_binder.Fresh: TWebUserControl_current_binder;
begin
  session.Remove('UserControl_current_binder.p');
  Fresh := self;
end;

end.
