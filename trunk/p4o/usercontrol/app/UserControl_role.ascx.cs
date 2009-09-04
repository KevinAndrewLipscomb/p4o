using Class_biz_members;
using Class_biz_role_member_map;
using Class_biz_roles;
using Class_biz_user;
using Class_db_role_member_map;
using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

namespace UserControl_role
{
    public partial class TWebUserControl_role: ki_web_ui.usercontrol_class
    {
        private p_type p;
        private void Clear()
        {
            TextBox_name.Text = kix.Units.kix.EMPTY;
            DropDownList_name.Visible = false;
            TextBox_pecking_order.Text = kix.Units.kix.EMPTY;
            TextBox_soft_hyphenation_text.Text = kix.Units.kix.EMPTY;
            LinkButton_go_to_match_prior.Visible = false;
            LinkButton_go_to_match_next.Visible = false;
            LinkButton_go_to_match_last.Visible = false;
            LinkButton_go_to_match_first.Visible = false;
            SetDependentFieldAblements(false);
            Button_submit.Enabled = false;
            Button_delete.Enabled = false;
            Anchor_quick_message_shortcut.Visible = false;
            Table_holders.Visible = false;
            Table_quick_message.Visible = false;

        }

        private void InjectPersistentClientSideScript()
        {
            // EstablishClientSideFunction(EL);
            // EstablishClientSideFunction(KGS_TO_LBS);
            // EstablishClientSideFunction(LBS_TO_KGS);
            // EstablishClientSideFunction
            // (
            // 'RecalculateDependentValues()',
            // kix.Units.kix.EMPTY
            // + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + kix.Units.kix.NEW_LINE
            // + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
            // +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
            // + kix.Units.kix.NEW_LINE
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
                Anchor_quick_message_shortcut.HRef = Page.Request.RawUrl + "#QuickMessage";
                if (!(Session["mode:report"] != null))
                {
                    Label_author_email_address.Text = p.biz_user.EmailAddress();
                    if (kix.Units.kix.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices"))
                    {
                        LinkButton_new_record.Visible = p.be_ok_to_config_roles;
                        TableRow_pecking_order.Visible = true;
                        TableRow_soft_hyphenation_text.Visible = true;
                    }
                }
                else
                {
                    TextBox_quick_message_subject.Enabled = false;
                    TextBox_quick_message_body.Enabled = false;
                    RequiredFieldValidator_quick_message_body.Enabled = false;
                    Button_send.Enabled = false;
                }
                LinkButton_go_to_match_first.Text = kix.Units.kix.ExpandTildePath(LinkButton_go_to_match_first.Text);
                LinkButton_go_to_match_prior.Text = kix.Units.kix.ExpandTildePath(LinkButton_go_to_match_prior.Text);
                LinkButton_go_to_match_next.Text = kix.Units.kix.ExpandTildePath(LinkButton_go_to_match_next.Text);
                LinkButton_go_to_match_last.Text = kix.Units.kix.ExpandTildePath(LinkButton_go_to_match_last.Text);
                RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
                Focus(TextBox_name, true);
                p.be_loaded = true;
            }
            InjectPersistentClientSideScript();

        }

        private bool PresentRecord(string name)
        {
            bool result;
            string soft_hyphenation_text;
            string pecking_order;
            result = false;
            if (p.biz_roles.Get(name, out soft_hyphenation_text, out pecking_order))
            {
                TextBox_name.Text = name;
                TextBox_soft_hyphenation_text.Text = soft_hyphenation_text;
                TextBox_pecking_order.Text = pecking_order;
                TextBox_name.Enabled = false;
                Button_lookup.Enabled = false;
                Label_lookup_arrow.Enabled = false;
                Label_lookup_hint.Enabled = false;
                LinkButton_reset.Enabled = true;
                SetDependentFieldAblements(p.be_ok_to_config_roles);
                Button_submit.Enabled = p.be_ok_to_config_roles;
                Button_delete.Enabled = p.be_ok_to_config_roles;
                BindHolders(name);
                result = true;
            }
            return result;
        }

        private void SetLookupMode()
        {
            Clear();
            TextBox_name.Enabled = true;
            Button_lookup.Enabled = true;
            Label_lookup_arrow.Enabled = true;
            Label_lookup_hint.Enabled = true;
            LinkButton_reset.Enabled = false;
            LinkButton_new_record.Enabled = p.be_ok_to_config_roles;
            Focus(TextBox_name, true);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_role.p"] != null)
            {
                p = (p_type)(Session["UserControl_role.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_role");
            }
            else
            {
                p.be_loaded = false;
                p.biz_members = new TClass_biz_members();
                p.biz_role_member_map = new TClass_biz_role_member_map();
                p.biz_roles = new TClass_biz_roles();
                p.biz_user = new TClass_biz_user();
                p.be_gridview_empty = true;
                p.be_ok_to_config_roles = kix.Units.kix.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices");
                p.be_sort_order_ascending = true;
                p.distribution_list = kix.Units.kix.EMPTY;
                p.num_gridview_rows = 0;
                p.role_name = kix.Units.kix.EMPTY;
                p.sort_order = "member_name%";
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.GridView_holders.Sorting += new System.Web.UI.WebControls.GridViewSortEventHandler(this.GridView_holders_Sorting);
            this.GridView_holders.RowDataBound += new System.Web.UI.WebControls.GridViewRowEventHandler(this.GridView_holders_RowDataBound);
            this.GridView_holders.RowCreated += new System.Web.UI.WebControls.GridViewRowEventHandler(this.GridView_holders_RowCreated);
            this.PreRender += this.TWebUserControl_role_PreRender;
            this.Load += this.Page_Load;
        }

        private void TWebUserControl_role_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_role.p", p);
        }

        public TWebUserControl_role Fresh()
        {
            TWebUserControl_role result;
            Session.Remove("UserControl_role.p");
            result = this;
            return result;
        }

        private void GridView_holders_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e)
        {
            if (e.SortExpression == p.sort_order)
            {
                p.be_sort_order_ascending = !p.be_sort_order_ascending;
            }
            else
            {
                p.sort_order = e.SortExpression;
                p.be_sort_order_ascending = true;
            }
            GridView_holders.EditIndex =  -1;
            BindHolders(p.role_name);
        }

        private void GridView_holders_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            e.Row.Cells[Class_db_role_member_map.Units.Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].Visible = false;
        }

        private void GridView_holders_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.Cells[Class_db_role_member_map.Units.Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].Text != "&nbsp;"))
            {
                p.distribution_list = p.distribution_list + e.Row.Cells[Class_db_role_member_map.Units.Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].Text + kix.Units.kix.COMMA_SPACE;
                p.num_gridview_rows = p.num_gridview_rows + 1;
            }
        }

        protected void Button_send_Click(object sender, System.EventArgs e)
        {
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
           kix.Units.kix.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], Label_distribution_list.Text, TextBox_quick_message_subject.Text, "-- From " + p.biz_user.Roles()[0] + kix.Units.kix.SPACE + p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()) + kix.Units.kix.SPACE + p.biz_members.LastNameOfMemberId(Session["member_id"].ToString()) + " (" + p.biz_user.EmailAddress() + ") [via " + ConfigurationManager.AppSettings["application_name"] + "]" + kix.Units.kix.NEW_LINE + kix.Units.kix.NEW_LINE + TextBox_quick_message_body.Text, false, kix.Units.kix.EMPTY, p.biz_user.EmailAddress(), p.biz_user.EmailAddress());
            TextBox_quick_message_subject.Text = kix.Units.kix.EMPTY;
            TextBox_quick_message_body.Text = kix.Units.kix.EMPTY;
            Alert(kix.alert_cause_type.LOGIC, kix.alert_state_type.NORMAL, "messagsnt", "Message sent", true);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_roles.Set(kix.Units.kix.Safe(TextBox_name.Text, kix.safe_hint_type.HUMAN_NAME).Trim(), kix.Units.kix.Safe(TextBox_soft_hyphenation_text.Text, kix.safe_hint_type.PUNCTUATED).Trim(), kix.Units.kix.Safe(TextBox_pecking_order.Text, kix.safe_hint_type.NUM).Trim());
                Alert(kix.alert_cause_type.USER, kix.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
                SetLookupMode();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void DropDownList_name_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.role_name = kix.Units.kix.Safe(DropDownList_name.SelectedValue, kix.safe_hint_type.HUMAN_NAME);
            PresentRecord(p.role_name);
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_name.SelectedIndex = 1;
            PresentRecord(kix.Units.kix.Safe(DropDownList_name.SelectedValue, kix.safe_hint_type.HUMAN_NAME));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_name.SelectedIndex = Math.Max(1, (DropDownList_name.SelectedIndex - 1));
            PresentRecord(kix.Units.kix.Safe(DropDownList_name.SelectedValue, kix.safe_hint_type.HUMAN_NAME));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_name.SelectedIndex = Math.Min((DropDownList_name.SelectedIndex + 1), (DropDownList_name.Items.Count - 1));
            PresentRecord(kix.Units.kix.Safe(DropDownList_name.SelectedValue, kix.safe_hint_type.HUMAN_NAME));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_name.SelectedIndex = DropDownList_name.Items.Count - 1;
            PresentRecord(kix.Units.kix.Safe(DropDownList_name.SelectedValue, kix.safe_hint_type.HUMAN_NAME));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
        {
            if (p.biz_roles.Delete(kix.Units.kix.Safe(TextBox_name.Text, kix.safe_hint_type.HUMAN_NAME)))
            {
                SetLookupMode();
            }
            else
            {
                Alert(kix.alert_cause_type.APPDATA, kix.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
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
            SetDependentFieldAblements(p.be_ok_to_config_roles);
            Button_submit.Enabled = p.be_ok_to_config_roles;
            Button_delete.Enabled = false;
            Focus(TextBox_name, true);
        }

        protected void LinkButton_reset_Click(object sender, System.EventArgs e)
        {
            SetLookupMode();
        }

        private void SetDependentFieldAblements(bool ablement)
        {
            TextBox_pecking_order.Enabled = ablement;
            TextBox_soft_hyphenation_text.Enabled = ablement;
        }

        protected void Button_lookup_Click(object sender, System.EventArgs e)
        {
            uint num_matches;
            string saved_name;
            saved_name = TextBox_name.Text;
            Clear();
            if (!PresentRecord(saved_name))
            {
                TextBox_name.Text = saved_name;
                p.biz_roles.Bind(saved_name, DropDownList_name);
                num_matches = (uint)(DropDownList_name.Items.Count);
                if (num_matches > 0)
                {
                    LinkButton_go_to_match_prior.Visible = true;
                    LinkButton_go_to_match_next.Visible = true;
                    LinkButton_go_to_match_last.Visible = true;
                    LinkButton_go_to_match_first.Visible = true;
                    DropDownList_name.Visible = true;
                    if (num_matches == 1)
                    {
                        PresentRecord(kix.Units.kix.Safe(DropDownList_name.SelectedValue, kix.safe_hint_type.HUMAN_NAME));
                    }
                    else
                    {
                        DropDownList_name.Items.Insert(0, new ListItem("-- Select --", kix.Units.kix.EMPTY));
                    }
                }
            }
        }

        private void BindHolders(string role_name)
        {
            bool be_user_authorized_to_send_quickmessages;
            p.biz_role_member_map.BindHolders(role_name, GridView_holders, p.sort_order, p.be_sort_order_ascending);
            p.be_gridview_empty = (p.num_gridview_rows == 0);
            Table_holders.Visible = !p.be_gridview_empty;
            Label_distribution_list.Text = (p.distribution_list + kix.Units.kix.SPACE).TrimEnd(new char[] {kix.Units.kix.COMMA, kix.Units.kix.SPACE});
            Label_num_rows.Text = p.num_gridview_rows.ToString();
            be_user_authorized_to_send_quickmessages = kix.Units.kix.Has((string[])(Session["privilege_array"]), "send-quickmessages") && !p.be_gridview_empty;
            Anchor_quick_message_shortcut.Visible = be_user_authorized_to_send_quickmessages;
            Table_quick_message.Visible = be_user_authorized_to_send_quickmessages;
            // Clear aggregation vars for next bind, if any.
            p.distribution_list = kix.Units.kix.EMPTY;
            p.num_gridview_rows = 0;

        }

        private struct p_type
        {
            public bool be_gridview_empty;
            public bool be_loaded;
            public bool be_ok_to_config_roles;
            public bool be_sort_order_ascending;
            public TClass_biz_members biz_members;
            public TClass_biz_role_member_map biz_role_member_map;
            public TClass_biz_roles biz_roles;
            public TClass_biz_user biz_user;
            public string distribution_list;
            public uint num_gridview_rows;
            public string role_name;
            public string sort_order;
        } // end p_type

    } // end TWebUserControl_role

}

namespace UserControl_role.Units
{
    public class UserControl_role
    {
    } // end UserControl_role

}

