using kix;
using System;
using Class_db_members;
namespace Class_biz_members
{
    public class TClass_biz_members
    {
        private TClass_db_members db_members = null;
        //Constructor  Create()
        public TClass_biz_members() : base()
        {
            // TODO: Add any constructor code here
            db_members = new TClass_db_members();
        }
        public bool BeValidProfile(string id)
        {
            bool result;
            result = db_members.BeValidProfile(id);
            return result;
        }

        public bool Bind(string partial_registration_code, object target)
        {
            bool result;
            result = db_members.Bind(partial_registration_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_members.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Member --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Delete(string registration_code)
        {
            bool result;
            result = db_members.Delete(registration_code);
            return result;
        }

        public string EmailAddressOf(string member_id)
        {
            string result;
            result = db_members.EmailAddressOf(member_id);
            return result;
        }

        public string FirstNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.FirstNameOfMemberId(member_id);
            return result;
        }

        public bool Get(out string last_name, out string first_name, out string email_address, string registration_code, out string squad_id)
        {
            bool result;
            result = db_members.Get(out last_name, out first_name, out email_address, registration_code, out squad_id);

            return result;
        }

        public string IdOfUserId(string user_id)
        {
            string result;
            result = db_members.IdOfUserId(user_id);
            return result;
        }

        public string LastNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.LastNameOfMemberId(member_id);
            return result;
        }

        public void Set(string last_name, string first_name, string email_address, string registration_code, string squad_id)
        {
            db_members.Set(last_name, first_name, email_address, registration_code, squad_id);

        }

        public string UserIdOf(string member_id)
        {
            string result;
            result = db_members.UserIdOf(member_id);
            return result;
        }

    } // end TClass_biz_members

}

namespace Class_biz_members.Units
{
    public class Class_biz_members
    {
    } // end Class_biz_members

}

