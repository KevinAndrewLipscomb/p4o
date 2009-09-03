using Class_db;
using MySql.Data.MySqlClient;
using System;
using System.Collections;

namespace Class_db_user
{
    public class TClass_db_user: TClass_db
    {
        //Constructor  Create()
        public TClass_db_user() : base()
        {
            // TODO: Add any constructor code here

        }
        public string[] RolesOf(string id)
        {
            string[] result;
            MySqlDataReader dr;
            ArrayList roles_of;

            roles_of = new ArrayList();
            this.Open();
            dr = new MySqlCommand("select name" + " from role" + " join role_member_map on (role_member_map.role_id=role.id)" + " join user_member_map on (user_member_map.member_id=role_member_map.member_id)" + " where user_member_map.user_id = " + id, this.connection).ExecuteReader();
            while (dr.Read())
              {
              roles_of.Add(dr["name"].ToString());
              }
            dr.Close();
            this.Close();
            result = (string[])(roles_of.ToArray());
            return result;
        }

    } // end TClass_db_user

}

namespace Class_db_user.Units
{
    public class Class_db_user
    {
    } // end Class_db_user

}

