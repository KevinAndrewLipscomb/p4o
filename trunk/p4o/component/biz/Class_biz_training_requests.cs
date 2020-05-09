using System;
using Class_db_training_requests;

namespace Class_biz_training_requests
{
    public class TClass_biz_training_requests
    {
        private readonly TClass_db_training_requests db_training_requests = null;
        //Constructor  Create()
        public TClass_biz_training_requests() : base()
        {
            // TODO: Add any constructor code here
            db_training_requests = new TClass_db_training_requests();
        }
        public bool Bind(string partial_id, object target)
        {
            bool result;
            result = db_training_requests.Bind(partial_id, target);
            return result;
        }

        public void BindDirectToListControl(object target)
        {
            db_training_requests.BindDirectToListControl(target);
        }

        public bool Delete(string id)
        {
            bool result;
            result = db_training_requests.Delete(id);
            return result;
        }

        public bool Get(string id, out string nature, out string dates, out string conducting_agency, out string location, out string cost_of_enrollment, out string cost_of_lodging, out string cost_of_meals, out string cost_of_transportation, out string reason, out DateTime disposition_training_timestamp, out string disposition_training_member_id, out string disposition_training_funding_source, out string disposition_training_comments, out DateTime disposition_squad_timestamp, out string disposition_squad_member_id, out bool disposition_squad_be_approved, out string disposition_squad_comments, out DateTime disposition_unit_timestamp, out string disposition_unit_member_id, out bool disposition_unit_be_approved, out string disposition_unit_comments, out DateTime disposition_division_timestamp, out string disposition_division_member_id, out bool disposition_division_be_approved, out string disposition_division_comments, out DateTime disposition_assistant_chief_timestamp, out string disposition_assistant_chief_member_id, out bool disposition_assistant_chief_be_approved, out string disposition_assistant_chief_comments, out DateTime payment_timestamp, out string payment_member_id, out bool payment_be_done, out string payment_actual_amount, out string payment_comments, out string status_code, out DateTime finalization_timestamp, out string member_id, out DateTime submission_timestamp)
        {
            bool result;
            result = db_training_requests.Get(id, out nature, out dates, out conducting_agency, out location, out cost_of_enrollment, out cost_of_lodging, out cost_of_meals, out cost_of_transportation, out reason, out disposition_training_timestamp, out disposition_training_member_id, out disposition_training_funding_source, out disposition_training_comments, out disposition_squad_timestamp, out disposition_squad_member_id, out disposition_squad_be_approved, out disposition_squad_comments, out disposition_unit_timestamp, out disposition_unit_member_id, out disposition_unit_be_approved, out disposition_unit_comments, out disposition_division_timestamp, out disposition_division_member_id, out disposition_division_be_approved, out disposition_division_comments, out disposition_assistant_chief_timestamp, out disposition_assistant_chief_member_id, out disposition_assistant_chief_be_approved, out disposition_assistant_chief_comments, out payment_timestamp, out payment_member_id, out payment_be_done, out payment_actual_amount, out payment_comments, out status_code, out finalization_timestamp, out member_id, out submission_timestamp);

            return result;
        }

        public void Set(string id, string nature, string dates, string conducting_agency, string location, string cost_of_enrollment, string cost_of_lodging, string cost_of_meals, string cost_of_transportation, string reason, DateTime disposition_training_timestamp, string disposition_training_member_id, string disposition_training_funding_source, string disposition_training_comments, DateTime disposition_squad_timestamp, string disposition_squad_member_id, bool disposition_squad_be_approved, string disposition_squad_comments, DateTime disposition_unit_timestamp, string disposition_unit_member_id, bool disposition_unit_be_approved, string disposition_unit_comments, DateTime disposition_division_timestamp, string disposition_division_member_id, bool disposition_division_be_approved, string disposition_division_comments, DateTime disposition_assistant_chief_timestamp, string disposition_assistant_chief_member_id, bool disposition_assistant_chief_be_approved, string disposition_assistant_chief_comments, DateTime payment_timestamp, string payment_member_id, bool payment_be_done, string payment_actual_amount, string payment_comments, string status_code, DateTime finalization_timestamp, string member_id, DateTime submission_timestamp)
        {
            db_training_requests.Set(id, nature, dates, conducting_agency, location, cost_of_enrollment, cost_of_lodging, cost_of_meals, cost_of_transportation, reason, disposition_training_timestamp, disposition_training_member_id, disposition_training_funding_source, disposition_training_comments, disposition_squad_timestamp, disposition_squad_member_id, disposition_squad_be_approved, disposition_squad_comments, disposition_unit_timestamp, disposition_unit_member_id, disposition_unit_be_approved, disposition_unit_comments, disposition_division_timestamp, disposition_division_member_id, disposition_division_be_approved, disposition_division_comments, disposition_assistant_chief_timestamp, disposition_assistant_chief_member_id, disposition_assistant_chief_be_approved, disposition_assistant_chief_comments, payment_timestamp, payment_member_id, payment_be_done, payment_actual_amount, payment_comments, status_code, finalization_timestamp, member_id, submission_timestamp);

        }

        public void SetNew(string nature, string dates, string conducting_agency, string location, string cost_of_enrollment, string cost_of_lodging, string cost_of_meals, string cost_of_transportation, string reason, string member_id)
        {
            db_training_requests.SetNew(nature, dates, conducting_agency, location, cost_of_enrollment, cost_of_lodging, cost_of_meals, cost_of_transportation, reason, member_id);
        }

    } // end TClass_biz_training_requests

}

namespace Class_biz_training_requests.Units
{
    public class Class_biz_training_requests
    {
    } // end Class_biz_training_requests

}

