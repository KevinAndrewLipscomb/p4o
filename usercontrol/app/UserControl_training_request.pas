unit UserControl_training_request;

interface

uses
  Class_biz_training_requests,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  p_type =
    RECORD
    be_loaded: boolean;
    biz_training_requests: TClass_biz_training_requests;
    END;
  TWebUserControl_training_request = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_training_request_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_search_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_id_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Clear;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(id: string): boolean;
  strict protected
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    LinkButton_search: System.Web.UI.WebControls.LinkButton;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    DropDownList_id: DropDownList;
    TextBox_nature: TextBox;
    TextBox_dates: TextBox;
    TextBox_conducting_agency: TextBox;
    TextBox_location: TextBox;
    TextBox_cost_of_enrollment: TextBox;
    TextBox_cost_of_lodging: TextBox;
    TextBox_cost_of_meals: TextBox;
    TextBox_cost_of_transportation: TextBox;
    TextBox_reason: TextBox;
    TextBox_disposition_training_timestamp: TextBox;
    TextBox_disposition_training_member_id: TextBox;
    TextBox_disposition_training_funding_source: TextBox;
    TextBox_disposition_training_comments: TextBox;
    TextBox_disposition_squad_timestamp: TextBox;
    TextBox_disposition_squad_member_id: TextBox;
    CheckBox_disposition_squad_be_approved: CheckBox;
    TextBox_disposition_squad_comments: TextBox;
    TextBox_disposition_unit_timestamp: TextBox;
    TextBox_disposition_unit_member_id: TextBox;
    CheckBox_disposition_unit_be_approved: CheckBox;
    TextBox_disposition_unit_comments: TextBox;
    TextBox_disposition_division_timestamp: TextBox;
    TextBox_disposition_division_member_id: TextBox;
    CheckBox_disposition_division_be_approved: CheckBox;
    TextBox_disposition_division_comments: TextBox;
    TextBox_disposition_assistant_chief_timestamp: TextBox;
    TextBox_disposition_assistant_chief_member_id: TextBox;
    CheckBox_disposition_assistant_chief_be_approved: CheckBox;
    TextBox_disposition_assistant_chief_comments: TextBox;
    TextBox_payment_timestamp: TextBox;
    TextBox_payment_member_id: TextBox;
    CheckBox_payment_be_done: CheckBox;
    TextBox_payment_actual_amount: TextBox;
    TextBox_payment_comments: TextBox;
    TextBox_status_code: TextBox;
    TextBox_finalization_timestamp: TextBox;
    TextBox_id: TextBox;
    Div_disposition_training: htmlgenericcontrol;
    Div_disposition_squad: htmlgenericcontrol;
    Div_disposition_unit: htmlgenericcontrol;
    Div_disposition_division: htmlgenericcontrol;
    Div_disposition_assistant_chief: htmlgenericcontrol;
    Div_disposition_payment: htmlgenericcontrol;
    Div_disposition_status: htmlgenericcontrol;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_training_request;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_training_request.Clear;
begin
  //
  DropDownList_id.visible := FALSE;
  TextBox_nature.text := EMPTY;
  TextBox_dates.text := EMPTY;
  TextBox_conducting_agency.text := EMPTY;
  TextBox_location.text := EMPTY;
  TextBox_cost_of_enrollment.text := EMPTY;
  TextBox_cost_of_lodging.text := EMPTY;
  TextBox_cost_of_meals.text := EMPTY;
  TextBox_cost_of_transportation.text := EMPTY;
  TextBox_reason.text := EMPTY;
  TextBox_disposition_training_timestamp.text := EMPTY;
  TextBox_disposition_training_member_id.text := EMPTY;
  TextBox_disposition_training_funding_source.text := EMPTY;
  TextBox_disposition_training_comments.text := EMPTY;
  TextBox_disposition_squad_timestamp.text := EMPTY;
  TextBox_disposition_squad_member_id.text := EMPTY;
  CheckBox_disposition_squad_be_approved.checked := FALSE;
  TextBox_disposition_squad_comments.text := EMPTY;
  TextBox_disposition_unit_timestamp.text := EMPTY;
  TextBox_disposition_unit_member_id.text := EMPTY;
  CheckBox_disposition_unit_be_approved.checked := FALSE;
  TextBox_disposition_unit_comments.text := EMPTY;
  TextBox_disposition_division_timestamp.text := EMPTY;
  TextBox_disposition_division_member_id.text := EMPTY;
  CheckBox_disposition_division_be_approved.checked := FALSE;
  TextBox_disposition_division_comments.text := EMPTY;
  TextBox_disposition_assistant_chief_timestamp.text := EMPTY;
  TextBox_disposition_assistant_chief_member_id.text := EMPTY;
  CheckBox_disposition_assistant_chief_be_approved.checked := FALSE;
  TextBox_disposition_assistant_chief_comments.text := EMPTY;
  TextBox_payment_timestamp.text := EMPTY;
  TextBox_payment_member_id.text := EMPTY;
  CheckBox_payment_be_done.checked := FALSE;
  TextBox_payment_actual_amount.text := EMPTY;
  TextBox_payment_comments.text := EMPTY;
  TextBox_status_code.text := EMPTY;
  TextBox_finalization_timestamp.text := EMPTY;
  TextBox_id.text := EMPTY;
  //
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_training_request.InjectPersistentClientSideScript;
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

procedure TWebUserControl_training_request.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    Div_disposition_training.visible := FALSE;
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

function TWebUserControl_training_request.PresentRecord(id: string): boolean;
var
  nature: string;
  dates: string;
  conducting_agency: string;
  location: string;
  cost_of_enrollment: string;
  cost_of_lodging: string;
  cost_of_meals: string;
  cost_of_transportation: string;
  reason: string;
  disposition_training_timestamp: datetime;
  disposition_training_member_id: string;
  disposition_training_funding_source: string;
  disposition_training_comments: string;
  disposition_squad_timestamp: datetime;
  disposition_squad_member_id: string;
  disposition_squad_be_approved: boolean;
  disposition_squad_comments: string;
  disposition_unit_timestamp: datetime;
  disposition_unit_member_id: string;
  disposition_unit_be_approved: boolean;
  disposition_unit_comments: string;
  disposition_division_timestamp: datetime;
  disposition_division_member_id: string;
  disposition_division_be_approved: boolean;
  disposition_division_comments: string;
  disposition_assistant_chief_timestamp: datetime;
  disposition_assistant_chief_member_id: string;
  disposition_assistant_chief_be_approved: boolean;
  disposition_assistant_chief_comments: string;
  payment_timestamp: datetime;
  payment_member_id: string;
  payment_be_done: boolean;
  payment_actual_amount: string;
  payment_comments: string;
  status_code: string;
  finalization_timestamp: datetime;
begin
  PresentRecord := FALSE;
  if p.biz_training_requests.Get
    (
    id,
    nature,
    dates,
    conducting_agency,
    location,
    cost_of_enrollment,
    cost_of_lodging,
    cost_of_meals,
    cost_of_transportation,
    reason,
    disposition_training_timestamp,
    disposition_training_member_id,
    disposition_training_funding_source,
    disposition_training_comments,
    disposition_squad_timestamp,
    disposition_squad_member_id,
    disposition_squad_be_approved,
    disposition_squad_comments,
    disposition_unit_timestamp,
    disposition_unit_member_id,
    disposition_unit_be_approved,
    disposition_unit_comments,
    disposition_division_timestamp,
    disposition_division_member_id,
    disposition_division_be_approved,
    disposition_division_comments,
    disposition_assistant_chief_timestamp,
    disposition_assistant_chief_member_id,
    disposition_assistant_chief_be_approved,
    disposition_assistant_chief_comments,
    payment_timestamp,
    payment_member_id,
    payment_be_done,
    payment_actual_amount,
    payment_comments,
    status_code,
    finalization_timestamp
    )
  then begin
    //
    TextBox_id.text := id;
    TextBox_nature.text := nature;
    TextBox_dates.text := dates;
    TextBox_conducting_agency.text := conducting_agency;
    TextBox_location.text := location;
    TextBox_cost_of_enrollment.text := cost_of_enrollment;
    TextBox_cost_of_lodging.text := cost_of_lodging;
    TextBox_cost_of_meals.text := cost_of_meals;
    TextBox_cost_of_transportation.text := cost_of_transportation;
    TextBox_reason.text := reason;
    TextBox_disposition_training_timestamp.text := disposition_training_timestamp.tostring;
    TextBox_disposition_training_member_id.text := disposition_training_member_id;
    TextBox_disposition_training_funding_source.text := disposition_training_funding_source;
    TextBox_disposition_training_comments.text := disposition_training_comments;
    TextBox_disposition_squad_timestamp.text := disposition_squad_timestamp.tostring;
    TextBox_disposition_squad_member_id.text := disposition_squad_member_id;
    CheckBox_disposition_squad_be_approved.checked := disposition_squad_be_approved;
    TextBox_disposition_squad_comments.text := disposition_squad_comments;
    TextBox_disposition_unit_timestamp.text := disposition_unit_timestamp.tostring;
    TextBox_disposition_unit_member_id.text := disposition_unit_member_id;
    CheckBox_disposition_unit_be_approved.checked := disposition_unit_be_approved;
    TextBox_disposition_unit_comments.text := disposition_unit_comments;
    TextBox_disposition_division_timestamp.text := disposition_division_timestamp.tostring;
    TextBox_disposition_division_member_id.text := disposition_division_member_id;
    CheckBox_disposition_division_be_approved.checked := disposition_division_be_approved;
    TextBox_disposition_division_comments.text := disposition_division_comments;
    TextBox_disposition_assistant_chief_timestamp.text := disposition_assistant_chief_timestamp.tostring;
    TextBox_disposition_assistant_chief_member_id.text := disposition_assistant_chief_member_id;
    CheckBox_disposition_assistant_chief_be_approved.checked := disposition_assistant_chief_be_approved;
    TextBox_disposition_assistant_chief_comments.text := disposition_assistant_chief_comments;
    TextBox_payment_timestamp.text := payment_timestamp.tostring;
    TextBox_payment_member_id.text := payment_member_id;
    CheckBox_payment_be_done.checked := payment_be_done;
    TextBox_payment_actual_amount.text := payment_actual_amount;
    TextBox_payment_comments.text := payment_comments;
    TextBox_status_code.text := status_code;
    TextBox_finalization_timestamp.text := finalization_timestamp.tostring;
    //
    TextBox_id.enabled := FALSE;
    Button_delete.enabled := TRUE;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_training_request.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_training_request.p'] <> nil then begin
    p := p_type(session['UserControl_training_request.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_PlaceHolder_content']) = 'UserControl_training_request');
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_training_requests := TClass_biz_training_requests.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_training_request.InitializeComponent;
begin
  Include(Self.LinkButton_search.Click, Self.LinkButton_search_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.DropDownList_id.SelectedIndexChanged, Self.DropDownList_id_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_training_request_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_training_request.TWebUserControl_training_request_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_training_request.p',p);
end;

function TWebUserControl_training_request.Fresh: TWebUserControl_training_request;
begin
  session.Remove('UserControl_training_request.p');
  Fresh := self;
end;

procedure TWebUserControl_training_request.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
var
  disposition_training_timestamp: datetime;
  disposition_squad_timestamp: datetime;
  disposition_unit_timestamp: datetime;
  disposition_division_timestamp: datetime;
  disposition_assistant_chief_timestamp: datetime;
  payment_timestamp: datetime;
  finalization_timestamp: datetime;
begin
  if page.IsValid then begin
    //
    if TextBox_disposition_training_timestamp.text <> EMPTY then begin
      disposition_training_timestamp := datetime.Parse(Safe(TextBox_disposition_training_timestamp.text,DATE_TIME));
    end;
    if TextBox_disposition_squad_timestamp.text <> EMPTY then begin
      disposition_squad_timestamp := datetime.Parse(Safe(TextBox_disposition_squad_timestamp.text,DATE_TIME));
    end;
    if TextBox_disposition_unit_timestamp.text <> EMPTY then begin
      disposition_unit_timestamp := datetime.Parse(Safe(TextBox_disposition_unit_timestamp.text,DATE_TIME));
    end;
    if TextBox_disposition_division_timestamp.text <> EMPTY then begin
      disposition_division_timestamp := datetime.Parse(Safe(TextBox_disposition_division_timestamp.text,DATE_TIME));
    end;
    if TextBox_disposition_assistant_chief_timestamp.text <> EMPTY then begin
      disposition_assistant_chief_timestamp := datetime.Parse(Safe(TextBox_disposition_assistant_chief_timestamp.text,DATE_TIME));
    end;
    if TextBox_payment_timestamp.text <> EMPTY then begin
      payment_timestamp := datetime.Parse(Safe(TextBox_payment_timestamp.text,DATE_TIME));
    end;
    if TextBox_finalization_timestamp.text <> EMPTY then begin
      finalization_timestamp := datetime.Parse(Safe(TextBox_finalization_timestamp.text,DATE_TIME));
    end;
    //
    p.biz_training_requests.&Set
      (
      Safe(TextBox_id.text,PUNCTUATED).trim,
      Safe(TextBox_nature.text,PUNCTUATED).trim,
      Safe(TextBox_dates.text,PUNCTUATED).trim,
      Safe(TextBox_conducting_agency.text,ORG_NAME).trim,
      Safe(TextBox_location.text,PUNCTUATED).trim,
      Safe(TextBox_cost_of_enrollment.text,CURRENCY_USA).trim,
      Safe(TextBox_cost_of_lodging.text,CURRENCY_USA).trim,
      Safe(TextBox_cost_of_meals.text,CURRENCY_USA).trim,
      Safe(TextBox_cost_of_transportation.text,CURRENCY_USA).trim,
      Safe(TextBox_reason.text,PUNCTUATED).trim,
      disposition_training_timestamp,
      Safe(TextBox_disposition_training_member_id.text,NUM).trim,
      Safe(TextBox_disposition_training_funding_source.text,NUM).trim,
      Safe(TextBox_disposition_training_comments.text,PUNCTUATED).trim,
      disposition_squad_timestamp,
      Safe(TextBox_disposition_squad_member_id.text,NUM).trim,
      CheckBox_disposition_squad_be_approved.checked,
      Safe(TextBox_disposition_squad_comments.text,PUNCTUATED).trim,
      disposition_unit_timestamp,
      Safe(TextBox_disposition_unit_member_id.text,NUM).trim,
      CheckBox_disposition_unit_be_approved.checked,
      Safe(TextBox_disposition_unit_comments.text,PUNCTUATED).trim,
      disposition_division_timestamp,
      Safe(TextBox_disposition_division_member_id.text,NUM).trim,
      CheckBox_disposition_division_be_approved.checked,
      Safe(TextBox_disposition_division_comments.text,PUNCTUATED).trim,
      disposition_assistant_chief_timestamp,
      Safe(TextBox_disposition_assistant_chief_member_id.text,NUM).trim,
      CheckBox_disposition_assistant_chief_be_approved.checked,
      Safe(TextBox_disposition_assistant_chief_comments.text,PUNCTUATED).trim,
      payment_timestamp,
      Safe(TextBox_payment_member_id.text,NUM).trim,
      CheckBox_payment_be_done.checked,
      Safe(TextBox_payment_actual_amount.text,CURRENCY_USA).trim,
      Safe(TextBox_payment_comments.text,PUNCTUATED).trim,
      Safe(TextBox_status_code.text,NUM).trim,
      finalization_timestamp
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.');
  end else begin
    ValidationAlert;
  end;
end;

procedure TWebUserControl_training_request.DropDownList_id_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(DropDownList_id.selectedvalue);
end;

procedure TWebUserControl_training_request.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_training_requests.Delete(Safe(TextBox_id.text,ALPHANUM)) then begin
    Clear;
  end else begin
    Alert(kix.APPDATA,kix.FAILURE,'dependency',' Cannot delete this record because another record depends on it.');
  end;
end;

procedure TWebUserControl_training_request.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_id.enabled := TRUE;
  Focus(TextBox_id,TRUE);
end;

procedure TWebUserControl_training_request.LinkButton_search_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_id: string;
begin
  saved_id := TextBox_id.text;
  Clear;
  if not PresentRecord(saved_id) then begin
    TextBox_id.text := saved_id;
    p.biz_training_requests.Bind(saved_id,DropDownList_id);
    num_matches := DropDownList_id.items.count;
    if num_matches > 0 then begin
      DropDownList_id.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(DropDownList_id.selectedvalue);
      end else begin
        DropDownList_id.items.Insert(0,listitem.Create('-- Select --',EMPTY));
      end;
    end;
  end;
end;

end.
