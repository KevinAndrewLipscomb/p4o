using Class_db_user;
using Class_db_users;
using System;
using System.Collections.Specialized;
using System.Web;

namespace Class_biz_user
{
    public class TClass_biz_user
    {
        private readonly TClass_db_user db_user = null;
        private readonly TClass_db_users db_users = null;

        //Constructor  Create()
        public TClass_biz_user() : base()
        {
            // TODO: Add any constructor code here
            db_user = new TClass_db_user();
            db_users = new TClass_db_users();
        }

    public void BindNotificationsToBaseDataList(object target)
      {
      db_user.BindNotificationsToBaseDataList(IdNum(),target);
      }

    public void BindPrivilegesToBaseDataList(object target)
      {
      db_user.BindPrivilegesToBaseDataList(IdNum(),target);
      }

    public void BindRolesToBaseDataList(object target)
      {
      db_user.BindRolesToBaseDataList(IdNum(),target);
      }

        public string EmailAddress()
        {
            string result;
            result = db_users.PasswordResetEmailAddressOfId(IdNum());
            return result;
        }

        public string IdNum()
        {
            string result;
            result = db_users.IdOf(HttpContext.Current.User.Identity.Name);
            return result;
        }

    internal DateTime LastLoginTime()
      {
      return db_user.LastLoginTime(IdNum());
      }

        public string[] Privileges()
        {
            string[] result;
            result = db_users.PrivilegesOf(IdNum());
            return result;
        }

        public string[] Roles()
        {
            string[] result;
            result = db_user.RolesOf(IdNum());
            return result;
        }

    } // end TClass_biz_user

}

