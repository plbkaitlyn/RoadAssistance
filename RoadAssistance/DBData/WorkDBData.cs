using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections;
using RoadAssistance.Classes;

namespace RoadAssistance.DBData
{
    public class WorkDBData
    {
        string _connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
        public ArrayList FindWork()
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    int userID = (int)HttpContext.Current.Session["UserID"];
                    string query = "SELECT * FROM work WHERE userID = @userID";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.ExecuteNonQuery();

                    ArrayList _jobs = new ArrayList();
                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    while (dataReader.Read())
                    {
                        int workID = Convert.ToInt32(dataReader["workID"]);
                        double distance = Convert.ToDouble(dataReader["distance"]);
                        string customerName = Convert.ToString(dataReader["customer"]);
                        string issue = Convert.ToString(dataReader["issue"]);
                        Work work = new Work(workID, distance, customerName, issue);
                        _jobs.Add(work);
                    }
                    return _jobs;
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }
    }
}