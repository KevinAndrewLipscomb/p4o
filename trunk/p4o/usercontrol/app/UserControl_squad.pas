unit UserControl_squad;

interface

uses
  Class_biz_squads,
  Class_biz_units,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  TWebUserControl_squad = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_squad_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_lookup_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_new_record_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_code_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_go_to_match_first_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_go_to_match_prior_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_go_to_match_next_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_go_to_match_last_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        be_ok_to_config_squads: boolean;
        biz_squads: TClass_biz_squads;
        biz_units: TClass_biz_units;
        END;
  strict private
    p: p_type;
    procedure Clear;
    procedure InjectPersistentClientSideScript;
    procedure SetDependentFieldAblements(ablement: boolean);
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(id: string): boolean;
    procedure SetLookupMode;
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    Button_lookup: System.Web.UI.WebControls.Button;
    LinkButton_new_record: System.Web.UI.WebControls.LinkButton;
    Label_lookup_arrow: &label;
    Label_lookup_hint: &label;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    TextBox_id: System.Web.UI.WebControls.TextBox;
    DropDownList_spec: System.Web.UI.WebControls.DropDownList;
    TextBox_description: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_description: System.Web.UI.WebControls.RequiredFieldValidator;
    DropDownList_unit: DropDownList;
    LinkButton_go_to_match_prior: System.Web.UI.WebControls.LinkButton;
    LinkButton_go_to_match_next: System.Web.UI.WebControls.LinkButton;
    LinkButton_go_to_match_last: System.Web.UI.WebControls.LinkButton;
    LinkButton_go_to_match_first: System.Web.UI.WebControls.LinkButton;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_squad;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_squad.Clear;
begin
  //
  TextBox_id.text := EMPTY;
  DropDownList_spec.visible := FALSE;
  TextBox_description.text := EMPTY;
  DropDownList_unit.ClearSelection;
  LinkButton_go_to_match_prior.visible := FALSE;
  LinkButton_go_to_match_next.visible := FALSE;
  LinkButton_go_to_match_last.visible := FALSE;
  LinkButton_go_to_match_first.visible := FALSE;
  //
  SetDependentFieldAblements(FALSE);
  Button_submit.enabled := FALSE;
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_squad.InjectPersistentClientSideScript;
begin
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
end;

procedure TWebUserControl_squad.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    LinkButton_new_record.visible := p.be_ok_to_config_squads;
    p.biz_units.BindDirectToListControl(DropDownList_unit);
    LinkButton_go_to_match_first.text := ExpandTildePath(LinkButton_go_to_match_first.text);
    LinkButton_go_to_match_prior.text := ExpandTildePath(LinkButton_go_to_match_prior.text);
    LinkButton_go_to_match_next.text := ExpandTildePath(LinkButton_go_to_match_next.text);
    LinkButton_go_to_match_last.text := ExpandTildePath(LinkButton_go_to_match_last.text);
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_id,TRUE);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

function TWebUserControl_squad.PresentRecord(id: string): boolean;
var
  description: string;
  unit_id: string;
begin
  PresentRecord := FALSE;
  if p.biz_squads.Get
    (
    id,
    description,
    unit_id
    )
  then begin
    //
    TextBox_id.text := id;
    TextBox_description.text := description;
    DropDownList_unit.selectedvalue := unit_id;
    //
    TextBox_id.enabled := FALSE;
    Button_lookup.enabled := FALSE;
    Label_lookup_arrow.enabled := FALSE;
    Label_lookup_hint.enabled := FALSE;
    LinkButton_reset.enabled := TRUE;
    SetDependentFieldAblements(p.be_ok_to_config_squads);
    Button_submit.enabled := p.be_ok_to_config_squads;
    Button_delete.enabled := p.be_ok_to_config_squads;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_squad.SetLookupMode;
begin
  Clear;
  TextBox_id.enabled := TRUE;
  Button_lookup.enabled := TRUE;
  Label_lookup_arrow.enabled := TRUE;
  Label_lookup_hint.enabled := TRUE;
  LinkButton_reset.enabled := FALSE;
  LinkButton_new_record.enabled := p.be_ok_to_config_squads;
  Focus(TextBox_id,TRUE);
end;

procedure TWebUserControl_squad.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_squad.p'] <> nil then begin
    p := p_type(session['UserControl_squad.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content']) = 'UserControl_squad');
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_squads := TClass_biz_squads.Create;
    p.biz_units := TClass_biz_units.Create;
    //
    p.be_ok_to_config_squads := Has(string_array(session['privilege_array']),'config-squads');
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_squad.InitializeComponent;
begin
  Include(Self.Button_lookup.Click, Self.Button_lookup_Click);
  Include(Self.LinkButton_go_to_match_first.Click, Self.LinkButton_go_to_match_first_Click);
  Include(Self.LinkButton_go_to_match_prior.Click, Self.LinkButton_go_to_match_prior_Click);
  Include(Self.LinkButton_go_to_match_next.Click, Self.LinkButton_go_to_match_next_Click);
  Include(Self.LinkButton_go_to_match_last.Click, Self.LinkButton_go_to_match_last_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.LinkButton_new_record.Click, Self.LinkButton_new_record_Click);
  Include(Self.DropDownList_spec.SelectedIndexChanged, Self.DropDownList_code_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.PreRender, Self.TWebUserControl_squad_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_squad.TWebUserControl_squad_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_squad.p',p);
end;

function TWebUserControl_squad.Fresh: TWebUserControl_squad;
begin
  session.Remove('UserControl_squad.p');
  Fresh := self;
end;

procedure TWebUserControl_squad.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin
    //
    //
    p.biz_squads.&Set
      (
      Safe(TextBox_id.text,NUM),
      Safe(TextBox_description.text,PUNCTUATED),
      Safe(DropDownList_unit.SelectedValue,NUM)
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.',TRUE);
    SetLookupMode;
  end else begin
    ValidationAlert(TRUE);
  end;
end;

procedure TWebUserControl_squad.DropDownList_code_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_squad.LinkButton_go_to_match_first_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := 1;
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_squad.LinkButton_go_to_match_prior_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := math.Max(1,(DropDownList_spec.selectedindex - 1));
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_squad.LinkButton_go_to_match_next_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := math.Min((DropDownList_spec.selectedindex + 1),(DropDownList_spec.items.count - 1));
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_squad.LinkButton_go_to_match_last_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := DropDownList_spec.items.count - 1;
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_squad.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_squads.Delete(Safe(TextBox_id.text,ALPHANUM)) then begin
    SetLookupMode;
  end else begin
    Alert(kix.APPDATA,kix.FAILURE,'dependency',' Cannot delete this record because another record depends on it.',TRUE);
  end;
end;

procedure TWebUserControl_squad.LinkButton_new_record_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_id.text := '*';
  TextBox_id.enabled := False;
  Button_lookup.enabled := FALSE;
  Label_lookup_arrow.enabled := FALSE;
  Label_lookup_hint.enabled := FALSE;
  LinkButton_reset.enabled := TRUE;
  LinkButton_new_record.enabled := FALSE;
  SetDependentFieldAblements(p.be_ok_to_config_squads);
  Button_submit.enabled := p.be_ok_to_config_squads;
  Button_delete.enabled := FALSE;
  Focus(TextBox_id,TRUE);
end;

procedure TWebUserControl_squad.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SetLookupMode;
end;

procedure TWebUserControl_squad.SetDependentFieldAblements(ablement: boolean);
begin
  TextBox_description.enabled := ablement;
  DropDownList_unit.enabled := ablement;
end;

procedure TWebUserControl_squad.Button_lookup_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_id: string;
begin
  saved_id := TextBox_id.text;
  Clear;
  if not PresentRecord(saved_id) then begin
    TextBox_id.text := saved_id;
    p.biz_squads.Bind(saved_id,DropDownList_spec);
    num_matches := DropDownList_spec.items.count;
    if num_matches > 0 then begin
      LinkButton_go_to_match_prior.visible := TRUE;
      LinkButton_go_to_match_next.visible := TRUE;
      LinkButton_go_to_match_last.visible := TRUE;
      LinkButton_go_to_match_first.visible := TRUE;
      DropDownList_spec.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
      end else begin
        DropDownList_spec.items.Insert(0,listitem.Create('-- Select --',EMPTY));
      end;
    end;
  end;
end;

end.
