using kix;
using Class_db;
using Class_db_trail;
using Class_db_roles;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace Class_db_role_privilege_map
{
    public class TClass_db_role_privilege_map: TClass_db
    {
        private readonly TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_role_privilege_map() : base()
        {
            db_trail = new TClass_db_trail();
        }
        public void Bind(string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata_rec_arraylist)
        {
            crosstab_metadata_rec_type crosstab_metadata_rec;
            string crosstab_sql;
            MySqlDataReader dr;
            string where_clause;
            crosstab_metadata_rec.index = 1;
            // init to index of last non-dependent column
            crosstab_metadata_rec_arraylist = new ArrayList();
            crosstab_sql = k.EMPTY;
            Open();
            using var my_sql_command_1 = new MySqlCommand("select id,name,soft_hyphenation_text from role where name <> \"Member\"", connection);
            dr = my_sql_command_1.ExecuteReader();
            while (dr.Read())
            {
                crosstab_metadata_rec.index++;
                crosstab_metadata_rec.id = dr["id"].ToString();
                crosstab_metadata_rec.natural_text = dr["name"].ToString();
                crosstab_metadata_rec.soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                crosstab_metadata_rec.sql_name = k.Safe(crosstab_metadata_rec.natural_text, k.safe_hint_type.ECMASCRIPT_WORD);
                crosstab_sql = crosstab_sql + k.COMMA_SPACE + "IFNULL((select 1 from role_privilege_map where role_id = \"" + dr["id"].ToString() + "\" and privilege_id = privilege.id),0) as " + crosstab_metadata_rec.sql_name;
                crosstab_metadata_rec_arraylist.Add(crosstab_metadata_rec);
            }
            dr.Close();
            // if filter = k.EMPTY then begin
            where_clause = k.EMPTY;
            // end else begin
            // // where_clause := ' where agency_id = "' + filter + '"';
            // end;
            if (be_sort_order_descending)
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            using var my_sql_command = new MySqlCommand("select privilege.id as privilege_id" + " , privilege.name as privilege_name" + crosstab_sql + " from privilege" + " left outer join role_privilege_map on (role_privilege_map.privilege_id=privilege.id)" + " left outer join role on (role.id=role_privilege_map.role_id)" + where_clause + " group by privilege.id" + " order by " + sort_order, connection);
            ((target) as GridView).DataSource = my_sql_command.ExecuteReader();
            ((target) as GridView).DataBind();
            Close();

        }

        public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
        {
            if (be_sort_order_ascending)
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            Open();
            using var my_sql_command = new MySqlCommand("select role_id" + " , pecking_order as role_pecking_order" + " , role.name as role_name" + " , privilege.name as privilege_name" + " , privilege_id" + " from role_privilege_map" + " join privilege on (privilege.id=role_privilege_map.privilege_id)" + " join role on (role.id=role_privilege_map.role_id)" + " order by " + sort_order, connection);
            ((target) as GridView).DataSource = my_sql_command.ExecuteReader();
            ((target) as GridView).DataBind();
            Close();

        }

        public void Save(string privilege_id, string role_id, bool be_granted)
        {
            Open();
            if (be_granted)
            {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("insert ignore role_privilege_map set privilege_id = \"" + privilege_id + "\", role_id = \"" + role_id + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            else
            {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from role_privilege_map where privilege_id = \"" + privilege_id + "\" and role_id = \"" + role_id + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            Close();
        }

    } // end TClass_db_role_privilege_map

}

namespace Class_db_role_privilege_map.Units
{
    public class Class_db_role_privilege_map
    {
        public const int CI_PRIVILEGE_ID = 0;
        public const int CI_PRIVILEGE_NAME = 1;
        public const int CI_FIRST_CROSSTAB = 2;
    } // end Class_db_role_privilege_map

}

