using kix;
using System;
using Class_db_squads;
namespace Class_biz_squads
{
    public class TClass_biz_squads
    {
        private TClass_db_squads db_squads = null;
        //Constructor  Create()
        public TClass_biz_squads() : base()
        {
            // TODO: Add any constructor code here
            db_squads = new TClass_db_squads();
        }
        public bool Bind(string partial_code, object target)
        {
            bool result;
            result = db_squads.Bind(partial_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_squads.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Squad --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Delete(string code)
        {
            bool result;
            result = db_squads.Delete(code);
            return result;
        }

        public bool Get(string code, out string description, out string unit_id)
        {
            bool result;
            result = db_squads.Get(code, out description, out unit_id);

            return result;
        }

        public void Set(string code, string description, string unit_id)
        {
            db_squads.Set(code, description, unit_id);

        }

    } // end TClass_biz_squads

}

namespace Class_biz_squads.Units
{
    public class Class_biz_squads
    {
    } // end Class_biz_squads

}

