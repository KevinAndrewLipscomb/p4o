using kix;

using System;
using System.Collections.Specialized;
using System.Web.UI;
using System.Web.UI.WebControls;
using Class_biz_training_request_statuses;
using Class_biz_training_requests;

namespace UserControl_training_request
{
    // Unit class type
    public partial class TWebUserControl_training_request: ki_web_ui.usercontrol_class
    {
        public mode_type mode
        {
          get {
            mode_type result;
            result = p.mode;
            return result;
          }
          set {
            Panel_detail_origination.Visible = (value != mode_type.@NEW);
            Panel_detail.Enabled = (value == mode_type.@NEW);
            Panel_disposition_training.Visible = (value != mode_type.@NEW) && (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_TRAINING_UNIT_COMMENTS"));
            Panel_disposition_squad.Visible = (value != mode_type.@NEW) && (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_SQUAD_APPROVAL"));
            Panel_disposition_unit.Visible = (value != mode_type.@NEW) && (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_UNIT_APPROVAL"));
            Panel_disposition_division.Visible = (value != mode_type.@NEW) && (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_DIVISION_APPROVAL"));
            Panel_disposition_assistant_chief.Visible = (value != mode_type.@NEW) && (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_ASSISTANT_CHIEF_APPROVAL"));
            Panel_disposition_finance.Visible = (value != mode_type.@NEW) && (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_PAYMENT"));
            Panel_disposition_status.Visible = (value != mode_type.@NEW);
            Panel_disposition_finalization.Visible = (value != mode_type.@NEW) && ((k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("NEEDS_GRADUATION")) || (k.Safe(TextBox_status_code.Text, k.safe_hint_type.NUM) == p.biz_training_request_statuses.IdOf("CANCELED")));
            p.mode = value;
          }
        }
        private p_type p;
        private void Clear()
        {
            DropDownList_id.Visible = false;
            TextBox_nature.Text = k.EMPTY;
            TextBox_dates.Text = k.EMPTY;
            TextBox_conducting_agency.Text = k.EMPTY;
            TextBox_location.Text = k.EMPTY;
            TextBox_cost_of_enrollment.Text = k.EMPTY;
            TextBox_cost_of_lodging.Text = k.EMPTY;
            TextBox_cost_of_meals.Text = k.EMPTY;
            TextBox_cost_of_transportation.Text = k.EMPTY;
            TextBox_reason.Text = k.EMPTY;
            TextBox_disposition_training_timestamp.Text = k.EMPTY;
            TextBox_disposition_training_member_id.Text = k.EMPTY;
            TextBox_disposition_training_funding_source.Text = k.EMPTY;
            TextBox_disposition_training_comments.Text = k.EMPTY;
            TextBox_disposition_squad_timestamp.Text = k.EMPTY;
            TextBox_disposition_squad_member_id.Text = k.EMPTY;
            CheckBox_disposition_squad_be_approved.Checked = false;
            TextBox_disposition_squad_comments.Text = k.EMPTY;
            TextBox_disposition_unit_timestamp.Text = k.EMPTY;
            TextBox_disposition_unit_member_id.Text = k.EMPTY;
            CheckBox_disposition_unit_be_approved.Checked = false;
            TextBox_disposition_unit_comments.Text = k.EMPTY;
            TextBox_disposition_division_timestamp.Text = k.EMPTY;
            TextBox_disposition_division_member_id.Text = k.EMPTY;
            CheckBox_disposition_division_be_approved.Checked = false;
            TextBox_disposition_division_comments.Text = k.EMPTY;
            TextBox_disposition_assistant_chief_timestamp.Text = k.EMPTY;
            TextBox_disposition_assistant_chief_member_id.Text = k.EMPTY;
            CheckBox_disposition_assistant_chief_be_approved.Checked = false;
            TextBox_disposition_assistant_chief_comments.Text = k.EMPTY;
            TextBox_payment_timestamp.Text = k.EMPTY;
            TextBox_payment_member_id.Text = k.EMPTY;
            CheckBox_payment_be_done.Checked = false;
            TextBox_payment_actual_amount.Text = k.EMPTY;
            TextBox_payment_comments.Text = k.EMPTY;
            TextBox_status_code.Text = k.EMPTY;
            TextBox_finalization_timestamp.Text = k.EMPTY;
            TextBox_id.Text = k.EMPTY;
            TextBox_member_id.Text = k.EMPTY;
            TextBox_submission_timestamp.Text = k.EMPTY;
      Literal_match_index.Text = k.EMPTY;
      Literal_num_matches.Text = k.EMPTY;
      Panel_match_numbers.Visible = false;
      LinkButton_go_to_match_prior.Visible = false;
      LinkButton_go_to_match_next.Visible = false;
      LinkButton_go_to_match_last.Visible = false;
      LinkButton_go_to_match_first.Visible = false;
            SetDependentFieldAblements(false);
            Button_submit.Enabled = false;
            Button_delete.Enabled = false;

        }

        private void InjectPersistentClientSideScript()
        {
            // EstablishClientSideFunction(EL);
            // EstablishClientSideFunction(KGS_TO_LBS);
            // EstablishClientSideFunction(LBS_TO_KGS);
            // EstablishClientSideFunction
            // (
            // 'RecalculateDependentValues()',
            // k.EMPTY
            // + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
            // +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
            // );
            // //
            // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
            // TextBox_gross_landed_weight_in_pounds.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_gross_landed_weight_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_landed_or_ciq_tare.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_net_landed_in_pounds.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_net_landed_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );

        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                LinkButton_new_record.Visible = p.be_ok_to_config_training_requests;
                LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
                LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
                LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
                LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
                RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
                Focus(TextBox_nature, true);
                p.be_loaded = true;
            }
            InjectPersistentClientSideScript();

        }

        private bool PresentRecord(string id)
        {
        Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
            bool result;
            string nature;
            string dates;
            string conducting_agency;
            string location;
            string cost_of_enrollment;
            string cost_of_lodging;
            string cost_of_meals;
            string cost_of_transportation;
            string reason;
            DateTime disposition_training_timestamp;
            string disposition_training_member_id;
            string disposition_training_funding_source;
            string disposition_training_comments;
            DateTime disposition_squad_timestamp;
            string disposition_squad_member_id;
            bool disposition_squad_be_approved;
            string disposition_squad_comments;
            DateTime disposition_unit_timestamp;
            string disposition_unit_member_id;
            bool disposition_unit_be_approved;
            string disposition_unit_comments;
            DateTime disposition_division_timestamp;
            string disposition_division_member_id;
            bool disposition_division_be_approved;
            string disposition_division_comments;
            DateTime disposition_assistant_chief_timestamp;
            string disposition_assistant_chief_member_id;
            bool disposition_assistant_chief_be_approved;
            string disposition_assistant_chief_comments;
            DateTime payment_timestamp;
            string payment_member_id;
            bool payment_be_done;
            string payment_actual_amount;
            string payment_comments;
            string status_code;
            DateTime finalization_timestamp;
            string member_id;
            DateTime submission_timestamp;
            result = false;
            if (p.biz_training_requests.Get(id, out nature, out dates, out conducting_agency, out location, out cost_of_enrollment, out cost_of_lodging, out cost_of_meals, out cost_of_transportation, out reason, out disposition_training_timestamp, out disposition_training_member_id, out disposition_training_funding_source, out disposition_training_comments, out disposition_squad_timestamp, out disposition_squad_member_id, out disposition_squad_be_approved, out disposition_squad_comments, out disposition_unit_timestamp, out disposition_unit_member_id, out disposition_unit_be_approved, out disposition_unit_comments, out disposition_division_timestamp, out disposition_division_member_id, out disposition_division_be_approved, out disposition_division_comments, out disposition_assistant_chief_timestamp, out disposition_assistant_chief_member_id, out disposition_assistant_chief_be_approved, out disposition_assistant_chief_comments, out payment_timestamp, out payment_member_id, out payment_be_done, out payment_actual_amount, out payment_comments, out status_code, out finalization_timestamp, out member_id, out submission_timestamp))
            {
                TextBox_id.Text = id;
                TextBox_nature.Text = nature;
                TextBox_dates.Text = dates;
                TextBox_conducting_agency.Text = conducting_agency;
                TextBox_location.Text = location;
                TextBox_cost_of_enrollment.Text = cost_of_enrollment;
                TextBox_cost_of_lodging.Text = cost_of_lodging;
                TextBox_cost_of_meals.Text = cost_of_meals;
                TextBox_cost_of_transportation.Text = cost_of_transportation;
                TextBox_reason.Text = reason;
                TextBox_disposition_training_timestamp.Text = disposition_training_timestamp.ToString();
                TextBox_disposition_training_member_id.Text = disposition_training_member_id;
                TextBox_disposition_training_funding_source.Text = disposition_training_funding_source;
                TextBox_disposition_training_comments.Text = disposition_training_comments;
                TextBox_disposition_squad_timestamp.Text = disposition_squad_timestamp.ToString();
                TextBox_disposition_squad_member_id.Text = disposition_squad_member_id;
                CheckBox_disposition_squad_be_approved.Checked = disposition_squad_be_approved;
                TextBox_disposition_squad_comments.Text = disposition_squad_comments;
                TextBox_disposition_unit_timestamp.Text = disposition_unit_timestamp.ToString();
                TextBox_disposition_unit_member_id.Text = disposition_unit_member_id;
                CheckBox_disposition_unit_be_approved.Checked = disposition_unit_be_approved;
                TextBox_disposition_unit_comments.Text = disposition_unit_comments;
                TextBox_disposition_division_timestamp.Text = disposition_division_timestamp.ToString();
                TextBox_disposition_division_member_id.Text = disposition_division_member_id;
                CheckBox_disposition_division_be_approved.Checked = disposition_division_be_approved;
                TextBox_disposition_division_comments.Text = disposition_division_comments;
                TextBox_disposition_assistant_chief_timestamp.Text = disposition_assistant_chief_timestamp.ToString();
                TextBox_disposition_assistant_chief_member_id.Text = disposition_assistant_chief_member_id;
                CheckBox_disposition_assistant_chief_be_approved.Checked = disposition_assistant_chief_be_approved;
                TextBox_disposition_assistant_chief_comments.Text = disposition_assistant_chief_comments;
                TextBox_payment_timestamp.Text = payment_timestamp.ToString();
                TextBox_payment_member_id.Text = payment_member_id;
                CheckBox_payment_be_done.Checked = payment_be_done;
                TextBox_payment_actual_amount.Text = payment_actual_amount;
                TextBox_payment_comments.Text = payment_comments;
                TextBox_status_code.Text = status_code;
                TextBox_finalization_timestamp.Text = finalization_timestamp.ToString();
                TextBox_member_id.Text = member_id;
                TextBox_submission_timestamp.Text = submission_timestamp.ToString();
                TextBox_id.Enabled = false;
                Button_lookup.Enabled = false;
                Label_lookup_arrow.Enabled = false;
                Label_lookup_hint.Enabled = false;
                LinkButton_reset.Enabled = true;
                SetDependentFieldAblements(p.be_ok_to_config_training_requests);
                Button_submit.Enabled = p.be_ok_to_config_training_requests;
                Button_delete.Enabled = p.be_ok_to_config_training_requests;
                mode = p.mode;
                result = true;
            }
            return result;
        }

        private void SetLookupMode()
        {
            Clear();
            TextBox_id.Enabled = true;
            Button_lookup.Enabled = true;
            Label_lookup_arrow.Enabled = true;
            Label_lookup_hint.Enabled = true;
            LinkButton_reset.Enabled = false;
            LinkButton_new_record.Enabled = p.be_ok_to_config_training_requests;
            TextBox_id.Focus();
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session[InstanceId() + ".p"] != null)
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                p.be_loaded = IsPostBack && (((p.mode == mode_type.@NEW) && ((Session["UserControl_member_binder_UserControl_new_binder_PlaceHolder_content"] as string) == "UserControl_training_request")) || ((p.mode == mode_type.CURRENT) && ((Session["UserControl_member_binder_UserControl_current_binder_PlaceHolder_content"] as string) == "UserControl_training_request")));
            }
            else
            {
                p.be_loaded = false;
                p.biz_training_request_statuses = new TClass_biz_training_request_statuses();
                p.biz_training_requests = new TClass_biz_training_requests();
                p.be_ok_to_config_training_requests = k.Has((string[])(Session["privilege_array"]), "config-training-requests");
                p.mode = mode_type.NONE;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebUserControl_training_request_PreRender;
        }

        private void TWebUserControl_training_request_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_training_request Fresh()
        {
            TWebUserControl_training_request result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            //DateTime disposition_training_timestamp;
            //DateTime disposition_squad_timestamp;
            //DateTime disposition_unit_timestamp;
            //DateTime disposition_division_timestamp;
            //DateTime disposition_assistant_chief_timestamp;
            //DateTime payment_timestamp;
            //DateTime finalization_timestamp;
            //DateTime submission_timestamp;
            if (Page.IsValid)
            {
                switch(p.mode)
                {
                    case mode_type.@NEW:
                        p.biz_training_requests.SetNew(k.Safe(TextBox_nature.Text, k.safe_hint_type.PUNCTUATED).Trim(), k.Safe(TextBox_dates.Text, k.safe_hint_type.PUNCTUATED).Trim(), k.Safe(TextBox_conducting_agency.Text, k.safe_hint_type.ORG_NAME).Trim(), k.Safe(TextBox_location.Text, k.safe_hint_type.PUNCTUATED).Trim(), k.Safe(TextBox_cost_of_enrollment.Text, k.safe_hint_type.CURRENCY_USA).Trim(), k.Safe(TextBox_cost_of_lodging.Text, k.safe_hint_type.CURRENCY_USA).Trim(), k.Safe(TextBox_cost_of_meals.Text, k.safe_hint_type.CURRENCY_USA).Trim(), k.Safe(TextBox_cost_of_transportation.Text, k.safe_hint_type.CURRENCY_USA).Trim(), k.Safe(TextBox_reason.Text, k.safe_hint_type.PUNCTUATED).Trim(), Session["member_id"].ToString());
                        break;
                }
                // if TextBox_disposition_training_timestamp.Text <> k.EMPTY then begin
                // disposition_training_timestamp := DateTime.Parse(k.Safe(TextBox_disposition_training_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_disposition_squad_timestamp.Text <> k.EMPTY then begin
                // disposition_squad_timestamp := DateTime.Parse(k.Safe(TextBox_disposition_squad_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_disposition_unit_timestamp.Text <> k.EMPTY then begin
                // disposition_unit_timestamp := DateTime.Parse(k.Safe(TextBox_disposition_unit_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_disposition_division_timestamp.Text <> k.EMPTY then begin
                // disposition_division_timestamp := DateTime.Parse(k.Safe(TextBox_disposition_division_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_disposition_assistant_chief_timestamp.Text <> k.EMPTY then begin
                // disposition_assistant_chief_timestamp := DateTime.Parse(k.Safe(TextBox_disposition_assistant_chief_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_payment_timestamp.Text <> k.EMPTY then begin
                // payment_timestamp := DateTime.Parse(k.Safe(TextBox_payment_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_finalization_timestamp.Text <> k.EMPTY then begin
                // finalization_timestamp := DateTime.Parse(k.Safe(TextBox_finalization_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // if TextBox_submission_timestamp.Text <> k.EMPTY then begin
                // submission_timestamp := DateTime.Parse(k.Safe(TextBox_submission_timestamp.Text,k.safe_hint_type.DATE_TIME));
                // end;
                // p.biz_training_requests.&Set
                // (
                // k.Safe(TextBox_id.Text,PUNCTUATED).Trim(),
                // k.Safe(TextBox_nature.Text,PUNCTUATED).Trim(),
                // k.Safe(TextBox_dates.Text,PUNCTUATED).Trim(),
                // k.Safe(TextBox_conducting_agency.Text,ORG_NAME).Trim(),
                // k.Safe(TextBox_location.Text,PUNCTUATED).Trim(),
                // k.Safe(TextBox_cost_of_enrollment.Text,CURRENCY_USA).Trim(),
                // k.Safe(TextBox_cost_of_lodging.Text,CURRENCY_USA).Trim(),
                // k.Safe(TextBox_cost_of_meals.Text,CURRENCY_USA).Trim(),
                // k.Safe(TextBox_cost_of_transportation.Text,CURRENCY_USA).Trim(),
                // k.Safe(TextBox_reason.Text,PUNCTUATED).Trim(),
                // disposition_training_timestamp,
                // k.Safe(TextBox_disposition_training_member_id.Text,NUM).Trim(),
                // k.Safe(TextBox_disposition_training_funding_source.Text,NUM).Trim(),
                // k.Safe(TextBox_disposition_training_comments.Text,PUNCTUATED).Trim(),
                // disposition_squad_timestamp,
                // k.Safe(TextBox_disposition_squad_member_id.Text,NUM).Trim(),
                // CheckBox_disposition_squad_be_approved.checked,
                // k.Safe(TextBox_disposition_squad_comments.Text,PUNCTUATED).Trim(),
                // disposition_unit_timestamp,
                // k.Safe(TextBox_disposition_unit_member_id.Text,NUM).Trim(),
                // CheckBox_disposition_unit_be_approved.checked,
                // k.Safe(TextBox_disposition_unit_comments.Text,PUNCTUATED).Trim(),
                // disposition_division_timestamp,
                // k.Safe(TextBox_disposition_division_member_id.Text,NUM).Trim(),
                // CheckBox_disposition_division_be_approved.checked,
                // k.Safe(TextBox_disposition_division_comments.Text,PUNCTUATED).Trim(),
                // disposition_assistant_chief_timestamp,
                // k.Safe(TextBox_disposition_assistant_chief_member_id.Text,NUM).Trim(),
                // CheckBox_disposition_assistant_chief_be_approved.checked,
                // k.Safe(TextBox_disposition_assistant_chief_comments.Text,PUNCTUATED).Trim(),
                // payment_timestamp,
                // k.Safe(TextBox_payment_member_id.Text,NUM).Trim(),
                // CheckBox_payment_be_done.checked,
                // k.Safe(TextBox_payment_actual_amount.Text,CURRENCY_USA).Trim(),
                // k.Safe(TextBox_payment_comments.Text,PUNCTUATED).Trim(),
                // k.Safe(TextBox_status_code.Text,NUM).Trim(),
                // finalization_timestamp,
                // k.Safe(TextBox_member_id.Text,NUM).Trim(),
                // submission_timestamp
                // );
                Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
                SetLookupMode();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void DropDownList_id_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = 1;
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = Math.Max(1, (DropDownList_id.SelectedIndex - 1));
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = Math.Min((DropDownList_id.SelectedIndex + 1), (DropDownList_id.Items.Count - 1));
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = DropDownList_id.Items.Count - 1;
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
        {
            if (p.biz_training_requests.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.ALPHANUM)))
            {
                SetLookupMode();
            }
            else
            {
                Alert(k.alert_cause_type.APPDATA, k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.");
            }
        }

        protected void LinkButton_new_record_Click(object sender, System.EventArgs e)
        {
            Clear();
            TextBox_id.Text = "*";
            TextBox_id.Enabled = false;
            Button_lookup.Enabled = false;
            Label_lookup_arrow.Enabled = false;
            Label_lookup_hint.Enabled = false;
            LinkButton_reset.Enabled = true;
            LinkButton_new_record.Enabled = false;
            SetDependentFieldAblements(p.be_ok_to_config_training_requests);
            Button_submit.Enabled = p.be_ok_to_config_training_requests;
            Button_delete.Enabled = false;
            TextBox_id.Focus();
        }

        protected void LinkButton_reset_Click(object sender, System.EventArgs e)
        {
            SetLookupMode();
        }

        private void SetDependentFieldAblements(bool ablement)
        {
            TextBox_nature.Enabled = ablement;
            TextBox_dates.Enabled = ablement;
            TextBox_conducting_agency.Enabled = ablement;
            TextBox_location.Enabled = ablement;
            TextBox_cost_of_enrollment.Enabled = ablement;
            TextBox_cost_of_lodging.Enabled = ablement;
            TextBox_cost_of_meals.Enabled = ablement;
            TextBox_cost_of_transportation.Enabled = ablement;
            TextBox_reason.Enabled = ablement;
            TextBox_disposition_training_funding_source.Enabled = ablement;
            TextBox_disposition_training_comments.Enabled = ablement;
            CheckBox_disposition_squad_be_approved.Enabled = ablement;
            TextBox_disposition_squad_comments.Enabled = ablement;
            CheckBox_disposition_unit_be_approved.Enabled = ablement;
            TextBox_disposition_unit_comments.Enabled = ablement;
            CheckBox_disposition_division_be_approved.Enabled = ablement;
            TextBox_disposition_division_comments.Enabled = ablement;
            CheckBox_disposition_assistant_chief_be_approved.Enabled = ablement;
            TextBox_disposition_assistant_chief_comments.Enabled = ablement;
            CheckBox_payment_be_done.Enabled = ablement;
            TextBox_payment_actual_amount.Enabled = ablement;
            TextBox_payment_comments.Enabled = ablement;
        }

        protected void Button_lookup_Click(object sender, System.EventArgs e)
        {
            uint num_matches;
            string saved_id;
            saved_id = TextBox_id.Text;
            Clear();
            if (!PresentRecord(saved_id))
            {
                TextBox_id.Text = saved_id;
                p.biz_training_requests.Bind(saved_id, DropDownList_id);
                num_matches = (uint)(DropDownList_id.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
            }
          else
            {
            Literal_match_index.Text = "0";
            Literal_num_matches.Text = num_matches.ToString();
            Panel_match_numbers.Visible = true;
            LinkButton_go_to_match_prior.Visible = true;
            LinkButton_go_to_match_next.Visible = true;
            LinkButton_go_to_match_last.Visible = true;
            LinkButton_go_to_match_first.Visible = true;
            DropDownList_id.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public bool be_ok_to_config_training_requests;
            public TClass_biz_training_request_statuses biz_training_request_statuses;
            public TClass_biz_training_requests biz_training_requests;
            public mode_type mode;
        } // end p_type

    } // end TWebUserControl_training_request

    // Support types
    public enum mode_type
    {
        NONE,
        @NEW,
        CURRENT,
        OLD,
    } // end mode_type

}

namespace UserControl_training_request.Units
{
    public class UserControl_training_request
    {
    } // end UserControl_training_request

}

