using kix;

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using UserControl_about;
using UserControl_config_binder;
using UserControl_current_binder;
using UserControl_new_binder;

namespace UserControl_member_binder
{
    public class TWebUserControl_member_binder: ki_web_ui.usercontrol_class
    {
        protected System.Web.UI.WebControls.PlaceHolder PlaceHolder_content = null;
        protected AjaxControlToolkit.TabContainer TabContainer_control = null;
        protected AjaxControlToolkit.TabPanel TabPanel_new = null;
        protected AjaxControlToolkit.TabPanel TabPanel_current = null;
        protected AjaxControlToolkit.TabPanel TabPanel_old = null;
        protected AjaxControlToolkit.TabPanel TabPanel_config = null;
        private p_type p;
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                if (k.Has((string[])(Session["privilege_array"]), "config-users") || k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices"))
                {
                    TabPanel_config.Enabled = true;
                }
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                switch(p.tab_index)
                {
                    case Units.UserControl_member_binder.TSSI_NEW:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_new_binder)(LoadControl("~/usercontrol/app/UserControl_new_binder.ascx"))), "UserControl_new_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_member_binder.TSSI_CURRENT:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_current_binder)(LoadControl("~/usercontrol/app/UserControl_current_binder.ascx"))), "UserControl_current_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_member_binder.TSSI_CONFIG:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx"))), "UserControl_config", PlaceHolder_content);
                        break;
                    case Units.UserControl_member_binder.TSSI_ABOUT:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx"))), "UserControl_about", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_member_binder.TSSI_NEW;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_new_binder)(LoadControl("~/usercontrol/app/UserControl_new_binder.ascx"))),"UserControl_new_binder",PlaceHolder_content,InstanceId());
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_member_binder_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_member_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet(InstanceId() + ".p", p);

        }

        public TWebUserControl_member_binder Fresh()
        {
            TWebUserControl_member_binder result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_member_binder.TSSI_NEW:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_new_binder)(LoadControl("~/usercontrol/app/UserControl_new_binder.ascx"))),"UserControl_new_binder",PlaceHolder_content,InstanceId());
                    break;
                case Units.UserControl_member_binder.TSSI_CURRENT:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_current_binder)(LoadControl("~/usercontrol/app/UserControl_current_binder.ascx"))),"UserControl_current_binder",PlaceHolder_content,InstanceId());
                    break;
                case Units.UserControl_member_binder.TSSI_CONFIG:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx"))),"UserControl_config",PlaceHolder_content,InstanceId());
                    break;
                case Units.UserControl_member_binder.TSSI_ABOUT:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx"))),"UserControl_about",PlaceHolder_content,InstanceId());
                    break;
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public string content_id;
            public uint tab_index;
        } // end p_type

    } // end TWebUserControl_member_binder

}

namespace UserControl_member_binder.Units
{
    public class UserControl_member_binder
    {
        public const int TSSI_NEW = 0;
        public const int TSSI_CURRENT = 1;
        public const int TSSI_OLD = 2;
        public const int TSSI_CONFIG = 3;
        public const int TSSI_ABOUT = 4;
    } // end UserControl_member_binder

}

