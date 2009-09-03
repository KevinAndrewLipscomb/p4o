using System;
using Class_db_divisions;
namespace Class_biz_divisions
{
    public class TClass_biz_divisions
    {
        private TClass_db_divisions db_divisions = null;
        //Constructor  Create()
        public TClass_biz_divisions() : base()
        {
            // TODO: Add any constructor code here
            db_divisions = new TClass_db_divisions();
        }
        public bool Bind(string partial_code, object target)
        {
            bool result;
            result = db_divisions.Bind(partial_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_divisions.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Division --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, kix.Units.kix.EMPTY);
        }

        public bool Delete(string code)
        {
            bool result;
            result = db_divisions.Delete(code);
            return result;
        }

        public bool Get(string code, out string description, out string bureau_id)
        {
            bool result;
            result = db_divisions.Get(code, out description, out bureau_id);

            return result;
        }

        public void Set(string code, string description, string bureau_id)
        {
            db_divisions.Set(code, description, bureau_id);

        }

    } // end TClass_biz_divisions

}

namespace Class_biz_divisions.Units
{
    public class Class_biz_divisions
    {
    } // end Class_biz_divisions

}

