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
    public partial class UpdateContractorProfile : System.Web.UI.Page
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
                        string query = "SELECT * FROM contractor JOIN account ON contractor.userID = account.userID WHERE contractor.userID = @userID";
                       
                        MySqlCommand cmd = new MySqlCommand(query, connection);
                        cmd.Parameters.AddWithValue("@userID", userID);
                        cmd.ExecuteNonQuery();

                        MySqlDataReader dataReader = cmd.ExecuteReader();
                        
                        if (dataReader.Read())
                        {
                            string sLicense = dataReader.GetInt32("license").ToString();
                            string username = dataReader.GetString("userName");
                            string sPassword = dataReader.GetString("userPassword");
                            string sEmail = dataReader.GetString("email");
                            string sAccName = dataReader.GetString("accName");
                            string sAccNo = dataReader.GetInt32("accNo").ToString();
                            string sBsb = dataReader.GetInt32("bsb").ToString();

                            userName.Value = username;
                            email.Value = sEmail;
                            password.Value = sPassword; //password shouldn't be visible ==> need a secure way to change password
                            license.Value = sLicense;
                            accName.Value = sAccName;
                            accNo.Value = sAccNo;
                            bsb.Value = sBsb;
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