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
        int userID = (int)HttpContext.Current.Session["UserID"];
        public ArrayList FindWork()
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    //int userID = (int)HttpContext.Current.Session["UserID"];
                    string query = "SELECT * FROM work JOIN customer ON work.customerID = customer.userID WHERE work.userID = @userID";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.ExecuteNonQuery();
                   
                    ArrayList _jobs = new ArrayList();
                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    while (dataReader.Read())
                    {
                        int workID = Convert.ToInt32(dataReader["workID"]);
                        double distance = Convert.ToDouble(dataReader["distance"]);
                        string customerName = Convert.ToString(dataReader["userName"]);
                        int customerID = Convert.ToInt32(dataReader["customerID"]);
                        string issue = Convert.ToString(dataReader["issue"]);
                        Work work = new Work(workID, distance, customerName, customerID, issue);
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

        public Request GetJobDetails(int cusID)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string query = "SELECT * FROM request JOIN customer ON request.cusID = customer.userID " +
                        "JOIN vehicle ON vehicle.userID = customer.userID WHERE request.cusID = @cusID";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@cusID", cusID);
                    cmd.ExecuteNonQuery();

                    Request request = null;

                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    if (dataReader.Read())
                    {
                        string issue = Convert.ToString(dataReader["issueType"]);
                        string description = Convert.ToString(dataReader["description"]);
                        string customerName = Convert.ToString(dataReader["userName"]);
                        string make = Convert.ToString(dataReader["make"]);
                        string model = Convert.ToString(dataReader["model"]);
                        string color = Convert.ToString(dataReader["color"]);
                        string registration = Convert.ToString(dataReader["regNo"]);
                        request = new Request(issue, description, customerName, make, model, color, registration);
                    }
                    return request;
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }
    }
}