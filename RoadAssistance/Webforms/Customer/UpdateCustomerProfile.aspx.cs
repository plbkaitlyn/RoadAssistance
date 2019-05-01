using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoadAssistance
{
    public partial class UpdateCustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"].ToString() != "")
            {
                string _connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                using (MySqlConnection connection = new MySqlConnection(_connectionString))
                {
                    connection.Open();
                    try
                    {
                        int userID = (int)HttpContext.Current.Session["UserID"];
                        string query = "SELECT * FROM customer JOIN vehicle ON customer.userID = vehicle.userID " +
                            "JOIN payment ON vehicle.userID = payment.userID WHERE customer.userID = @userID";

                        MySqlCommand cmd = new MySqlCommand(query, connection);
                        cmd.Parameters.AddWithValue("@userID", userID);
                        cmd.ExecuteNonQuery();

                        MySqlDataReader dataReader = cmd.ExecuteReader();

                        if (dataReader.Read())
                        {
                            string sFullname = dataReader.GetString("name");
                            string username = dataReader.GetString("userName");
                            string sPassword = dataReader.GetString("userPassword");
                            string sEmail = dataReader.GetString("email");
                            string sRegNo = dataReader.GetString("regNo");
                            string sMake = dataReader.GetString("make");
                            string sModel = dataReader.GetString("model");
                            string sColor = dataReader.GetString("color");
                            string sCardName = dataReader.GetString("cardHolder");
                            string sCardNo = dataReader.GetInt64("cardNo").ToString();
                            string sExpMonth = dataReader.GetInt32("expMonth").ToString();
                            string sExpYear = dataReader.GetInt32("expYear").ToString();
                            string sCvv = dataReader.GetInt32("cvv").ToString();

                            name.Value = sFullname;
                            userName.Value = username;
                            email.Value = sEmail;
                            password.Value = sPassword; //password shouldn't be visible ==> need a secure way to change password
                            regNo.Value = sRegNo;
                            make.Value = sMake;
                            model.Value = sModel;
                            color.Value = sColor;
                            cardName.Value = sCardName;
                            cardNo.Value = sCardNo;
                            expDate.Value = sExpMonth + "/" + sExpYear;
                            cvv.Value = sCvv;
                        }
                    }
                    catch (MySqlException ex)
                    {
                        throw new System.ApplicationException(ex.Message);
                    }
                }
            }
        }
    }
}