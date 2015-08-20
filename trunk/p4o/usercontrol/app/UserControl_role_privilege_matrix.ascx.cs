using kix;

using System;
using System.Collections;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Class_biz_role_privilege_map;
using Class_db_roles;
using Class_db_role_privilege_map;

namespace UserControl_role_privilege_matrix
{
    public struct p_type
    {
        public bool be_interactive;
        public bool be_loaded;
        public bool be_sort_order_descending;
        public TClass_biz_role_privilege_map biz_role_privilege_map;
        public ArrayList crosstab_metadata_rec_arraylist;
        public string sort_order;
    } // end p_type

    public partial class TWebUserControl_role_privilege_matrix: ki_web_ui.usercontrol_class
    {
        private p_type p;
        private void Checkboxify(GridViewRow row)
        {
            CheckBox check_box;
            crosstab_metadata_rec_type crosstab_metadata_rec;
            int i;
            if (row.Cells.Count > Class_db_role_privilege_map.Units.Class_db_role_privilege_map.CI_FIRST_CROSSTAB)
            {
                for (i = Class_db_role_privilege_map.Units.Class_db_role_privilege_map.CI_FIRST_CROSSTAB; i <= (row.Cells.Count - 1); i ++ )
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        row.Cells[i].HorizontalAlign = HorizontalAlign.Center;
                        crosstab_metadata_rec = ((crosstab_metadata_rec_type)(p.crosstab_metadata_rec_arraylist[i - Class_db_role_privilege_map.Units.Class_db_role_privilege_map.CI_FIRST_CROSSTAB]));
                        check_box = new CheckBox();
                        check_box.AutoPostBack = true;
                        check_box.Checked = (row.Cells[i].Text == "1");
                        check_box.Enabled = k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices");
                        check_box.ID = k.EMPTY + Units.UserControl_role_privilege_matrix.CHECKBOX_ID_PREFIX_PRIVILEGE_ID + row.Cells[Class_db_role_privilege_map.Units.Class_db_role_privilege_map.CI_PRIVILEGE_ID].Text + Units.UserControl_role_privilege_matrix.CHECKBOX_ID_PREFIX_ROLE_ID + crosstab_metadata_rec.id;
                        check_box.ToolTip = crosstab_metadata_rec.natural_text;
                        check_box.CheckedChanged += new System.EventHandler(Changed);
                        row.Cells[i].Controls.Add(check_box);
                        if (!p.be_interactive)
                        {
                            ((row.Cells[i].Controls[0]) as CheckBox).Enabled = false;
                        }
                    }
                }
            }
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
            uint row_index;
            if (!p.be_loaded)
            {
                if (!p.be_interactive)
                {
                    GridView_control.AllowSorting = false;
                }
                Bind();
                p.be_loaded = true;
            }
            else
            {
                // Dynamic controls must be re-added on each postback.
                if (GridView_control.Rows.Count > 0)
                {
                    for (row_index = 0; row_index <= (GridView_control.Rows.Count - 1); row_index ++ )
                    {
                        Checkboxify(GridView_control.Rows[(int)row_index]);
                    }
                }
            }
            InjectPersistentClientSideScript();

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session[InstanceId() + ".p"] != null)
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_role_privilege_matrix");
            }
            else
            {
                p.biz_role_privilege_map = new TClass_biz_role_privilege_map();
                p.be_interactive = !(Session["mode:report"] != null);
                p.be_loaded = false;
                p.be_sort_order_descending = false;
                p.sort_order = "privilege_name%";
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.GridView_control.Sorting += new System.Web.UI.WebControls.GridViewSortEventHandler(this.GridView_control_Sorting);
            this.GridView_control.RowDataBound += new System.Web.UI.WebControls.GridViewRowEventHandler(this.GridView_control_RowDataBound);
            this.PreRender += this.TWebUserControl_role_privilege_matrix_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_role_privilege_matrix_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_role_privilege_matrix Fresh()
        {
            TWebUserControl_role_privilege_matrix result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void Changed(object sender, System.EventArgs e)
        {
            const int TUPLE_INDEX_PRIVILEGE_ID = 0;
            const int TUPLE_INDEX_ROLE_ID = 1;
            CheckBox check_box;
            string[] tuple;
            check_box = ((sender) as CheckBox);
            tuple = check_box.ID.Split(new string[] {Units.UserControl_role_privilege_matrix.CHECKBOX_ID_PREFIX_PRIVILEGE_ID, Units.UserControl_role_privilege_matrix.CHECKBOX_ID_PREFIX_ROLE_ID}, StringSplitOptions.RemoveEmptyEntries);
            p.biz_role_privilege_map.Save(k.Safe(tuple[TUPLE_INDEX_PRIVILEGE_ID], k.safe_hint_type.NUM), k.Safe(tuple[TUPLE_INDEX_ROLE_ID], k.safe_hint_type.NUM), check_box.Checked);
        }

        private void GridView_control_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.EmptyDataRow)
            {
                e.Row.Cells[Class_db_role_privilege_map.Units.Class_db_role_privilege_map.CI_PRIVILEGE_ID].Visible = false;
                e.Row.Cells[Class_db_role_privilege_map.Units.Class_db_role_privilege_map.CI_PRIVILEGE_NAME].Wrap = false;
                Checkboxify(e.Row);
            }

        }

        private void GridView_control_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e)
        {
            if ((e.SortExpression + "%,privilege_name") == p.sort_order)
            {
                p.be_sort_order_descending = !p.be_sort_order_descending;
            }
            else
            {
                p.sort_order = e.SortExpression + "%,privilege_name";
                p.be_sort_order_descending = true;
            }
            GridView_control.EditIndex =  -1;
            Bind();
        }

        private void Bind()
        {
            crosstab_metadata_rec_type metadata;
            uint i;
            p.biz_role_privilege_map.Bind(p.sort_order, p.be_sort_order_descending, GridView_control, out p.crosstab_metadata_rec_arraylist);
            if ((GridView_control.HeaderRow != null))
            {
                ((GridView_control.HeaderRow.Cells[1].Controls[0]) as LinkButton).Text = "Privilege";
                if (p.crosstab_metadata_rec_arraylist.Count > 0)
                {
                    for (i = 0; i <= (p.crosstab_metadata_rec_arraylist.Count - 1); i ++ )
                    {
                        metadata = ((crosstab_metadata_rec_type)(p.crosstab_metadata_rec_arraylist[(int)i]));
                        ((GridView_control.HeaderRow.Cells[(int)(metadata.index)].Controls[0]) as LinkButton).Text = metadata.soft_hyphenation_text;
                        ((GridView_control.HeaderRow.Cells[(int)(metadata.index)].Controls[0]) as LinkButton).Font.Bold = false;
                        ((GridView_control.HeaderRow.Cells[(int)(metadata.index)].Controls[0]) as LinkButton).Font.Size = FontUnit.Smaller;
                    }
                }
            }
        }

    } // end TWebUserControl_role_privilege_matrix

}

namespace UserControl_role_privilege_matrix.Units
{
    public class UserControl_role_privilege_matrix
    {
        public const string CHECKBOX_ID_PREFIX_PRIVILEGE_ID = "CheckBox_privilege_";
        public const string CHECKBOX_ID_PREFIX_ROLE_ID = "_role_";
    } // end UserControl_role_privilege_matrix

}
