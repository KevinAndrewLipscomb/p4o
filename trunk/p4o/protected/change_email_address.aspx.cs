using kix;
using Class_biz_user;
using Class_biz_users;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace change_email_address
{
    public struct p_type
    {
        public TClass_biz_user biz_user;
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_change_email_address: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_email_address_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string email_address;
            switch(NatureOfVisit(InstanceId() + ".p"))
            {
                case nature_of_visit_type.VISIT_INITIAL:
                    Title = ConfigurationManager.AppSettings["application_name"] + " - change_email_address";
                    p.biz_user = new TClass_biz_user();
                    p.biz_users = new TClass_biz_users();
                    // Preload email address fields
                    email_address = p.biz_users.SelfEmailAddress();
                    TextBox_nominal_email_address.Text = email_address;
                    TextBox_confirmation_email_address.Text = email_address;
                    Focus(TextBox_nominal_email_address, true);
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session[InstanceId() + ".p"]);
                    break;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void CustomValidator_confirmation_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = (TextBox_nominal_email_address.Text.Trim() == TextBox_confirmation_email_address.Text.Trim());
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        private void TWebForm_change_email_address_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        protected void CustomValidator_nominal_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = k.BeValidDomainPartOfEmailAddress(args.Value);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_users.SetEmailAddress(p.biz_user.IdNum(), k.Safe(TextBox_nominal_email_address.Text.Trim(), k.safe_hint_type.EMAIL_ADDRESS));
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

    } // end TWebForm_change_email_address

}

namespace change_email_address.Units
{
    public class change_email_address
    {
    } // end change_email_address

}

