using Class_db;
using Class_db_trail;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_roles
{
    public struct crosstab_metadata_rec_type
    {
        public uint index;
        public string sql_name;
        public string id;
        public string natural_text;
        public string soft_hyphenation_text;
    } // end crosstab_metadata_rec_type

    public class TClass_db_roles: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_roles() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool Bind(string partial_name, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT name FROM role WHERE name like \"" + partial_name + "%\" order by name", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["name"].ToString()));
            }
            dr.Close();
            this.Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            string where_clause;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != kix.Units.kix.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, kix.Units.kix.EMPTY));
            }
            where_clause = " where name <> \"Member\"";
            if (!has_config_roles_and_matrices)
            {
                where_clause = where_clause + " and (name <> \"Application Administrator\")";
            }
            this.Open();
            dr = new MySqlCommand("SELECT id,name FROM role" + where_clause + " order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            this.Close();
            if (selected_value != kix.Units.kix.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, "-- Role --");
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string unselected_literal)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, unselected_literal, kix.Units.kix.EMPTY);
        }

        public bool Delete(string name)
        {
            bool result;
            result = true;
            this.Open();
            try {
                new MySqlCommand(db_trail.Saved("delete from role where name = " + name), this.connection).ExecuteNonQuery();
            }
            catch(System.Exception e) {
                if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
                {
                    result = false;
                }
                else
                {
                    throw e;
                }
            }
            this.Close();
            return result;
        }

        public bool Get(string name, out string soft_hyphenation_text, out string pecking_order)
        {
            bool result;
            MySqlDataReader dr;

            soft_hyphenation_text = kix.Units.kix.EMPTY;
            pecking_order = kix.Units.kix.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select * from role where CAST(name AS CHAR) = \"" + name + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                name = dr["name"].ToString();
                soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                pecking_order = dr["pecking_order"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public string NameOfId(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select name from role where id = \"" + id + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public void Set(string name, string soft_hyphenation_text, string pecking_order)
        {
            string childless_field_assignments_clause;
            childless_field_assignments_clause = " soft_hyphenation_text = NULLIF(\"" + soft_hyphenation_text + "\",\"\")" + " , pecking_order = NULLIF(\"" + pecking_order + "\",\"\")";
            this.Open();
            new MySqlCommand(db_trail.Saved("insert role" + " set name = NULLIF(\"" + name + "\",\"\")" + " , " + childless_field_assignments_clause + " on duplicate key update " + childless_field_assignments_clause), this.connection).ExecuteNonQuery();
            this.Close();

        }

    } // end TClass_db_roles

}

namespace Class_db_roles.Units
{
    public class Class_db_roles
    {
    } // end Class_db_roles

}

