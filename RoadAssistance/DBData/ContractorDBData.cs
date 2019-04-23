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
    public class ContractorDBData
    {
        string _connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();

        public ContractorDBData() { }

        public void ContractorRegister(Contractor newUser)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string userQuery = "INSERT INTO user(userType, userName, userpassword) VALUES (@type, @name, @password)";

                    MySqlCommand userCmd = new MySqlCommand(userQuery, connection);
                    userCmd.Parameters.AddWithValue("@name", newUser.Name);
                    userCmd.Parameters.AddWithValue("@type", "contractor");
                    userCmd.Parameters.AddWithValue("@password", newUser.Password);
                    userCmd.ExecuteNonQuery();

                    string query = "SELECT userID FROM user WHERE userName = @name";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@name", newUser.Name);
                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    int userID = 0;
                    if (dataReader.Read())
                    {
                        userID = Convert.ToInt32(dataReader["userID"]);
                    }

                    connection.Close();
                    connection.Open();

                    string contractorQuery = "INSERT INTO contractor VALUES (@userID, @license, @name, @password, @email)";
                    MySqlCommand contractorCmd = new MySqlCommand(contractorQuery, connection);
                    contractorCmd.Parameters.AddWithValue("@userID", userID);
                    contractorCmd.Parameters.AddWithValue("@license", newUser.License);
                    contractorCmd.Parameters.AddWithValue("@name", newUser.Name);
                    contractorCmd.Parameters.AddWithValue("@password", newUser.Password);
                    contractorCmd.Parameters.AddWithValue("@email", newUser.Email);
                    contractorCmd.ExecuteNonQuery();

                    connection.Close();
                    connection.Open();

                    string accQuery = "INSERT INTO account(accName, accNo, bsb, userID) VALUES (@accName, @accNo, @bsb, @userID)";
                    MySqlCommand accCmd = new MySqlCommand(accQuery, connection);
                    accCmd.Parameters.AddWithValue("@userID", userID);
                    accCmd.Parameters.AddWithValue("@accName", newUser.AccountName);
                    accCmd.Parameters.AddWithValue("@accNo", newUser.AccountNumber);
                    accCmd.Parameters.AddWithValue("@bsb", newUser.BSB);
                    accCmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    if (ex.Message.Contains("user_ck1"))
                    {
                        throw new System.ApplicationException("Username has already been used. Please try another one!");
                    }
                    else if (ex.Message.Contains("contractor_ck3"))
                    {
                        throw new System.ApplicationException("You have already used this email address to register!");
                    }
                    else if (ex.Message.Contains("contractor_ck1"))
                    {
                        throw new System.ApplicationException("You have already used this motor tradeperson certificate number!");
                    }
                    else
                    {
                        throw new System.ApplicationException(ex.Message);
                    }
                }
            }
        }
        /*
         Problem: 
         -Cannot keep the old userID, have new id everytime changes are saved
         
        public void ContractorUpdateProfile(Contractor user)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string query = "SELECT userID FROM contractor WHERE email = @email";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    int userID = 0;
                    if (dataReader.Read())
                    {
                        userID = Convert.ToInt32(dataReader["userID"]);
                    }

                    connection.Close();
                    connection.Open();

                    string query1 = "DELETE user FROM user WHERE user.userID = @userID";
                    MySqlCommand cmd1 = new MySqlCommand(query1, connection);
                    cmd1.Parameters.AddWithValue("@userID", userID);
                    cmd1.ExecuteNonQuery();

                    connection.Close();
                    connection.Open();

                    string query2 = "DELETE FROM account WHERE userID = @userID";
                    MySqlCommand cmd2 = new MySqlCommand(query2, connection);
                    cmd2.Parameters.AddWithValue("@userID", user.ID);
                    cmd2.ExecuteNonQuery();

                    connection.Close();
                    connection.Open();

                    string query3 = "DELETE FROM contractor WHERE userID = @userID";
                    MySqlCommand cmd3 = new MySqlCommand(query3, connection);
                    cmd3.Parameters.AddWithValue("@userID", user.ID);
                    cmd3.ExecuteNonQuery();

                    connection.Close();
                 
                    ContractorRegister(user);
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }*/
        
        public void ContractorUpdateProfile(Contractor user)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string query = "SELECT userID FROM contractor WHERE email = @email";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    MySqlDataReader dataReader = cmd.ExecuteReader();
                    int userID = 0;
                    if (dataReader.Read())
                    {
                        userID = Convert.ToInt32(dataReader["userID"]);
                    }

                    connection.Close();
                    connection.Open();

                    string userQuery = "UPDATE user SET userName = @name, userPassword = @password WHERE userID = @userID";

                    MySqlCommand userCmd = new MySqlCommand(userQuery, connection);
                    userCmd.Parameters.AddWithValue("@name", user.Name);
                    userCmd.Parameters.AddWithValue("@userID", userID);
                    userCmd.Parameters.AddWithValue("@password", user.Password);
                    userCmd.ExecuteNonQuery();
                    
                    connection.Close();
                    connection.Open();

                    string contractorQuery = "UPDATE contractor SET license=@license, userName=@name, userPassword=@password, email=@email WHERE userID=@userID";
                    MySqlCommand contractorCmd = new MySqlCommand(contractorQuery, connection);
                    contractorCmd.Parameters.AddWithValue("@userID", userID);
                    contractorCmd.Parameters.AddWithValue("@license", user.License);
                    contractorCmd.Parameters.AddWithValue("@name", user.Name);
                    contractorCmd.Parameters.AddWithValue("@password", user.Password);
                    contractorCmd.Parameters.AddWithValue("@email", user.Email);
                    contractorCmd.ExecuteNonQuery();

                    connection.Close();
                    connection.Open();

                    string accQuery = "UPDATE account SET accName=@accName, accNo=@accNo, bsb=@bsb, userID=@userID";
                    MySqlCommand accCmd = new MySqlCommand(accQuery, connection);
                    accCmd.Parameters.AddWithValue("@userID", userID);
                    accCmd.Parameters.AddWithValue("@accName", user.AccountName);
                    accCmd.Parameters.AddWithValue("@accNo", user.AccountNumber);
                    accCmd.Parameters.AddWithValue("@bsb", user.BSB);
                    accCmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    if (ex.Message.Contains("user_ck1"))
                    {
                        throw new System.ApplicationException("Username has already been used. Please try another one!");
                    }
                    else if (ex.Message.Contains("contractor_ck3"))
                    {
                        throw new System.ApplicationException("You have already used this email address to register!");
                    }
                    else
                    {
                        throw new System.ApplicationException(ex.Message);
                    }
                }
            }
        }
        /**/
    }
}