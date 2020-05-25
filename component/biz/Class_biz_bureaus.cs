using Class_db_bureaus;
using kix;

namespace Class_biz_bureaus
  {
  public class TClass_biz_bureaus
    {

        private readonly TClass_db_bureaus db_bureaus = null;

        //Constructor  Create()
        public TClass_biz_bureaus() : base()
        {
            // TODO: Add any constructor code here
            db_bureaus = new TClass_db_bureaus();
        }
        public bool Bind(string partial_code, object target)
        {
            bool result;
            result = db_bureaus.Bind(partial_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_bureaus.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Bureau --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Delete(string code)
        {
            bool result;
            result = db_bureaus.Delete(code);
            return result;
        }

        public bool Get(string code, out string description)
        {
            bool result;
            result = db_bureaus.Get(code, out description);

            return result;
        }

        public void Set(string code, string description)
        {
            db_bureaus.Set(code, description);

        }

    } // end TClass_biz_bureaus

}
