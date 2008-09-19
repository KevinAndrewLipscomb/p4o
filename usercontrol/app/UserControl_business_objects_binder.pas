unit UserControl_business_objects_binder;

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
  TWebUserControl_business_objects_binder = class(ki_web_ui.usercontrol_class)
  published
    function Fresh: TWebUserControl_business_objects_binder;
  protected
    procedure OnInit(e: System.EventArgs); override;
  strict protected
    TabContainer_control: AjaxControlToolkit.TabContainer;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
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
    procedure TWebUserControl_business_objects_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabContainer_control_ActiveTabChanged(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration,
  UserControl_bureau,
  UserControl_division,
  UserControl_squad,
  UserControl_unit;

const
  TSSI_SQUAD = 0;
  TSSI_UNIT = 1;
  TSSI_DIVISION = 2;
  TSSI_BUREAU = 3;

procedure TWebUserControl_business_objects_binder.Page_Load(sender: System.Object; e: System.EventArgs);
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

procedure TWebUserControl_business_objects_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_business_objects_binder.p'] <> nil then begin
    p := p_type(session['UserControl_business_objects_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_config_PlaceHolder_content']) = 'UserControl_business_objects_binder');
    //
    if assigned(session['UserControl_business_objects_binder_selected_tab']) then begin
      p.tab_index := session['UserControl_business_objects_binder_selected_tab'].GetHashCode;
      session.Remove('UserControl_business_objects_binder_selected_tab');
      {$REGION 'Retrofit hint'}
      //
      // Make sure set "TabContainer_control.activetabindex := p.tab_index;" in Page_Load, then delete this region.
      //
      {$ENDREGION}
    end;
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_SQUAD:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_squad(LoadControl('~/usercontrol/app/UserControl_squad.ascx')),
        'UserControl_squad',
        PlaceHolder_content
        );
    TSSI_UNIT:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_unit(LoadControl('~/usercontrol/app/UserControl_unit.ascx')),
        'UserControl_unit',
        PlaceHolder_content
        );
    TSSI_DIVISION:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_division(LoadControl('~/usercontrol/app/UserControl_division.ascx')),
        'UserControl_division',
        PlaceHolder_content
        );
    TSSI_BUREAU:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_bureau(LoadControl('~/usercontrol/app/UserControl_bureau.ascx')),
        'UserControl_bureau',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_SQUAD;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_squad(LoadControl('~/usercontrol/app/UserControl_squad.ascx')).Fresh,
      'UserControl_squad',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_business_objects_binder.TabContainer_control_ActiveTabChanged(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabContainer_control.activetabindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_SQUAD:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_squad(LoadControl('~/usercontrol/app/UserControl_squad.ascx')).Fresh,
      'UserControl_squad',
      PlaceHolder_content
      );
  TSSI_UNIT:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_unit(LoadControl('~/usercontrol/app/UserControl_unit.ascx')).Fresh,
      'UserControl_unit',
      PlaceHolder_content
      );
  TSSI_DIVISION:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_division(LoadControl('~/usercontrol/app/UserControl_division.ascx')).Fresh,
      'UserControl_division',
      PlaceHolder_content
      );
  TSSI_BUREAU:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_bureau(LoadControl('~/usercontrol/app/UserControl_bureau.ascx')).Fresh,
      'UserControl_bureau',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_business_objects_binder.InitializeComponent;
begin
  Include(Self.TabContainer_control.ActiveTabChanged, Self.TabContainer_control_ActiveTabChanged);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_business_objects_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_business_objects_binder.TWebUserControl_business_objects_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_business_objects_binder.p',p);
  //
end;

function TWebUserControl_business_objects_binder.Fresh: TWebUserControl_business_objects_binder;
begin
  session.Remove('UserControl_business_objects_binder.p');
  Fresh := self;
end;

end.
