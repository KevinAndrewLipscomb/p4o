using kix;

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_members;
using Class_biz_squads;
using UserControl_drop_down_date;
using System.Collections.Specialized;
namespace UserControl_member
{
    public partial class TWebUserControl_member: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator_squad = null;
        private void Clear()
        {
            TextBox_last_name.Text = k.EMPTY;
            TextBox_first_name.Text = k.EMPTY;
            TextBox_email_address.Text = k.EMPTY;
            TextBox_registration_code.Text = k.EMPTY;
            DropDownList_registration_code.Visible = false;
            DropDownList_squad.ClearSelection();
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
                LinkButton_new_record.Visible = p.be_ok_to_config_members;
                p.biz_squads.BindDirectToListControl(DropDownList_squad);
                LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
                LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
                LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
                LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
                RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
                Focus(TextBox_registration_code, true);
                p.be_loaded = true;
            }
            InjectPersistentClientSideScript();

        }

        private bool PresentRecord(string registration_code)
        {
            bool result;
            string last_name;
            string first_name;
            string email_address;
            string squad_id;
            result = false;
            if (p.biz_members.Get(out last_name, out first_name, out email_address, registration_code, out squad_id))
            {
                TextBox_last_name.Text = last_name;
                TextBox_first_name.Text = first_name;
                TextBox_email_address.Text = email_address;
                TextBox_registration_code.Text = registration_code;
                DropDownList_squad.SelectedValue = squad_id;
                TextBox_registration_code.Enabled = false;
                Button_lookup.Enabled = false;
                Label_lookup_arrow.Enabled = false;
                Label_lookup_hint.Enabled = false;
                LinkButton_reset.Enabled = true;
                SetDependentFieldAblements(p.be_ok_to_config_members);
                Button_submit.Enabled = p.be_ok_to_config_members;
                Button_delete.Enabled = p.be_ok_to_config_members;
                result = true;
            }
            return result;
        }

        private void SetLookupMode()
        {
            Clear();
            TextBox_registration_code.Enabled = true;
            Button_lookup.Enabled = true;
            Label_lookup_arrow.Enabled = true;
            Label_lookup_hint.Enabled = true;
            LinkButton_reset.Enabled = false;
            LinkButton_new_record.Enabled = p.be_ok_to_config_members;
            Focus(TextBox_registration_code, true);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_member.p"] != null)
            {
                p = (p_type)(Session["UserControl_member.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_UserControl_config_PlaceHolder_content"] as string) == "UserControl_member");
            }
            else
            {
                p.be_loaded = false;
                p.biz_members = new TClass_biz_members();
                p.biz_squads = new TClass_biz_squads();
                p.be_ok_to_config_members = k.Has((string[])(Session["privilege_array"]), "config-members");
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_member_PreRender;
        }

        private void TWebUserControl_member_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_member.p", p);
        }

        public TWebUserControl_member Fresh()
        {
            TWebUserControl_member result;
            Session.Remove("UserControl_member.p");
            result = this;
            return result;
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_members.Set(k.Safe(TextBox_last_name.Text, k.safe_hint_type.HUMAN_NAME).Trim(), k.Safe(TextBox_first_name.Text, k.safe_hint_type.HUMAN_NAME).Trim(), k.Safe(TextBox_email_address.Text, k.safe_hint_type.EMAIL_ADDRESS).Trim(), k.Safe(TextBox_registration_code.Text, k.safe_hint_type.ALPHANUM).Trim(), k.Safe(DropDownList_squad.SelectedValue, k.safe_hint_type.NUM).Trim());
                Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
                SetLookupMode();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void CustomValidator_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = k.BeValidDomainPartOfEmailAddress(k.Safe(TextBox_email_address.Text, k.safe_hint_type.EMAIL_ADDRESS));
        }

        protected void DropDownList_registration_code_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            PresentRecord(k.Safe(DropDownList_registration_code.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_registration_code.SelectedIndex = 1;
            PresentRecord(k.Safe(DropDownList_registration_code.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_registration_code.SelectedIndex = Math.Max(1, (DropDownList_registration_code.SelectedIndex - 1));
            PresentRecord(k.Safe(DropDownList_registration_code.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_registration_code.SelectedIndex = Math.Min((DropDownList_registration_code.SelectedIndex + 1), (DropDownList_registration_code.Items.Count - 1));
            PresentRecord(k.Safe(DropDownList_registration_code.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_registration_code.SelectedIndex = DropDownList_registration_code.Items.Count - 1;
            PresentRecord(k.Safe(DropDownList_registration_code.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
        {
            if (p.biz_members.Delete(k.Safe(TextBox_registration_code.Text, k.safe_hint_type.ALPHANUM)))
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
            Button_lookup.Enabled = false;
            Label_lookup_arrow.Enabled = false;
            Label_lookup_hint.Enabled = false;
            LinkButton_reset.Enabled = true;
            LinkButton_new_record.Enabled = false;
            SetDependentFieldAblements(p.be_ok_to_config_members);
            Button_submit.Enabled = p.be_ok_to_config_members;
            Button_delete.Enabled = false;
            Focus(TextBox_registration_code, true);
        }

        protected void LinkButton_reset_Click(object sender, System.EventArgs e)
        {
            SetLookupMode();
        }

        private void SetDependentFieldAblements(bool ablement)
        {
            TextBox_last_name.Enabled = ablement;
            TextBox_first_name.Enabled = ablement;
            TextBox_email_address.Enabled = ablement;
            DropDownList_squad.Enabled = ablement;
        }

        protected void Button_lookup_Click(object sender, System.EventArgs e)
        {
            uint num_matches;
            string saved_registration_code;
            saved_registration_code = TextBox_registration_code.Text;
            Clear();
            if (!PresentRecord(saved_registration_code))
            {
                TextBox_registration_code.Text = saved_registration_code;
                p.biz_members.Bind(saved_registration_code, DropDownList_registration_code);
                num_matches = (uint)(DropDownList_registration_code.Items.Count);
                if (num_matches > 0)
                {
                    LinkButton_go_to_match_prior.Visible = true;
                    LinkButton_go_to_match_next.Visible = true;
                    LinkButton_go_to_match_last.Visible = true;
                    LinkButton_go_to_match_first.Visible = true;
                    DropDownList_registration_code.Visible = true;
                    if (num_matches == 1)
                    {
                        PresentRecord(k.Safe(DropDownList_registration_code.SelectedValue, k.safe_hint_type.ALPHANUM));
                    }
                    else
                    {
                        DropDownList_registration_code.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
                    }
                }
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public bool be_ok_to_config_members;
            public TClass_biz_members biz_members;
            public TClass_biz_squads biz_squads;
        } // end p_type

    } // end TWebUserControl_member

}

namespace UserControl_member.Units
{
    public class UserControl_member
    {
    } // end UserControl_member

}

