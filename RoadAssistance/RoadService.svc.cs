using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;

namespace RoadAssistance
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class RoadService
    {
        [OperationContract]
        public string Login(string name, string password)
        {
            try
            {
                User checkUser = new User(name, password);
                UserDBData data = new UserDBData();
                string type = data.Login(checkUser);
                return type;
                //string json = new JavaScriptSerializer().Serialize(type);
                //return json;
            }
            catch (Exception oEx)
            {
                return oEx.Message;
            }
        }

        [OperationContract]
        public string Logout()
        {
            UserDBData data = new UserDBData();
            data.Logout();
            return "";
        }
        
        [OperationContract]
        public string CustomerRegister(string name,string password,string email,string regNo,string maker,string model,string color,string cardName,double cardNo,int expMonth,int expYear,int cvv)
        {
            try
            {
                Customer newUser = new Customer(name,password,email,regNo,maker,model,color,cardName,cardNo,expMonth,expYear,cvv);
                CustomerDBData data = new CustomerDBData();
                data.CustomerRegister(newUser);
                return "";
            }
            catch (Exception oEx)
            {
                return oEx.Message;
            }
        }

        [OperationContract]
        public string CustomerUpdateProfile(string name, string password, string email, string regNo, string make, string model, string color, string cardName, double cardNo, int expMonth, int expYear, int cvv)
        {
            try
            {
                Customer user = new Customer(name, password, email, regNo, make, model, color, cardName, cardNo, expMonth, expYear, cvv);
                CustomerDBData data = new CustomerDBData();
                data.CustomerUpdateProfile(user);
                return "";
            }
            catch (Exception oEx)
            {
                return oEx.Message;
            }
        }

        [OperationContract]
        public string ContractorRegister(int license, string name, string password, string email, string accName, int accNo, int bsb)
        {
            try
            {
                Contractor newUser = new Contractor(license, name, password, email, accName, accNo, bsb);
                ContractorDBData data = new ContractorDBData();
                data.ContractorRegister(newUser);
                return "";
            }
            catch (Exception oEx)
            {
                return oEx.Message;
            }
        }
        
        [OperationContract]
        public string ContractorUpdateProfile(int license, string name, string password, string email, string accName, int accNo, int bsb)
        {
            try
            {
                Contractor user = new Contractor(license, name, password, email, accName, accNo, bsb);
                ContractorDBData data = new ContractorDBData();
                data.ContractorUpdateProfile(user);
                return "";
            }
            catch (Exception oEx)
            {
                return oEx.Message;
            }
        }
    }
}
