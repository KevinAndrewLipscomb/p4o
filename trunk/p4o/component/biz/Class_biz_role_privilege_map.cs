using System;

using System.Collections;
using Class_db_role_privilege_map;
using Class_biz_notifications;
namespace Class_biz_role_privilege_map
{
    public class TClass_biz_role_privilege_map
    {
        private TClass_db_role_privilege_map db_role_privilege_map = null;
        private TClass_biz_notifications biz_notifications = null;
        //Constructor  Create()
        public TClass_biz_role_privilege_map() : base()
        {
            db_role_privilege_map = new TClass_db_role_privilege_map();
            biz_notifications = new TClass_biz_notifications();
        }
        public void Bind(string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata)
        {
            db_role_privilege_map.Bind(sort_order, be_sort_order_descending, target, out crosstab_metadata);
        }

        public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
        {
            db_role_privilege_map.BindActuals(sort_order, be_sort_order_ascending, target);
        }

        public void Save(string member_id, string role_id, bool be_granted)
        {
            db_role_privilege_map.Save(member_id, role_id, be_granted);
        }

    } // end TClass_biz_role_privilege_map

}

namespace Class_biz_role_privilege_map.Units
{
    public class Class_biz_role_privilege_map
    {
    } // end Class_biz_role_privilege_map

}

