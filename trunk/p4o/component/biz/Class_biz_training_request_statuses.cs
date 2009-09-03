using System;
using Class_db_training_request_statuses;
namespace Class_biz_training_request_statuses
{
    public class TClass_biz_training_request_statuses
    {
        private TClass_db_training_request_statuses db_training_request_statuses = null;
        private string id_of_needs_training_unit_comments = String.Empty;
        private string id_of_needs_squad_approval = String.Empty;
        private string id_of_needs_unit_approval = String.Empty;
        private string id_of_needs_division_approval = String.Empty;
        private string id_of_needs_assistant_chief_approval = String.Empty;
        private string id_of_needs_graduation = String.Empty;
        private string id_of_needs_payment = String.Empty;
        private string id_of_canceled = String.Empty;
        //Constructor  Create()
        public TClass_biz_training_request_statuses() : base()
        {
            // TODO: Add any constructor code here
            db_training_request_statuses = new TClass_db_training_request_statuses();
            id_of_needs_training_unit_comments = db_training_request_statuses.IdOf("NEEDS_TRAINING_UNIT_COMMENTS");
            id_of_needs_squad_approval = db_training_request_statuses.IdOf("NEEDS_SQUAD_APPROVAL");
            id_of_needs_unit_approval = db_training_request_statuses.IdOf("NEEDS_UNIT_APPROVAL");
            id_of_needs_division_approval = db_training_request_statuses.IdOf("NEEDS_DIVISION_APPROVAL");
            id_of_needs_assistant_chief_approval = db_training_request_statuses.IdOf("NEEDS_ASSISTANT_CHIEF_APPROVAL");
            id_of_needs_graduation = db_training_request_statuses.IdOf("NEEDS_GRADUATION");
            id_of_needs_payment = db_training_request_statuses.IdOf("NEEDS_PAYMENT");
            id_of_canceled = db_training_request_statuses.IdOf("CANCELED");
        }
        public bool Bind(string partial_code, object target)
        {
            bool result;
            result = db_training_request_statuses.Bind(partial_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_training_request_statuses.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Status --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, kix.Units.kix.EMPTY);
        }

        public bool Delete(string code)
        {
            bool result;
            result = db_training_request_statuses.Delete(code);
            return result;
        }

        public bool Get(string code, out string description)
        {
            bool result;
            result = db_training_request_statuses.Get(code, out description);

            return result;
        }

        public string IdOf(string description)
        {
            string result = kix.Units.kix.EMPTY;

            if (description == "NEEDS_TRAINING_UNIT_COMMENTS")
            {
                result = id_of_needs_training_unit_comments;
            }
            else if (description == "NEEDS_SQUAD_APPROVAL")
            {
                result = id_of_needs_squad_approval;
            }
            else if (description == "NEEDS_UNIT_APPROVAL")
            {
                result = id_of_needs_unit_approval;
            }
            else if (description == "NEEDS_DIVISION_APPROVAL")
            {
                result = id_of_needs_division_approval;
            }
            else if (description == "NEEDS_ASSISTANT_CHIEF_APPROVAL")
            {
                result = id_of_needs_assistant_chief_approval;
            }
            else if (description == "NEEDS_GRADUATION")
            {
                result = id_of_needs_graduation;
            }
            else if (description == "NEEDS_PAYMENT")
            {
                result = id_of_needs_payment;
            }
            else if (description == "CANCELED")
            {
                result = id_of_canceled;
            }
            return result;
        }

        public void Set(string code, string description)
        {
            db_training_request_statuses.Set(code, description);

        }

    } // end TClass_biz_training_request_statuses

}

namespace Class_biz_training_request_statuses.Units
{
    public class Class_biz_training_request_statuses
    {
    } // end Class_biz_training_request_statuses

}

