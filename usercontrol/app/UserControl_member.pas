unit UserControl_member;

interface

uses
  Class_biz_members,
  Class_biz_squads,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  TWebUserControl_member = class(ki_web_ui.usercontrol_class)
  published
    function Fresh: TWebUserControl_member;
  protected
    procedure OnInit(e: System.EventArgs); override;
  strict protected
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    LinkButton_search: System.Web.UI.WebControls.LinkButton;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    TextBox_last_name: System.Web.UI.WebControls.TextBox;
    TextBox_first_name: System.Web.UI.WebControls.TextBox;
    TextBox_email_address: System.Web.UI.WebControls.TextBox;
    TextBox_registration_code: System.Web.UI.WebControls.TextBox;
    DropDownList_registration_code: System.Web.UI.WebControls.DropDownList;
    DropDownList_squad: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_registration_code: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_registration_code: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator_last_name: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_last_name: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator_first_name: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_first_name: System.Web.UI.WebControls.RegularExpressionValidator;
    RegularExpressionValidator_email_address: System.Web.UI.WebControls.RegularExpressionValidator;
    CustomValidator_email_address: System.Web.UI.WebControls.CustomValidator;
    RegularExpressionValidator_squad: System.Web.UI.WebControls.RegularExpressionValidator;
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        biz_members: TClass_biz_members;
        biz_squads: TClass_biz_squads;
        END;
  strict private
    p: p_type;
    procedure Clear;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(registration_code: string): boolean;
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_member_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_search_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_registration_code_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_email_address_ServerValidate(source: System.Object;
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
  {$ENDREGION}
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_member.Clear;
begin
  //
  TextBox_last_name.text := EMPTY;
  TextBox_first_name.text := EMPTY;
  TextBox_email_address.text := EMPTY;
  TextBox_registration_code.text := EMPTY;
  DropDownList_registration_code.visible := FALSE;
  DropDownList_squad.ClearSelection;
  //
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_member.InjectPersistentClientSideScript;
begin
{$REGION 'Persistent client-side script'}
//  EstablishClientSideFunction(EL);
//  EstablishClientSideFunction(KGS_TO_LBS);
//  EstablishClientSideFunction(LBS_TO_KGS);
//  EstablishClientSideFunction
//    (
//    'RecalculateDependentValues()',
//    EMPTY
//    + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
//    +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
//    + NEW_LINE
//    + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
//    );
//  //
//  TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
//  TextBox_gross_landed_weight_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_gross_landed_weight_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
{$ENDREGION}
end;

procedure TWebUserControl_member.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_squads.BindDirectToListControl(DropDownList_squad);
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_registration_code,TRUE);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

function TWebUserControl_member.PresentRecord(registration_code: string): boolean;
var
  last_name: string;
  first_name: string;
  email_address: string;
  squad_id: string;
begin
  PresentRecord := FALSE;
  if p.biz_members.Get
    (
    last_name,
    first_name,
    email_address,
    registration_code,
    squad_id
    )
  then begin
    //
    TextBox_last_name.text := last_name;
    TextBox_first_name.text := first_name;
    TextBox_email_address.text := email_address;
    TextBox_registration_code.text := registration_code;
    DropDownList_squad.selectedvalue := squad_id;
    //
    TextBox_registration_code.enabled := FALSE;
    Button_delete.enabled := TRUE;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_member.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_member.p'] <> nil then begin
    p := p_type(session['UserControl_member.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_PlaceHolder_content']) = 'UserControl_member');
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_members := TClass_biz_members.Create;
    p.biz_squads := TClass_biz_squads.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_member.InitializeComponent;
begin
  Include(Self.LinkButton_search.Click, Self.LinkButton_search_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.DropDownList_registration_code.SelectedIndexChanged, Self.DropDownList_registration_code_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.CustomValidator_email_address.ServerValidate, Self.CustomValidator_email_address_ServerValidate);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_member_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_member.TWebUserControl_member_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_member.p',p);
end;

function TWebUserControl_member.Fresh: TWebUserControl_member;
begin
  session.Remove('UserControl_member.p');
  Fresh := self;
end;

procedure TWebUserControl_member.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin
    //
    //
    p.biz_members.&Set
      (
      Safe(TextBox_last_name.text,HUMAN_NAME).trim,
      Safe(TextBox_first_name.text,HUMAN_NAME).trim,
      Safe(TextBox_email_address.text,EMAIL_ADDRESS).trim,
      Safe(TextBox_registration_code.text,ALPHANUM).trim,
      Safe(DropDownList_squad.selectedvalue,NUM).trim
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.',TRUE);
  end else begin
    ValidationAlert(TRUE);
  end;
end;

procedure TWebUserControl_member.CustomValidator_email_address_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := BeValidDomainPartOfEmailAddress(Safe(TextBox_email_address.text,EMAIL_ADDRESS));
end;

procedure TWebUserControl_member.DropDownList_registration_code_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(DropDownList_registration_code.selectedvalue);
end;

procedure TWebUserControl_member.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_members.Delete(Safe(TextBox_registration_code.text,ALPHANUM)) then begin
    Clear;
  end else begin
    Alert(kix.APPDATA,kix.FAILURE,'dependency',' Cannot delete this record because another record depends on it.',TRUE);
  end;
end;

procedure TWebUserControl_member.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_registration_code.enabled := TRUE;
  Focus(TextBox_registration_code,TRUE);
end;

procedure TWebUserControl_member.LinkButton_search_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_registration_code: string;
begin
  saved_registration_code := TextBox_registration_code.text;
  Clear;
  if not PresentRecord(saved_registration_code) then begin
    TextBox_registration_code.text := saved_registration_code;
    p.biz_members.Bind(saved_registration_code,DropDownList_registration_code);
    num_matches := DropDownList_registration_code.items.count;
    if num_matches > 0 then begin
      DropDownList_registration_code.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(DropDownList_registration_code.selectedvalue);
      end else begin
        DropDownList_registration_code.items.Insert(0,listitem.Create('-- Select --',EMPTY));
      end;
    end;
  end;
end;

end.
