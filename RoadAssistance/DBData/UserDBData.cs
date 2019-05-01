using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Text.RegularExpressions;

namespace RoadAssistance
{
    public class UserDBData
    {
        string _connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();

        public UserDBData() { }

        public string Login(User checkUser)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM user WHERE userName = @username";

                MySqlCommand cmd = new MySqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@username", checkUser.UserName);
                cmd.Parameters.AddWithValue("@password", checkUser.Password);
                MySqlDataReader dataReader = cmd.ExecuteReader();

                bool check = dataReader.HasRows;
                if (!check)
                {
                    throw new System.ApplicationException("Username has not been registered yet!");
                }
                connection.Close();

                connection.Open();
                string query1 = "SELECT userType, userID FROM user WHERE userName = @username AND userPassword = @password";

                MySqlCommand cmd1 = new MySqlCommand(query1, connection);
                cmd1.Parameters.AddWithValue("@username", checkUser.UserName);
                cmd1.Parameters.AddWithValue("@password", checkUser.Password);
                MySqlDataReader dataReader1 = cmd1.ExecuteReader();

                bool check1 = dataReader1.HasRows;
                if (!check1)
                {
                    throw new System.ApplicationException("Please enter the correct password!");
                }
                else
                {
                    //HttpContext.Current.Session["UserName"] = checkUser.Name;
                    HttpContext.Current.Session["UserID"] = checkUser.ID;
                    string type = "";
                    int userID = 0;
                    if (dataReader1.Read())
                    {
                        type = Convert.ToString(dataReader1["userType"]);
                        userID = Convert.ToInt32(dataReader1["userID"]);

                    }
                    HttpContext.Current.Session["UserID"] = userID;
                    return type;
                }
            }
        }
        
        public void Logout()
        {

            HttpContext.Current.Session["UserName"] = "";
        }
    }
}
