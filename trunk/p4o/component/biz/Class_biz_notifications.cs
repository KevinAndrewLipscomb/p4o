using Class_db_notifications;
using Class_biz_members;
using Class_biz_roles;
using Class_biz_user;
using Class_biz_users;
using System;
using System.Configuration;
using System.IO;
using System.Web;

namespace Class_biz_notifications
{
    public class TClass_biz_notifications
    {
        private string application_name = String.Empty;
        private TClass_db_notifications db_notifications = null;
        private string host_domain_name = String.Empty;
        private string runtime_root_fullspec = String.Empty;
        //Constructor  Create()
        public TClass_biz_notifications() : base()
        {
            // TODO: Add any constructor code here
            application_name = ConfigurationManager.AppSettings["application_name"];
            db_notifications = new TClass_db_notifications();
            host_domain_name = ConfigurationManager.AppSettings["host_domain_name"];
            runtime_root_fullspec = ConfigurationManager.AppSettings["runtime_root_fullspec"];
        }
        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_notifications.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Notification --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, kix.Units.kix.EMPTY);
        }

        private delegate string IssueForForgottenUsername_Merge(string s);
        public void IssueForForgottenUsername(string email_address, string username, string client_host_name)
        {
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForForgottenUsername_Merge Merge = delegate (string s)
              {
              return s.Replace("<application_name/>", application_name).Replace("<host_domain_name/>", host_domain_name).Replace("<client_host_name/>", client_host_name).Replace("<email_address/>", client_host_name).Replace("<username/>", username);
              };

            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/username_reminder.txt"));
            // from
            // to
            // subject
            // body
            kix.Units.kix.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], email_address, Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForMembershipEstablishmentTrouble_Merge(string s);
        public void IssueForMembershipEstablishmentTrouble(string full_name, string explanation)
        {
            string user_email_address = kix.Units.kix.EMPTY;
            TClass_biz_user biz_user;
            StreamReader template_reader;

            IssueForMembershipEstablishmentTrouble_Merge Merge = delegate (string s)
              {
              return s.Replace("<full_name/>", full_name.ToUpper()).Replace("<user_email_address/>", user_email_address).Replace("<application_name/>", application_name).Replace("<explanation/>", explanation).Replace("<host_domain_name/>", host_domain_name);
              };

            biz_user = new TClass_biz_user();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/membership_establishment_trouble.txt"));
            user_email_address = biz_user.EmailAddress();
            // from
            // to
            // subject
            // body
            kix.Units.kix.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], ConfigurationManager.AppSettings["membership_establishment_liaison"] + kix.Units.kix.COMMA + ConfigurationManager.AppSettings["application_name"] + "-appadmin@" + host_domain_name, Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForRoleChange_Merge(string s);
        public void IssueForRoleChange(string member_id, string role_id, bool be_granted)
        {
            string actor = kix.Units.kix.EMPTY;
            string actor_email_address = kix.Units.kix.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_roles biz_roles;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            string changed = kix.Units.kix.EMPTY;
            string first_name = kix.Units.kix.EMPTY;
            string last_name = kix.Units.kix.EMPTY;
            string role_name = kix.Units.kix.EMPTY;
            StreamReader template_reader;
            string to_or_from = kix.Units.kix.EMPTY;

            IssueForRoleChange_Merge Merge = delegate (string s)
              {
              return s.Replace("<application_name/>", application_name).Replace("<host_domain_name/>", host_domain_name).Replace("<actor/>", actor).Replace("<actor_email_address/>", actor_email_address).Replace("<changed/>", changed).Replace("<to_or_from/>", to_or_from).Replace("<first_name/>", first_name).Replace("<last_name/>", last_name).Replace("<role_name/>", role_name).Replace("<runtime_root_fullspec/>", runtime_root_fullspec);
              };

            biz_members = new TClass_biz_members();
            biz_roles = new TClass_biz_roles();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + kix.Units.kix.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + kix.Units.kix.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            if (be_granted)
            {
                changed = "granted";
                to_or_from = "to";
            }
            else
            {
                changed = "removed";
                to_or_from = "from";
            }
            first_name = biz_members.FirstNameOfMemberId(member_id);
            last_name = biz_members.LastNameOfMemberId(member_id);
            role_name = biz_roles.NameOfId(role_id);
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/role_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            kix.Units.kix.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + kix.Units.kix.COMMA + actor_email_address + kix.Units.kix.COMMA + db_notifications.TargetOf("role-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, kix.Units.kix.EMPTY, kix.Units.kix.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForTemporaryPassword_Merge(string s);
        public void IssueForTemporaryPassword(string username, string client_host_name, string temporary_password)
        {
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForTemporaryPassword_Merge Merge = delegate(string s)
              {
              return s.Replace("<application_name/>", application_name).Replace("<host_domain_name/>", host_domain_name).Replace("<client_host_name/>", client_host_name).Replace("<temporary_password/>", temporary_password);
              };

            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/temporary_password.txt"));
            // from
            // to
            // subject
            // body
            kix.Units.kix.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_users.PasswordResetEmailAddressOfUsername(username), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

    } // end TClass_biz_notifications

}

namespace Class_biz_notifications.Units
{
    public class Class_biz_notifications
    {
        public static char[] BreakChars = new char[3 + 1];
        //Constructor  Class_biz_notifications()
        static Class_biz_notifications()
        {
            BreakChars[1] = kix.Units.kix.SPACE;
            BreakChars[2] = Convert.ToChar(kix.Units.kix.TAB);
            BreakChars[3] = kix.Units.kix.HYPHEN;
        }
    } // end Class_biz_notifications

}

