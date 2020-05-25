using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_privileges
  {
  public class TClass_db_privileges: TClass_db
    {
        #pragma warning disable IDE0052 // Remove unread private members
        private readonly TClass_db_trail db_trail = null;
        #pragma warning restore IDE0052 // Remove unread private members

        //Constructor  Create()
        public TClass_db_privileges() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }

        public bool Bind(string partial_name, object target)
        {
            bool result;
            MySqlDataReader dr;
            Open();
            ((target) as ListControl).Items.Clear();
            using var my_sql_command = new MySqlCommand("SELECT name FROM privilege WHERE name like \"" + partial_name + "%\" order by name", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["name"].ToString()));
            }
            dr.Close();
            Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal.Length > 0)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            Open();
            using var my_sql_command = new MySqlCommand("select privilege.id as privilege_id" + " , name as privilege_name" + " from privilege" + " order by privilege_name", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["privilege_name"].ToString(), dr["privilege_id"].ToString()));
            }
            dr.Close();
            Close();
            if (selected_value.Length > 0)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Privilege --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Get(string name, out string soft_hyphenation_text)
        {
            bool result;
            MySqlDataReader dr;
            result = false;

            soft_hyphenation_text = k.EMPTY;
            Open();
            using var my_sql_command = new MySqlCommand("select * from privilege where CAST(name AS CHAR) = \"" + name + "\"", connection);
            dr = my_sql_command.ExecuteReader();
            if (dr.Read())
            {
                name = dr["name"].ToString();
                soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                result = true;
            }
            dr.Close();
            Close();
            return result;
        }

    } // end TClass_db_privileges

}

namespace Class_db_privileges.Units
  {
  public class Class_db_privileges
    {
    } // end Class_db_privileges

}

