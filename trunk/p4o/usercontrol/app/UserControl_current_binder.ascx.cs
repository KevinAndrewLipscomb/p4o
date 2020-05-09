using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using UserControl_training_request;

namespace UserControl_current_binder
{
    public struct p_type
    {
        public bool be_loaded;
        public string content_id;
        public uint tab_index;
    } // end p_type

    public class TWebUserControl_current_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected AjaxControlToolkit.TabContainer TabContainer_control = null;
        protected System.Web.UI.WebControls.PlaceHolder PlaceHolder_content = null;
        protected TWebUserControl_training_request UserControl_training_request_control = null;
        // TSSI_INTERNAL_REQUISITION = 2;
        // TSSI_LATERAL_TANSFER_REQUEST = 3;
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            UserControl_training_request_control = ((TWebUserControl_training_request)(LoadControl("~/usercontrol/app/UserControl_training_request.ascx")));
            if (Session[InstanceId() + ".p"] != null)
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_current_binder");
                if ((Session["UserControl_current_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_current_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_current_binder_selected_tab");
                }
                switch(p.tab_index)
                {
                    case Units.UserControl_current_binder.TSSI_TRAINING_REQUEST:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_training_request_control, "UserControl_training_request", PlaceHolder_content);
                        UserControl_training_request_control.mode = UserControl_training_request.mode_type.CURRENT;
                        break;
                // TSSI_INTERNAL_REQUISITION:
                // p.content_id := AddIdentifiedControlToPlaceHolder
                // (
                // TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')),
                // 'UserControl2',
                // PlaceHolder_content
                // );
                // TSSI_LATERAL_TANSFER_REQUEST:
                // p.content_id := AddIdentifiedControlToPlaceHolder
                // (
                // TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')),
                // 'UserControl3',
                // PlaceHolder_content
                // );
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_current_binder.TSSI_TRAINING_REQUEST;
                p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_training_request_control,"UserControl_training_request",PlaceHolder_content,InstanceId());
                UserControl_training_request_control.mode = UserControl_training_request.mode_type.CURRENT;
            }

        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_current_binder.TSSI_TRAINING_REQUEST:
                    p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_training_request_control, "UserControl_training_request", PlaceHolder_content);
                    UserControl_training_request_control.mode = UserControl_training_request.mode_type.CURRENT;
                    break;
            // TSSI_INTERNAL_REQUISITION:
            // p.content_id := AddIdentifiedControlToPlaceHolder
            // (
            // TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')).Fresh,
            // 'UserControl2',
            // PlaceHolder_content
            // );
            // TSSI_LATERAL_TANSFER_REQUEST:
            // p.content_id := AddIdentifiedControlToPlaceHolder
            // (
            // TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')).Fresh,
            // 'UserControl3',
            // PlaceHolder_content
            // );
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_current_binder_PreRender;
        }

        private void TWebUserControl_current_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet(InstanceId() + ".p", p);

        }

        public TWebUserControl_current_binder Fresh()
        {
            TWebUserControl_current_binder result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    } // end TWebUserControl_current_binder

}

namespace UserControl_current_binder.Units
{
    public class UserControl_current_binder
    {
        public const int TSSI_TIME_AND_ATTENDANCE_RECORD = 0;
        public const int TSSI_TRAINING_REQUEST = 1;
    } // end UserControl_current_binder

}

