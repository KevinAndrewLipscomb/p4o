using Class_db;
using Class_db_trail;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_members
{
    public class TClass_db_members: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_members() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool BeValidProfile(string id)
        {
            bool result;
            this.Open();
            result = ("1" == new MySqlCommand("select be_valid_profile from member where id = " + id, this.connection).ExecuteScalar().ToString());
            this.Close();
            return result;
        }

        public bool Bind(string partial_registration_code, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT registration_code FROM member WHERE registration_code like \"" + partial_registration_code + "%\" order by registration_code", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["registration_code"].ToString(), dr["registration_code"].ToString()));
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
            dr = new MySqlCommand("select member.id as member_id" + " , concat(last_name,\", \",first_name) as member_designator" + " from member" + " order by member_designator", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["member_designator"].ToString(), dr["member_id"].ToString()));
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
            BindDirectToListControl(target, "-- Member --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, kix.Units.kix.EMPTY);
        }

        public bool Delete(string registration_code)
        {
            bool result;
            result = true;
            this.Open();
            try {
                new MySqlCommand(db_trail.Saved("delete from member where registration_code = " + registration_code), this.connection).ExecuteNonQuery();
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

        public string EmailAddressOf(string member_id)
        {
            string result;
            object email_address_obj;
            this.Open();
            email_address_obj = new MySqlCommand("select email_address from member where id = " + member_id, this.connection).ExecuteScalar().ToString();
            if (email_address_obj != null)
            {
                result = email_address_obj.ToString();
            }
            else
            {
                result = kix.Units.kix.EMPTY;
            }
            this.Close();
            return result;
        }

        public string FirstNameOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select first_name from member where id = \"" + member_id + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public bool Get(out string last_name, out string first_name, out string email_address, string registration_code, out string squad_id)
        {
            bool result;
            MySqlDataReader dr;

            last_name = kix.Units.kix.EMPTY;
            first_name = kix.Units.kix.EMPTY;
            email_address = kix.Units.kix.EMPTY;
            squad_id = kix.Units.kix.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select * from member where CAST(registration_code AS CHAR) = \"" + registration_code + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                last_name = dr["last_name"].ToString();
                first_name = dr["first_name"].ToString();
                email_address = dr["email_address"].ToString();
                registration_code = dr["registration_code"].ToString();
                squad_id = dr["squad_id"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public string IdOfUserId(string user_id)
        {
            string result;
            object member_id_obj;
            this.Open();
            member_id_obj = new MySqlCommand("select member_id from user_member_map where user_id = " + user_id, this.connection).ExecuteScalar();
            if (member_id_obj != null)
            {
                result = member_id_obj.ToString();
            }
            else
            {
                result = kix.Units.kix.EMPTY;
            }
            this.Close();
            return result;
        }

        public string LastNameOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select last_name from member where id = \"" + member_id + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public void Set(string last_name, string first_name, string email_address, string registration_code, string squad_id)
        {
            string childless_field_assignments_clause;
            childless_field_assignments_clause = " last_name = NULLIF(\"" + last_name + "\",\"\")" + " , first_name = NULLIF(\"" + first_name + "\",\"\")" + " , email_address = NULLIF(\"" + email_address + "\",\"\")" + " , squad_id = NULLIF(\"" + squad_id + "\",\"\")";
            this.Open();
            new MySqlCommand(db_trail.Saved("insert member" + " set registration_code = NULLIF(\"" + registration_code + "\",\"\")" + " , " + childless_field_assignments_clause + " on duplicate key update " + childless_field_assignments_clause), this.connection).ExecuteNonQuery();
            this.Close();

        }

        public void SetEmailAddress(string id, string email_address)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member" + " SET email_address = \"" + email_address + "\"" + " WHERE id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public string UserIdOf(string member_id)
        {
            string result;
            object user_id_obj;
            this.Open();
            user_id_obj = new MySqlCommand("select user_id from user_member_map where member_id = " + member_id, this.connection).ExecuteScalar();
            if (user_id_obj != null)
            {
                result = user_id_obj.ToString();
            }
            else
            {
                result = kix.Units.kix.EMPTY;
            }
            this.Close();
            return result;
        }

    } // end TClass_db_members

}

namespace Class_db_members.Units
{
    public class Class_db_members
    {
    } // end Class_db_members

}

