using Class_db;
using Class_db_trail;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_training_request_statuses
{
    public class TClass_db_training_request_statuses: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_training_request_statuses() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool Bind(string partial_spec, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT lpad(id,4,\"0\") as id" + " , description" + " FROM training_request_status" + " WHERE concat(lpad(id,4,\"0\"),\" -- \",description) like \"%" + partial_spec + "%\"" + " order by description", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["id"].ToString() + kix.Units.kix.SPACE_HYPHENS_SPACE + dr["description"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            this.Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != kix.Units.kix.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, kix.Units.kix.EMPTY));
            }
            this.Open();
            dr = new MySqlCommand("SELECT id,description FROM training_request_status where description <> \"(none specified)\" order by id", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            this.Close();
            if (selected_value != kix.Units.kix.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Status --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, kix.Units.kix.EMPTY);
        }

        public bool Delete(string id)
        {
            bool result;
            result = true;
            this.Open();
            try {
                new MySqlCommand(db_trail.Saved("delete from training_request_status where id = " + id), this.connection).ExecuteNonQuery();
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

        public bool Get(string id, out string description)
        {
            bool result;
            MySqlDataReader dr;

            description = kix.Units.kix.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select description from training_request_status where id = \"" + id + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                description = dr["description"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public string IdOf(string description)
        {
            string result;
            object id_of_obj;
            this.Open();
            id_of_obj = new MySqlCommand("select id from training_request_status where description = \"" + description + "\"", this.connection).ExecuteScalar();
            this.Close();
            result = kix.Units.kix.EMPTY;
            if ((id_of_obj != null))
            {
                result = id_of_obj.ToString();
            }

            return result;
        }

        public void Set(string id, string description)
        {
            string childless_field_assignments_clause;
            childless_field_assignments_clause = "description = \"" + description + "\"";
            this.Open();
            new MySqlCommand(db_trail.Saved("insert training_request_status" + " set id = NULLIF(\"" + id + "\",\"\")" + " , " + childless_field_assignments_clause + " on duplicate key update " + childless_field_assignments_clause), this.connection).ExecuteNonQuery();
            this.Close();

        }

    } // end TClass_db_training_request_statuses

}

namespace Class_db_training_request_statuses.Units
{
    public class Class_db_training_request_statuses
    {
    } // end Class_db_training_request_statuses

}

