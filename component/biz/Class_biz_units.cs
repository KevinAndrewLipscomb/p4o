using kix;
using System;
using Class_db_units;

namespace Class_biz_units
{
    public class TClass_biz_units
    {
        private readonly TClass_db_units db_units = null;
        //Constructor  Create()
        public TClass_biz_units() : base()
        {
            // TODO: Add any constructor code here
            db_units = new TClass_db_units();
        }
        public bool Bind(string partial_code, object target)
        {
            bool result;
            result = db_units.Bind(partial_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_units.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Unit --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Delete(string code)
        {
            bool result;
            result = db_units.Delete(code);
            return result;
        }

        public bool Get(string code, out string description, out string division_id)
        {
            bool result;
            result = db_units.Get(code, out description, out division_id);

            return result;
        }

        public void Set(string code, string description, string division_id)
        {
            db_units.Set(code, description, division_id);

        }

    } // end TClass_biz_units

}

namespace Class_biz_units.Units
{
    public class Class_biz_units
    {
    } // end Class_biz_units

}

