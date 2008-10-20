unit UserControl_unit;

interface

uses
  Class_biz_divisions,
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
  TWebUserControl_unit = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_unit_PreRender(sender: System.Object;
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
        be_ok_to_config_units: boolean;
        biz_divisions: TClass_biz_divisions;
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
    DropDownList_division: DropDownList;
    LinkButton_go_to_match_prior: System.Web.UI.WebControls.LinkButton;
    LinkButton_go_to_match_next: System.Web.UI.WebControls.LinkButton;
    LinkButton_go_to_match_last: System.Web.UI.WebControls.LinkButton;
    LinkButton_go_to_match_first: System.Web.UI.WebControls.LinkButton;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_unit;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_unit.Clear;
begin
  //
  TextBox_id.text := EMPTY;
  DropDownList_spec.visible := FALSE;
  TextBox_description.text := EMPTY;
  DropDownList_division.ClearSelection;
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

procedure TWebUserControl_unit.InjectPersistentClientSideScript;
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

procedure TWebUserControl_unit.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    LinkButton_new_record.visible := p.be_ok_to_config_units;
    p.biz_divisions.BindDirectToListControl(DropDownList_division);
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

function TWebUserControl_unit.PresentRecord(id: string): boolean;
var
  description: string;
  division_id: string;
begin
  PresentRecord := FALSE;
  if p.biz_units.Get
    (
    id,
    description,
    division_id
    )
  then begin
    //
    TextBox_id.text := id;
    TextBox_description.text := description;
    DropDownList_division.selectedvalue := division_id;
    //
    TextBox_id.enabled := FALSE;
    Button_lookup.enabled := FALSE;
    Label_lookup_arrow.enabled := FALSE;
    Label_lookup_hint.enabled := FALSE;
    LinkButton_reset.enabled := TRUE;
    SetDependentFieldAblements(p.be_ok_to_config_units);
    Button_submit.enabled := p.be_ok_to_config_units;
    Button_delete.enabled := p.be_ok_to_config_units;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_unit.SetLookupMode;
begin
  Clear;
  TextBox_id.enabled := TRUE;
  Button_lookup.enabled := TRUE;
  Label_lookup_arrow.enabled := TRUE;
  Label_lookup_hint.enabled := TRUE;
  LinkButton_reset.enabled := FALSE;
  LinkButton_new_record.enabled := p.be_ok_to_config_units;
  Focus(TextBox_id,TRUE);
end;

procedure TWebUserControl_unit.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_unit.p'] <> nil then begin
    p := p_type(session['UserControl_unit.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content']) = 'UserControl_unit');
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_divisions := TClass_biz_divisions.Create;
    p.biz_units := TClass_biz_units.Create;
    //
    p.be_ok_to_config_units := Has(string_array(session['privilege_array']),'config-units');
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_unit.InitializeComponent;
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
  Include(Self.PreRender, Self.TWebUserControl_unit_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_unit.TWebUserControl_unit_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_unit.p',p);
end;

function TWebUserControl_unit.Fresh: TWebUserControl_unit;
begin
  session.Remove('UserControl_unit.p');
  Fresh := self;
end;

procedure TWebUserControl_unit.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin
    //
    //
    p.biz_units.&Set
      (
      Safe(TextBox_id.text,NUM),
      Safe(TextBox_description.text,PUNCTUATED),
      Safe(DropDownList_division.SelectedValue,NUM)
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.',TRUE);
    SetLookupMode;
  end else begin
    ValidationAlert(TRUE);
  end;
end;

procedure TWebUserControl_unit.DropDownList_code_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_unit.LinkButton_go_to_match_first_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := 1;
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_unit.LinkButton_go_to_match_prior_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := math.Max(1,(DropDownList_spec.selectedindex - 1));
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_unit.LinkButton_go_to_match_next_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := math.Min((DropDownList_spec.selectedindex + 1),(DropDownList_spec.items.count - 1));
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_unit.LinkButton_go_to_match_last_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropDownList_spec.selectedindex := DropDownList_spec.items.count - 1;
  PresentRecord(Safe(DropDownList_spec.selectedvalue,NUM));
end;

procedure TWebUserControl_unit.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_units.Delete(Safe(TextBox_id.text,ALPHANUM)) then begin
    SetLookupMode;
  end else begin
    Alert(kix.APPDATA,kix.FAILURE,'dependency',' Cannot delete this record because another record depends on it.',TRUE);
  end;
end;

procedure TWebUserControl_unit.LinkButton_new_record_Click(sender: System.Object;
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
  SetDependentFieldAblements(p.be_ok_to_config_units);
  Button_submit.enabled := p.be_ok_to_config_units;
  Button_delete.enabled := FALSE;
  Focus(TextBox_id,TRUE);
end;

procedure TWebUserControl_unit.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SetLookupMode;
end;

procedure TWebUserControl_unit.SetDependentFieldAblements(ablement: boolean);
begin
  TextBox_description.enabled := ablement;
  DropDownList_division.enabled := ablement;
end;

procedure TWebUserControl_unit.Button_lookup_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_id: string;
begin
  saved_id := TextBox_id.text;
  Clear;
  if not PresentRecord(saved_id) then begin
    TextBox_id.text := saved_id;
    p.biz_units.Bind(saved_id,DropDownList_spec);
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
