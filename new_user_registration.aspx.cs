using Class_biz_users;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace new_user_registration
{
    public struct p_type
    {
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_new_user_registration: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_new_user_registration_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            switch(NatureOfVisit("new_user_registration.p"))
            {
                case nature_of_visit_type.VISIT_INITIAL:
                    Title.InnerText = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - new_user_registration";
                    p.biz_users = new TClass_biz_users();
                    Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                    Focus(TextBox_username, true);
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session["new_user_registration.p"]);
                    break;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("login.aspx");
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            string username;
            if (Page.IsValid)
            {
                username = kix.Units.kix.Safe(TextBox_username.Text, kix.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
                p.biz_users.RegisterNew(username, kix.Units.kix.Digest(kix.Units.kix.Safe(TextBox_nominal_password.Text, kix.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM)), kix.Units.kix.Safe(TextBox_email_address.Text, kix.safe_hint_type.EMAIL_ADDRESS));
                SessionSet("username", username);
                SessionSet("user_id", p.biz_users.IdOf(username));
                FormsAuthentication.RedirectFromLoginPage(username, false);
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void CustomValidator_email_address_novelty_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !p.biz_users.BeRegisteredEmailAddress(kix.Units.kix.Safe(args.Value, kix.safe_hint_type.EMAIL_ADDRESS));
        }

        protected void CustomValidator_email_address_domain_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = kix.Units.kix.BeValidDomainPartOfEmailAddress(args.Value);
        }

        protected void CustomValidator_username_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !p.biz_users.BeRegisteredUsername(kix.Units.kix.Safe(args.Value, kix.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        private void TWebForm_new_user_registration_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("new_user_registration.p", p);
        }

    } // end TWebForm_new_user_registration

}

namespace new_user_registration.Units
{
    public class new_user_registration
    {
    } // end new_user_registration

}

