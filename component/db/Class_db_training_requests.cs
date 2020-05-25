using kix;
using Class_db;
using Class_db_trail;
using Class_db_training_request_statuses;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_training_requests
{
    public class TClass_db_training_requests: TClass_db
    {

        private readonly TClass_db_trail db_trail = null;
        private readonly TClass_db_training_request_statuses db_training_request_statuses = null;

        //Constructor  Create()
        public TClass_db_training_requests() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
            db_training_request_statuses = new TClass_db_training_request_statuses();
        }

        public bool Bind(string partial_id, object target)
        {
            bool result;
            MySqlDataReader dr;
            Open();
            ((target) as ListControl).Items.Clear();
            using var my_sql_command = new MySqlCommand("SELECT id FROM training_request WHERE id like \"" + partial_id + "%\" order by id", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["id"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target)
        {
            MySqlDataReader dr;
            Open();
            ((target) as ListControl).Items.Clear();
            using var my_sql_command = new MySqlCommand("SELECT id,id FROM training_request order by id", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["id"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            Close();
        }

        public bool Delete(string id)
        {
            bool result;
            result = true;
            Open();
            try {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from training_request where id = " + id), connection);
                my_sql_command.ExecuteNonQuery();
            }
            catch(System.Exception e) {
                if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
                {
                    result = false;
                }
                else
                {
                    throw;
                }
            }
            Close();
            return result;
        }

        public bool Get(string id, out string nature, out string dates, out string conducting_agency, out string location, out string cost_of_enrollment, out string cost_of_lodging, out string cost_of_meals, out string cost_of_transportation, out string reason, out DateTime disposition_training_timestamp, out string disposition_training_member_id, out string disposition_training_funding_source, out string disposition_training_comments, out DateTime disposition_squad_timestamp, out string disposition_squad_member_id, out bool disposition_squad_be_approved, out string disposition_squad_comments, out DateTime disposition_unit_timestamp, out string disposition_unit_member_id, out bool disposition_unit_be_approved, out string disposition_unit_comments, out DateTime disposition_division_timestamp, out string disposition_division_member_id, out bool disposition_division_be_approved, out string disposition_division_comments, out DateTime disposition_assistant_chief_timestamp, out string disposition_assistant_chief_member_id, out bool disposition_assistant_chief_be_approved, out string disposition_assistant_chief_comments, out DateTime payment_timestamp, out string payment_member_id, out bool payment_be_done, out string payment_actual_amount, out string payment_comments, out string status_code, out DateTime finalization_timestamp, out string member_id, out DateTime submission_timestamp)
        {
            bool result;
            MySqlDataReader dr;
            string s;

            nature = k.EMPTY;
            dates = k.EMPTY;
            conducting_agency = k.EMPTY;
            location = k.EMPTY;
            cost_of_enrollment = k.EMPTY;
            cost_of_lodging = k.EMPTY;
            cost_of_meals = k.EMPTY;
            cost_of_transportation = k.EMPTY;
            reason = k.EMPTY;
            disposition_training_timestamp = DateTime.MinValue;
            disposition_training_member_id = k.EMPTY;
            disposition_training_funding_source = k.EMPTY;
            disposition_training_comments = k.EMPTY;
            disposition_squad_timestamp = DateTime.MinValue;
            disposition_squad_member_id = k.EMPTY;
            disposition_squad_be_approved = false;
            disposition_squad_comments = k.EMPTY;
            disposition_unit_timestamp = DateTime.MinValue;
            disposition_unit_member_id = k.EMPTY;
            disposition_unit_be_approved = false;
            disposition_unit_comments = k.EMPTY;
            disposition_division_timestamp = DateTime.MinValue;
            disposition_division_member_id = k.EMPTY;
            disposition_division_be_approved = false;
            disposition_division_comments = k.EMPTY;
            disposition_assistant_chief_timestamp = DateTime.MinValue;
            disposition_assistant_chief_member_id = k.EMPTY;
            disposition_assistant_chief_be_approved = false;
            disposition_assistant_chief_comments = k.EMPTY;
            payment_timestamp = DateTime.MinValue;
            payment_member_id = k.EMPTY;
            payment_be_done = false;
            payment_actual_amount = k.EMPTY;
            payment_comments = k.EMPTY;
            status_code = k.EMPTY;
            finalization_timestamp = DateTime.MinValue;
            member_id = k.EMPTY;
            submission_timestamp = DateTime.MinValue;
            result = false;
            Open();
            using var my_sql_command = new MySqlCommand("select * from training_request where CAST(id AS CHAR) = \"" + id + "\"", connection);
            dr = my_sql_command.ExecuteReader();
            if (dr.Read())
            {
                id = dr["id"].ToString();
                nature = dr["nature"].ToString();
                dates = dr["dates"].ToString();
                conducting_agency = dr["conducting_agency"].ToString();
                location = dr["location"].ToString();
                cost_of_enrollment = dr["cost_of_enrollment"].ToString();
                cost_of_lodging = dr["cost_of_lodging"].ToString();
                cost_of_meals = dr["cost_of_meals"].ToString();
                cost_of_transportation = dr["cost_of_transportation"].ToString();
                reason = dr["reason"].ToString();
                s = dr["disposition_training_timestamp"].ToString();
                if (s.Length > 0)
                {
                    disposition_training_timestamp = DateTime.Parse(s);
                    disposition_training_member_id = dr["disposition_training_member_id"].ToString();
                    disposition_training_funding_source = dr["disposition_training_funding_source"].ToString();
                    disposition_training_comments = dr["disposition_training_comments"].ToString();
                    s = dr["disposition_squad_timestamp"].ToString();
                    if (s.Length > 0)
                    {
                        disposition_squad_timestamp = DateTime.Parse(s);
                        disposition_squad_member_id = dr["disposition_squad_member_id"].ToString();
                        disposition_squad_be_approved = (dr["disposition_squad_be_approved"].ToString() == "1");
                        disposition_squad_comments = dr["disposition_squad_comments"].ToString();
                        s = dr["disposition_unit_timestamp"].ToString();
                        if (s.Length > 0)
                        {
                            disposition_unit_timestamp = DateTime.Parse(s);
                            disposition_unit_member_id = dr["disposition_unit_member_id"].ToString();
                            disposition_unit_be_approved = (dr["disposition_unit_be_approved"].ToString() == "1");
                            disposition_unit_comments = dr["disposition_unit_comments"].ToString();
                            s = dr["disposition_division_timestamp"].ToString();
                            if (s.Length > 0)
                            {
                                disposition_division_timestamp = DateTime.Parse(s);
                                disposition_division_member_id = dr["disposition_division_member_id"].ToString();
                                disposition_division_be_approved = (dr["disposition_division_be_approved"].ToString() == "1");
                                disposition_division_comments = dr["disposition_division_comments"].ToString();
                                s = dr["disposition_assistant_chief_timestamp"].ToString();
                                if (s.Length > 0)
                                {
                                    disposition_assistant_chief_timestamp = DateTime.Parse(s);
                                    disposition_assistant_chief_member_id = dr["disposition_assistant_chief_member_id"].ToString();
                                    disposition_assistant_chief_be_approved = (dr["disposition_assistant_chief_be_approved"].ToString() == "1");
                                    disposition_assistant_chief_comments = dr["disposition_assistant_chief_comments"].ToString();
                                    s = dr["payment_timestamp"].ToString();
                                    if (s.Length > 0)
                                    {
                                        payment_timestamp = DateTime.Parse(s);
                                        payment_member_id = dr["payment_member_id"].ToString();
                                        payment_be_done = (dr["payment_be_done"].ToString() == "1");
                                        payment_actual_amount = dr["payment_actual_amount"].ToString();
                                        payment_comments = dr["payment_comments"].ToString();
                                    }
                                }
                            }
                        }
                    }
                }
                s = dr["finalization_timestamp"].ToString();
                if (s.Length > 0)
                {
                    finalization_timestamp = DateTime.Parse(s);
                }
                status_code = dr["status_code"].ToString();
                member_id = dr["member_id"].ToString();
                submission_timestamp = DateTime.Parse(dr["submission_timestamp"].ToString());
                result = true;
            }
            dr.Close();
            Close();
            return result;
        }

        public void Set(string id, string nature, string dates, string conducting_agency, string location, string cost_of_enrollment, string cost_of_lodging, string cost_of_meals, string cost_of_transportation, string reason, DateTime disposition_training_timestamp, string disposition_training_member_id, string disposition_training_funding_source, string disposition_training_comments, DateTime disposition_squad_timestamp, string disposition_squad_member_id, bool disposition_squad_be_approved, string disposition_squad_comments, DateTime disposition_unit_timestamp, string disposition_unit_member_id, bool disposition_unit_be_approved, string disposition_unit_comments, DateTime disposition_division_timestamp, string disposition_division_member_id, bool disposition_division_be_approved, string disposition_division_comments, DateTime disposition_assistant_chief_timestamp, string disposition_assistant_chief_member_id, bool disposition_assistant_chief_be_approved, string disposition_assistant_chief_comments, DateTime payment_timestamp, string payment_member_id, bool payment_be_done, string payment_actual_amount, string payment_comments, string status_code, DateTime finalization_timestamp, string member_id, DateTime submission_timestamp)
        {
            // If any fields in this table are foreign keys for a subordinate table:
            // a. Uncomment the "//1" lines.
            // b. Customize the SQL as indicated by {bracketed comments}.
            // 1 var
            // 1   childless_field_assignments_clause: string;
            // 1  childless_field_assignments_clause := // {Move childless field assignments here.}
            Open();
            // 1      'insert training_request'
            // 1      + ' set // {Move parent field assignments here.}
            // 1      + ' , ' + childless_field_assignments_clause
            // 1      + ' on duplicate key update '
            // 1      + childless_field_assignments_clause
            using var my_sql_command = new MySqlCommand(db_trail.Saved("replace training_request" + " set id = NULLIF(\"" + id + "\",\"\")" + " , nature = NULLIF(\"" + nature + "\",\"\")" + " , dates = NULLIF(\"" + dates + "\",\"\")" + " , conducting_agency = NULLIF(\"" + conducting_agency + "\",\"\")" + " , location = NULLIF(\"" + location + "\",\"\")" + " , cost_of_enrollment = NULLIF(\"" + cost_of_enrollment + "\",\"\")" + " , cost_of_lodging = NULLIF(\"" + cost_of_lodging + "\",\"\")" + " , cost_of_meals = NULLIF(\"" + cost_of_meals + "\",\"\")" + " , cost_of_transportation = NULLIF(\"" + cost_of_transportation + "\",\"\")" + " , reason = NULLIF(\"" + reason + "\",\"\")" + " , disposition_training_timestamp = \"" + disposition_training_timestamp.ToString() + "\"" + " , disposition_training_member_id = NULLIF(\"" + disposition_training_member_id + "\",\"\")" + " , disposition_training_funding_source = NULLIF(\"" + disposition_training_funding_source + "\",\"\")" + " , disposition_training_comments = NULLIF(\"" + disposition_training_comments + "\",\"\")" + " , disposition_squad_timestamp = \"" + disposition_squad_timestamp.ToString() + "\"" + " , disposition_squad_member_id = NULLIF(\"" + disposition_squad_member_id + "\",\"\")" + " , disposition_squad_be_approved = " + disposition_squad_be_approved.ToString() + " , disposition_squad_comments = NULLIF(\"" + disposition_squad_comments + "\",\"\")" + " , disposition_unit_timestamp = \"" + disposition_unit_timestamp.ToString() + "\"" + " , disposition_unit_member_id = NULLIF(\"" + disposition_unit_member_id + "\",\"\")" + " , disposition_unit_be_approved = " + disposition_unit_be_approved.ToString() + " , disposition_unit_comments = NULLIF(\"" + disposition_unit_comments + "\",\"\")" + " , disposition_division_timestamp = \"" + disposition_division_timestamp.ToString() + "\"" + " , disposition_division_member_id = NULLIF(\"" + disposition_division_member_id + "\",\"\")" + " , disposition_division_be_approved = " + disposition_division_be_approved.ToString() + " , disposition_division_comments = NULLIF(\"" + disposition_division_comments + "\",\"\")" + " , disposition_assistant_chief_timestamp = \"" + disposition_assistant_chief_timestamp.ToString() + "\"" + " , disposition_assistant_chief_member_id = NULLIF(\"" + disposition_assistant_chief_member_id + "\",\"\")" + " , disposition_assistant_chief_be_approved = " + disposition_assistant_chief_be_approved.ToString() + " , disposition_assistant_chief_comments = NULLIF(\"" + disposition_assistant_chief_comments + "\",\"\")" + " , payment_timestamp = \"" + payment_timestamp.ToString() + "\"" + " , payment_member_id = NULLIF(\"" + payment_member_id + "\",\"\")" + " , payment_be_done = " + payment_be_done.ToString() + " , payment_actual_amount = NULLIF(\"" + payment_actual_amount + "\",\"\")" + " , payment_comments = NULLIF(\"" + payment_comments + "\",\"\")" + " , status_code = NULLIF(\"" + status_code + "\",\"\")" + " , finalization_timestamp = \"" + finalization_timestamp.ToString() + "\"" + " , member_id = NULLIF(\"" + member_id + "\",\"\")" + " , submission_timestamp = \"" + submission_timestamp.ToString() + "\""), connection);
            my_sql_command.ExecuteNonQuery();
            Close();

        }

        public void SetNew(string nature, string dates, string conducting_agency, string location, string cost_of_enrollment, string cost_of_lodging, string cost_of_meals, string cost_of_transportation, string reason, string member_id)
        {
            Open();
            using var my_sql_command = new MySqlCommand(db_trail.Saved("insert training_request" + " set nature = NULLIF(\"" + nature + "\",\"\")" + " , dates = NULLIF(\"" + dates + "\",\"\")" + " , conducting_agency = NULLIF(\"" + conducting_agency + "\",\"\")" + " , location = NULLIF(\"" + location + "\",\"\")" + " , cost_of_enrollment = NULLIF(\"" + cost_of_enrollment + "\",\"\")" + " , cost_of_lodging = NULLIF(\"" + cost_of_lodging + "\",\"\")" + " , cost_of_meals = NULLIF(\"" + cost_of_meals + "\",\"\")" + " , cost_of_transportation = NULLIF(\"" + cost_of_transportation + "\",\"\")" + " , reason = NULLIF(\"" + reason + "\",\"\")" + " , status_code = \"" + db_training_request_statuses.IdOf("NEEDS_TRAINING_UNIT_COMMENTS") + "\"" + " , member_id = NULLIF(\"" + member_id + "\",\"\")" + " , submission_timestamp = NOW()"), connection);
            my_sql_command.ExecuteNonQuery();
            Close();
        }

    } // end TClass_db_training_requests

}
