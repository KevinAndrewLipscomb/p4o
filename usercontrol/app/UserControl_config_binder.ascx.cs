using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using UserControl_business_objects_binder;
using UserControl_member;
using UserControl_roles_and_matrices_binder;
using UserControl_users_and_mapping_binder;

namespace UserControl_config_binder
{
    public class TWebUserControl_config_binder: ki_web_ui.usercontrol_class
    {
        protected System.Web.UI.WebControls.PlaceHolder PlaceHolder_content = null;
        protected AjaxControlToolkit.TabContainer TabContainer_control = null;
        protected AjaxControlToolkit.TabPanel TabPanel_business_objects = null;
        protected AjaxControlToolkit.TabPanel TabPanel_members = null;
        protected AjaxControlToolkit.TabPanel TabPanel_users_and_mappings = null;
        private p_type p;
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabPanel_business_objects.Enabled = k.Has((string[])(Session["privilege_array"]), "config-business-objects");
                TabPanel_members.Enabled = k.Has((string[])(Session["privilege_array"]), "config-members");
                TabPanel_users_and_mappings.Enabled = k.Has((string[])(Session["privilege_array"]), "config-users");
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_config_binder.p"] != null)
            {
                p = (p_type)(Session["UserControl_config_binder.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_config_binder");
                switch(p.tab_index)
                {
                    case Units.UserControl_config_binder.TSSI_ROLES_AND_MATRICES:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx"))), "UserControl_roles_and_matrices_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_config_binder.TSSI_USERS_AND_MAPPING:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_users_and_mapping_binder)(LoadControl("~/usercontrol/app/UserControl_users_and_mapping_binder.ascx"))), "UserControl_users_and_mapping_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_config_binder.TSSI_MEMBERS:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_member)(LoadControl("~/usercontrol/app/UserControl_member.ascx"))), "UserControl_member", PlaceHolder_content);
                        break;
                    case Units.UserControl_config_binder.TSSI_BUSINESS_OBJECTS_BINDER:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_business_objects_binder)(LoadControl("~/usercontrol/app/UserControl_business_objects_binder.ascx"))), "UserControl_business_objects_binder", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_config_binder.TSSI_ROLES_AND_MATRICES;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx"))).Fresh(), "UserControl_roles_and_matrices_binder", PlaceHolder_content);
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_config_binder_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_config_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet("UserControl_config_binder.p", p);

        }

        public TWebUserControl_config_binder Fresh()
        {
            TWebUserControl_config_binder result;
            Session.Remove("UserControl_config_binder.p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_config_binder.TSSI_ROLES_AND_MATRICES:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx"))).Fresh(), "UserControl_roles_and_matrices_binder", PlaceHolder_content);
                    break;
                case Units.UserControl_config_binder.TSSI_USERS_AND_MAPPING:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_users_and_mapping_binder)(LoadControl("~/usercontrol/app/UserControl_users_and_mapping_binder.ascx"))).Fresh(), "UserControl_users_and_mapping_binder", PlaceHolder_content);
                    break;
                case Units.UserControl_config_binder.TSSI_MEMBERS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_member)(LoadControl("~/usercontrol/app/UserControl_member.ascx"))).Fresh(), "UserControl_member", PlaceHolder_content);
                    break;
                case Units.UserControl_config_binder.TSSI_BUSINESS_OBJECTS_BINDER:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_business_objects_binder)(LoadControl("~/usercontrol/app/UserControl_business_objects_binder.ascx"))).Fresh(), "UserControl_business_objects_binder", PlaceHolder_content);
                    break;
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public string content_id;
            public uint tab_index;
        } // end p_type

    } // end TWebUserControl_config_binder

}

namespace UserControl_config_binder.Units
{
    public class UserControl_config_binder
    {
        public const int TSSI_ROLES_AND_MATRICES = 0;
        public const int TSSI_USERS_AND_MAPPING = 1;
        public const int TSSI_MEMBERS = 2;
        public const int TSSI_BUSINESS_OBJECTS_BINDER = 3;
    } // end UserControl_config_binder

}

