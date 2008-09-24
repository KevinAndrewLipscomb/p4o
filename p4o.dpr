library p4o;

uses
  System.Reflection,
  System.Runtime.CompilerServices,
  Class_biz_user in 'component\biz\Class_biz_user.pas',
  Class_db_user in 'component\db\Class_db_user.pas',
  Class_db in 'component\db\Class_db.pas',
  Default in 'Default.pas' {Default.TWebForm_Default: ki_web_ui.page_class},
  Global in 'Global.pas' {Global.TGlobal: System.Web.HttpApplication},
  salogin in 'salogin.pas' {salogin.TWebForm_salogin: ki_web_ui.page_class},
  change_email_address in 'protected\change_email_address.pas' {change_email_address.TWebForm_change_email_address: ki_web_ui.page_class},
  change_password in 'protected\change_password.pas' {change_password.TWebForm_change_password: ki_web_ui.page_class},
  login in 'login.pas' {login.TWebForm_login: ki_web_ui.page_class},
  exception in 'exception.pas' {exception.TWebForm_exception: ki_web_ui.page_class},
  milestone_sweep in 'noninteractive\milestone_sweep.pas' {milestone_sweep.TWebForm_milestone_sweep: system.web.ui.page},
  Class_biz_milestones in 'component\biz\Class_biz_milestones.pas',
  Class_db_milestones in 'component\db\Class_db_milestones.pas',
  Class_db_trail in 'component\db\Class_db_trail.pas',
  Class_biz_scheduled_tasks in 'component\biz\Class_biz_scheduled_tasks.pas',
  daily_tasks in 'noninteractive\daily_tasks.pas' {daily_tasks.TWebForm1: system.web.ui.page},
  Class_biz_users in 'component\biz\Class_biz_users.pas',
  Class_db_users in 'component\db\Class_db_users.pas',
  Class_biz_notifications in 'component\biz\Class_biz_notifications.pas',
  new_user_registration in 'new_user_registration.pas' {new_user_registration.TWebForm_new_user_registration: ki_web_ui.page_class},
  remind_username in 'remind_username.pas' {remind_username.TWebForm_remind_username: ki_web_ui.page_class},
  overview in 'protected\overview.pas' {overview.TWebForm_overview: ki_web_ui.page_class},
  Class_biz_members in 'component\biz\Class_biz_members.pas',
  Class_db_members in 'component\db\Class_db_members.pas',
  UserControl_establish_membership in 'usercontrol\app\UserControl_establish_membership.pas' {UserControl_establish_membership.TWebUserControl_establish_membership: ki_web_ui.usercontrol_class},
  establish_membership_trouble in 'protected\establish_membership_trouble.pas' {establish_membership_trouble.TWebForm_establish_membership_trouble: ki_web_ui.page_class},
  UserControl_precontent in 'usercontrol\app\UserControl_precontent.pas' {UserControl_precontent.TWebUserControl_precontent: ki_web_ui.usercontrol_class},
  UserControl_postcontent in 'usercontrol\app\UserControl_postcontent.pas' {UserControl_postcontent.TWebUserControl_postcontent: ki_web_ui.usercontrol_class},
  Class_db_notifications in 'component\db\Class_db_notifications.pas',
  test_report in 'noninteractive\test_report.pas' {test_report.TWebForm_test_report: system.web.ui.page},
  UserControl_member_binder in 'usercontrol\app\UserControl_member_binder.pas' {UserControl_member_binder.TWebUserControl_member_binder: ki_web_ui.usercontrol_class},
  UserControl_about in 'usercontrol\app\UserControl_about.pas' {UserControl_about.TWebUserControl_about: ki_web_ui.usercontrol_class},
  UserControl_user in 'usercontrol\app\UserControl_user.pas' {UserControl_user.TWebUserControl_user: ki_web_ui.usercontrol_class},
  UserControl_drop_down_date in 'usercontrol\ki\UserControl_drop_down_date.pas' {UserControl_drop_down_date.TWebUserControl_drop_down_date: ki_web_ui.usercontrol_class},
  UserControl_config_binder in 'usercontrol\app\UserControl_config_binder.pas' {UserControl_config_binder.TWebUserControl_config_binder: ki_web_ui.usercontrol_class},
  UserControl_config_welcome in 'usercontrol\ki\UserControl_config_welcome.pas',
  UserControl_print_div in 'usercontrol\ki\UserControl_print_div.pas' {UserControl_print_div.TWebUserControl_print_div: ki_web_ui.usercontrol_class},
  UserControl_bread_crumb_trail in 'usercontrol\ki\UserControl_bread_crumb_trail.pas' {UserControl_bread_crumb_trail.TWebUserControl_bread_crumb_trail: ki_web_ui.usercontrol_class},
  UserControl_common_header_bar in 'usercontrol\app\UserControl_common_header_bar.pas' {UserControl_common_header_bar.TWebUserControl_common_header_bar: ki_web_ui.usercontrol_class},
  Class_biz_roles in 'component\biz\Class_biz_roles.pas',
  Class_biz_role_member_map in 'component\biz\Class_biz_role_member_map.pas',
  Class_db_roles in 'component\db\Class_db_roles.pas',
  Class_db_role_member_map in 'component\db\Class_db_role_member_map.pas',
  UserControl_role_member_matrix in 'usercontrol\app\UserControl_role_member_matrix.pas' {UserControl_role_member_matrix.TWebUserControl_role_member_matrix: ki_web_ui.usercontrol_class},
  Class_biz_role_privilege_map in 'component\biz\Class_biz_role_privilege_map.pas',
  Class_biz_privileges in 'component\biz\Class_biz_privileges.pas',
  Class_biz_role_notification_map in 'component\biz\Class_biz_role_notification_map.pas',
  Class_db_role_privilege_map in 'component\db\Class_db_role_privilege_map.pas',
  Class_db_privileges in 'component\db\Class_db_privileges.pas',
  Class_db_role_notification_map in 'component\db\Class_db_role_notification_map.pas',
  UserControl_roles_and_matrices_binder in 'usercontrol\app\UserControl_roles_and_matrices_binder.pas' {UserControl_roles_and_matrices_binder.TWebUserControl_roles_and_matrices_binder: ki_web_ui.usercontrol_class},
  UserControl_role_notification_matrix in 'usercontrol\app\UserControl_role_notification_matrix.pas' {UserControl_role_notification_matrix.TWebUserControl_role_notification_matrix: ki_web_ui.usercontrol_class},
  UserControl_role_privilege_matrix in 'usercontrol\app\UserControl_role_privilege_matrix.pas' {UserControl_role_privilege_matrix.TWebUserControl_role_privilege_matrix: ki_web_ui.usercontrol_class},
  UserControl_role in 'usercontrol\app\UserControl_role.pas' {UserControl_role.TWebUserControl_role: ki_web_ui.usercontrol_class},
  UserControl_update_progress_blocker in 'usercontrol\app\UserControl_update_progress_blocker.pas' {UserControl_update_progress_blocker.TWebUserControl_update_progress_blocker: ki_web_ui.usercontrol_class},
  UserControl_role_member_mapping in 'usercontrol\app\UserControl_role_member_mapping.pas' {UserControl_role_member_mapping.TWebUserControl_role_member_mapping: ki_web_ui.usercontrol_class},
  UserControl_role_notification_mapping in 'usercontrol\app\UserControl_role_notification_mapping.pas' {UserControl_role_notification_mapping.TWebUserControl_role_notification_mapping: ki_web_ui.usercontrol_class},
  UserControl_role_privilege_mapping in 'usercontrol\app\UserControl_role_privilege_mapping.pas' {UserControl_role_privilege_mapping.TWebUserControl_role_privilege_mapping: ki_web_ui.usercontrol_class},
  Class_db_user_member_map in 'component\db\Class_db_user_member_map.pas',
  Class_biz_user_member_map in 'component\biz\Class_biz_user_member_map.pas',
  UserControl_user_member_mapping in 'usercontrol\app\UserControl_user_member_mapping.pas' {UserControl_user_member_mapping.TWebUserControl_user_member_mapping: ki_web_ui.usercontrol_class},
  UserControl_users_and_mapping_binder in 'usercontrol\app\UserControl_users_and_mapping_binder.pas' {UserControl_users_and_mapping_binder.TWebUserControl_users_and_mapping_binder: ki_web_ui.usercontrol_class},
  UserControl_session_interrupted in 'usercontrol\ki\UserControl_session_interrupted.pas',
  UserControl_about_tools in 'usercontrol\ki\UserControl_about_tools.pas' {UserControl_about_tools.TWebUserControl_about_tools: ki_web_ui.usercontrol_class},
  UserControl_about_by in 'usercontrol\ki\UserControl_about_by.pas' {UserControl_about_by.TWebUserControl_about_by: ki_web_ui.usercontrol_class},
  Class_db_squads in 'component\db\Class_db_squads.pas',
  Class_biz_squads in 'component\biz\Class_biz_squads.pas',
  UserControl_squad in 'usercontrol\app\UserControl_squad.pas' {UserControl_squad.TWebUserControl_squad: ki_web_ui.usercontrol_class},
  UserControl_business_objects_binder in 'usercontrol\app\UserControl_business_objects_binder.pas' {UserControl_business_objects_binder.TWebUserControl_business_objects_binder: ki_web_ui.usercontrol_class},
  UserControl_member in 'usercontrol\app\UserControl_member.pas' {UserControl_member.TWebUserControl_member: ki_web_ui.usercontrol_class},
  Class_biz_units in 'component\biz\Class_biz_units.pas',
  Class_db_units in 'component\db\Class_db_units.pas',
  UserControl_unit in 'usercontrol\app\UserControl_unit.pas' {UserControl_unit.TWebUserControl_unit: ki_web_ui.usercontrol_class},
  Class_biz_divisions in 'component\biz\Class_biz_divisions.pas',
  Class_db_divisions in 'component\db\Class_db_divisions.pas',
  UserControl_division in 'usercontrol\app\UserControl_division.pas' {UserControl_division.TWebUserControl_division: ki_web_ui.usercontrol_class},
  Class_biz_bureaus in 'component\biz\Class_biz_bureaus.pas',
  Class_db_bureaus in 'component\db\Class_db_bureaus.pas',
  UserControl_bureau in 'usercontrol\app\UserControl_bureau.pas' {UserControl_bureau.TWebUserControl_bureau: ki_web_ui.usercontrol_class},
  Class_biz_training_requests in 'component\biz\Class_biz_training_requests.pas',
  Class_db_training_requests in 'component\db\Class_db_training_requests.pas',
  UserControl_training_request in 'usercontrol\app\UserControl_training_request.pas' {UserControl_training_request.TWebUserControl_training_request: ki_web_ui.usercontrol_class},
  UserControl_new_binder in 'usercontrol\app\UserControl_new_binder.pas' {UserControl_new_binder.TWebUserControl_new_binder: ki_web_ui.usercontrol_class},
  Class_db_training_request_statuses in 'component\db\Class_db_training_request_statuses.pas',
  UserControl_current_binder in 'usercontrol\app\UserControl_current_binder.pas' {UserControl_current_binder.TWebUserControl_current_binder: ki_web_ui.usercontrol_class},
  Class_biz_training_request_statuses in 'component\biz\Class_biz_training_request_statuses.pas';

//
// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
//
[assembly: AssemblyDescription('')]
[assembly: AssemblyConfiguration('')]
[assembly: AssemblyCompany('')]
[assembly: AssemblyProduct('')]
[assembly: AssemblyCopyright('')]
[assembly: AssemblyTrademark('')]
[assembly: AssemblyCulture('')]

// The Delphi compiler controls the AssemblyTitleAttribute via the ExeDescription.
// You can set this in the IDE via the Project Options.
// Manually setting the AssemblyTitle attribute below will override the IDE
// setting.
// [assembly: AssemblyTitle('')]


//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers
// by using the '*' as shown below:

[assembly: AssemblyVersion('1.0.*')]

//
// In order to sign your assembly you must specify a key to use. Refer to the
// Microsoft .NET Framework documentation for more information on assembly signing.
//
// Use the attributes below to control which key is used for signing.
//
// Notes:
//   (*) If no key is specified, the assembly is not signed.
//   (*) KeyName refers to a key that has been installed in the Crypto kind1
//       Provider (CSP) on your machine. KeyFile refers to a file which contains
//       a key.
//   (*) If the KeyFile and the KeyName values are both specified, the
//       following processing occurs:
//       (1) If the KeyName can be found in the CSP, that key is used.
//       (2) If the KeyName does not exist and the KeyFile does exist, the key
//           in the KeyFile is installed into the CSP and used.
//   (*) In order to create a KeyFile, you can use the sn.exe (Strong Name) utility.
//       When specifying the KeyFile, the location of the KeyFile should be
//       relative to the project output directory which is
//       %Project Directory%\bin\<configuration>. For example, if your KeyFile is
//       located in the project directory, you would specify the AssemblyKeyFile
//       attribute as [assembly: AssemblyKeyFile('..\\..\\mykey.snk')]
//   (*) Delay Signing is an advanced option - see the Microsoft .NET Framework
//       documentation for more information on this.
//
[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile('')]
[assembly: AssemblyKeyName('')]

begin
end.
