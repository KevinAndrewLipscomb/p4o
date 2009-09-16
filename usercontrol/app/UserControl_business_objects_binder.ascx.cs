using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_bureau;
using UserControl_division;
using UserControl_squad;
using UserControl_unit;

namespace UserControl_business_objects_binder
{
    public class TWebUserControl_business_objects_binder: ki_web_ui.usercontrol_class
    {
        protected AjaxControlToolkit.TabContainer TabContainer_control = null;
        protected System.Web.UI.WebControls.PlaceHolder PlaceHolder_content = null;
        private p_type p;
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
            if (Session["UserControl_business_objects_binder.p"] != null)
            {
                p = (p_type)(Session["UserControl_business_objects_binder.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_config_PlaceHolder_content"] as string) == "UserControl_business_objects_binder");
                if ((Session["UserControl_business_objects_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_business_objects_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_business_objects_binder_selected_tab");
                // Make sure set "TabContainer_control.ActiveTabIndex := p.tab_index;" in Page_Load, then delete this region.
                }
                switch(p.tab_index)
                {
                    case Units.UserControl_business_objects_binder.TSSI_SQUAD:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_squad)(LoadControl("~/usercontrol/app/UserControl_squad.ascx"))), "UserControl_squad", PlaceHolder_content);
                        break;
                    case Units.UserControl_business_objects_binder.TSSI_UNIT:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_unit)(LoadControl("~/usercontrol/app/UserControl_unit.ascx"))), "UserControl_unit", PlaceHolder_content);
                        break;
                    case Units.UserControl_business_objects_binder.TSSI_DIVISION:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_division)(LoadControl("~/usercontrol/app/UserControl_division.ascx"))), "UserControl_division", PlaceHolder_content);
                        break;
                    case Units.UserControl_business_objects_binder.TSSI_BUREAU:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_bureau)(LoadControl("~/usercontrol/app/UserControl_bureau.ascx"))), "UserControl_bureau", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_business_objects_binder.TSSI_SQUAD;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_squad)(LoadControl("~/usercontrol/app/UserControl_squad.ascx"))).Fresh(), "UserControl_squad", PlaceHolder_content);
            }

        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_business_objects_binder.TSSI_SQUAD:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_squad)(LoadControl("~/usercontrol/app/UserControl_squad.ascx"))).Fresh(), "UserControl_squad", PlaceHolder_content);
                    break;
                case Units.UserControl_business_objects_binder.TSSI_UNIT:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_unit)(LoadControl("~/usercontrol/app/UserControl_unit.ascx"))).Fresh(), "UserControl_unit", PlaceHolder_content);
                    break;
                case Units.UserControl_business_objects_binder.TSSI_DIVISION:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_division)(LoadControl("~/usercontrol/app/UserControl_division.ascx"))).Fresh(), "UserControl_division", PlaceHolder_content);
                    break;
                case Units.UserControl_business_objects_binder.TSSI_BUREAU:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_bureau)(LoadControl("~/usercontrol/app/UserControl_bureau.ascx"))).Fresh(), "UserControl_bureau", PlaceHolder_content);
                    break;
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_business_objects_binder_PreRender;
        }

        private void TWebUserControl_business_objects_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet("UserControl_business_objects_binder.p", p);

        }

        public TWebUserControl_business_objects_binder Fresh()
        {
            TWebUserControl_business_objects_binder result;
            Session.Remove("UserControl_business_objects_binder.p");
            result = this;
            return result;
        }

        private struct p_type
        {
            public bool be_loaded;
            public string content_id;
            public uint tab_index;
        } // end p_type

    } // end TWebUserControl_business_objects_binder

}

namespace UserControl_business_objects_binder.Units
{
    public class UserControl_business_objects_binder
    {
        public const int TSSI_SQUAD = 0;
        public const int TSSI_UNIT = 1;
        public const int TSSI_DIVISION = 2;
        public const int TSSI_BUREAU = 3;
    } // end UserControl_business_objects_binder

}

