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
    public class CustomerDBData
    {
        string _connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
        public void CustomerRegister(Customer newUser)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string userQuery = "INSERT INTO user(userType, userName, userpassword) VALUES (@type, @name, @password)";

                    MySqlCommand userCmd = new MySqlCommand(userQuery, connection);
                    userCmd.Parameters.AddWithValue("@name", newUser.Name);
                    userCmd.Parameters.AddWithValue("@type", "customer");
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

                    string customerQuery = "INSERT INTO customer VALUES (@userID, @name, @password, @email)";
                    MySqlCommand customerCmd = new MySqlCommand(customerQuery, connection);
                    customerCmd.Parameters.AddWithValue("@userID", userID);
                    customerCmd.Parameters.AddWithValue("@name", newUser.Name);
                    customerCmd.Parameters.AddWithValue("@password", newUser.Password);
                    customerCmd.Parameters.AddWithValue("@email", newUser.Email);
                    customerCmd.ExecuteNonQuery();

                    connection.Close();

                    InsertVehicle(newUser, userID);
                    InsertPayment(newUser, userID);
                }
                catch (MySqlException ex)
                {
                    if (ex.Message.Contains("user_ck1"))
                    {

                        throw new System.ApplicationException("Username has already been used. Please try another one!");
                    }
                    else if (ex.Message.Contains("customer_ck2"))
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

        public void InsertVehicle (Customer newUser, int userID)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string vQuery = "INSERT INTO vehicle VALUES (@regNo, @make, @model, @color, @userID)";
                    MySqlCommand vCmd = new MySqlCommand(vQuery, connection);
                    vCmd.Parameters.AddWithValue("@userID", userID);
                    vCmd.Parameters.AddWithValue("@regNo", newUser.RegNo);
                    vCmd.Parameters.AddWithValue("@make", newUser.Make);
                    vCmd.Parameters.AddWithValue("@model", newUser.Model);
                    vCmd.Parameters.AddWithValue("@color", newUser.Color);
                    vCmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }
        
        public void InsertPayment(Customer newUser, int userID)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string pQuery = "INSERT INTO payment(cardHolder,cardNo,expMonth,expYear,cvv,userID) VALUES (@cardName,@cardNo,@expMonth,@expYear,@cvv,@userID)";
                    MySqlCommand pCmd = new MySqlCommand(pQuery, connection);
                    pCmd.Parameters.AddWithValue("@userID", userID);
                    pCmd.Parameters.AddWithValue("@cardName", newUser.CardName);
                    pCmd.Parameters.AddWithValue("@cardNo", newUser.CardNumber);
                    pCmd.Parameters.AddWithValue("@expMonth", newUser.ExpMonth);
                    pCmd.Parameters.AddWithValue("@expYear", newUser.ExpYear);
                    pCmd.Parameters.AddWithValue("@cvv", newUser.CVV);
                    pCmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }

        public void CustomerUpdateProfile(Customer user)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string query = "SELECT userID FROM customer WHERE email = @email";
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
                    string userQuery = "UPDATE user SET userName=@name, userpassword=@password WHERE userID = @userID";

                    MySqlCommand userCmd = new MySqlCommand(userQuery, connection);
                    userCmd.Parameters.AddWithValue("@name", user.Name);
                    userCmd.Parameters.AddWithValue("@userID", userID);
                    userCmd.Parameters.AddWithValue("@password", user.Password);
                    userCmd.ExecuteNonQuery();
                    
                    connection.Close();
                    connection.Open();

                    string customerQuery = "UPDATE customer SET userName=@name,userPassword=@password,email=@email WHERE userID=@userID";
                    MySqlCommand customerCmd = new MySqlCommand(customerQuery, connection);
                    customerCmd.Parameters.AddWithValue("@userID", userID);
                    customerCmd.Parameters.AddWithValue("@name", user.Name);
                    customerCmd.Parameters.AddWithValue("@password", user.Password);
                    customerCmd.Parameters.AddWithValue("@email", user.Email);
                    customerCmd.ExecuteNonQuery();

                    connection.Close();

                    UpdateVehicle(user, userID);
                    UpdatePayment(user, userID);
                }
                catch (MySqlException ex)
                {
                    if (ex.Message.Contains("user_ck1"))
                    {
                        throw new System.ApplicationException("Username has already been used. Please try another one!");
                    }
                    else if (ex.Message.Contains("customer_ck2"))
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
        public void UpdateVehicle(Customer user, int userID)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string vQuery = "UPDATE vehicle SET regNo=@regNo, make=@make, model=@model, color=@color WHERE userID=@userID";
                    MySqlCommand vCmd = new MySqlCommand(vQuery, connection);
                    vCmd.Parameters.AddWithValue("@userID", userID);
                    vCmd.Parameters.AddWithValue("@regNo", user.RegNo);
                    vCmd.Parameters.AddWithValue("@make", user.Make);
                    vCmd.Parameters.AddWithValue("@model", user.Model);
                    vCmd.Parameters.AddWithValue("@color", user.Color);
                    vCmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }

        public void UpdatePayment(Customer user, int userID)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                connection.Open();
                try
                {
                    string pQuery = "UPDATE payment SET cardHolder=@cardName,cardNo=@cardNo,expMonth=@expMonth,expYear=@expYear,cvv=@cvv WHERE userID=@userID";
                    MySqlCommand pCmd = new MySqlCommand(pQuery, connection);
                    pCmd.Parameters.AddWithValue("@userID", userID);
                    pCmd.Parameters.AddWithValue("@cardName", user.CardName);
                    pCmd.Parameters.AddWithValue("@cardNo", user.CardNumber);
                    pCmd.Parameters.AddWithValue("@expMonth", user.ExpMonth);
                    pCmd.Parameters.AddWithValue("@expYear", user.ExpYear);
                    pCmd.Parameters.AddWithValue("@cvv", user.CVV);
                    pCmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new System.ApplicationException(ex.Message);
                }
            }
        }
    }
}