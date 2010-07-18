using kix;

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_squads;
using Class_biz_units;
using UserControl_drop_down_date;
using System.Collections.Specialized;
namespace UserControl_squad
{
    public partial class TWebUserControl_squad: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        private void Clear()
        {
            TextBox_id.Text = k.EMPTY;
            DropDownList_spec.Visible = false;
            TextBox_description.Text = k.EMPTY;
            DropDownList_unit.ClearSelection();
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
                LinkButton_new_record.Visible = p.be_ok_to_config_squads;
                p.biz_units.BindDirectToListControl(DropDownList_unit);
                LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
                LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
                LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
                LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
                RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
                Focus(TextBox_id, true);
                p.be_loaded = true;
            }
            InjectPersistentClientSideScript();

        }

        private bool PresentRecord(string id)
        {
        Literal_match_index.Text = DropDownList_spec.SelectedIndex.ToString();
            bool result;
            string description;
            string unit_id;
            result = false;
            if (p.biz_squads.Get(id, out description, out unit_id))
            {
                TextBox_id.Text = id;
                TextBox_description.Text = description;
                DropDownList_unit.SelectedValue = unit_id;
                TextBox_id.Enabled = false;
                Button_lookup.Enabled = false;
                Label_lookup_arrow.Enabled = false;
                Label_lookup_hint.Enabled = false;
                LinkButton_reset.Enabled = true;
                SetDependentFieldAblements(p.be_ok_to_config_squads);
                Button_submit.Enabled = p.be_ok_to_config_squads;
                Button_delete.Enabled = p.be_ok_to_config_squads;
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
            LinkButton_new_record.Enabled = p.be_ok_to_config_squads;
            Focus(TextBox_id, true);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_squad.p"] != null)
            {
                p = (p_type)(Session["UserControl_squad.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content"] as string) == "UserControl_squad");
            }
            else
            {
                p.be_loaded = false;
                p.biz_squads = new TClass_biz_squads();
                p.biz_units = new TClass_biz_units();
                p.be_ok_to_config_squads = k.Has((string[])(Session["privilege_array"]), "config-squads");
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebUserControl_squad_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_squad_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_squad.p", p);
        }

        public TWebUserControl_squad Fresh()
        {
            TWebUserControl_squad result;
            Session.Remove("UserControl_squad.p");
            result = this;
            return result;
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_squads.Set(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM), k.Safe(TextBox_description.Text, k.safe_hint_type.PUNCTUATED), k.Safe(DropDownList_unit.SelectedValue, k.safe_hint_type.NUM));
                Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
                SetLookupMode();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void DropDownList_code_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            PresentRecord(k.Safe(DropDownList_spec.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_spec.SelectedIndex = 1;
            PresentRecord(k.Safe(DropDownList_spec.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_spec.SelectedIndex = Math.Max(1, (DropDownList_spec.SelectedIndex - 1));
            PresentRecord(k.Safe(DropDownList_spec.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_spec.SelectedIndex = Math.Min((DropDownList_spec.SelectedIndex + 1), (DropDownList_spec.Items.Count - 1));
            PresentRecord(k.Safe(DropDownList_spec.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_spec.SelectedIndex = DropDownList_spec.Items.Count - 1;
            PresentRecord(k.Safe(DropDownList_spec.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
        {
            if (p.biz_squads.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.ALPHANUM)))
            {
                SetLookupMode();
            }
            else
            {
                Alert(k.alert_cause_type.APPDATA, k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
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
            SetDependentFieldAblements(p.be_ok_to_config_squads);
            Button_submit.Enabled = p.be_ok_to_config_squads;
            Button_delete.Enabled = false;
            Focus(TextBox_id, true);
        }

        protected void LinkButton_reset_Click(object sender, System.EventArgs e)
        {
            SetLookupMode();
        }

        private void SetDependentFieldAblements(bool ablement)
        {
            TextBox_description.Enabled = ablement;
            DropDownList_unit.Enabled = ablement;
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
                p.biz_squads.Bind(saved_id, DropDownList_spec);
                num_matches = (uint)(DropDownList_spec.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_spec.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_spec.SelectedValue, k.safe_hint_type.NUM));
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
            DropDownList_spec.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public bool be_ok_to_config_squads;
            public TClass_biz_squads biz_squads;
            public TClass_biz_units biz_units;
        } // end p_type

    } // end TWebUserControl_squad

}

namespace UserControl_squad.Units
{
    public class UserControl_squad
    {
    } // end UserControl_squad

}

