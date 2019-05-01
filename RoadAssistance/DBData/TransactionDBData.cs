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
    public class TransactionDBData
    {
        string _connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();

        public ArrayList GetPastTransactions()
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    int userID = (int)HttpContext.Current.Session["UserID"];
                    string query = "SELECT * FROM past_transaction WHERE userID = @userID";

                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.ExecuteNonQuery();

                    ArrayList _transactions = new ArrayList();
                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    while (dataReader.Read())
                    {
                        int transactionID = Convert.ToInt32(dataReader["transID"]);
                        double cost = Convert.ToDouble(dataReader["cost"]);
                        string contractorName = Convert.ToString(dataReader["contractor"]);
                        string review = Convert.ToString(dataReader["review"]);
                        double rating = Convert.ToDouble(dataReader["rating"]);

                        Transaction tran = new Transaction(transactionID, cost, contractorName, review, rating);
                        _transactions.Add(tran);
                    }
                    return _transactions;
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }

        public void SavePastTransaction(string review, double rating)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                try
                {
                    connection.Open();
                    int userID = (int)HttpContext.Current.Session["UserID"];
                    string query = "UPDATE past_transaction SET review=@review, rating=@rating WHERE userID=@userID";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@review", review);
                    cmd.Parameters.AddWithValue("@rating", rating);
                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }
    }
}