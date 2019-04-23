using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;


namespace RoadAssistance
{
    public class User
    {
        protected int _userID;
        public int ID
        {
            get { return _userID; }
        }
        
        protected string _userName;
        public string Name
        {
            get { return _userName; }
        }

        protected string _userPassword;
        public string Password
        {
            get { return _userPassword; }
        }
        
        public User(string name, string password)
        {
            if (name == "" || password == "")
            {
                throw new System.ArgumentException("Username and/or password must have a value!");
            }
            _userName = name;
            _userPassword = password;
        }

        /*
        public User(int id, string name, string password)
        {
            if (name == "" || email == "" || password == "")
            {
                throw new System.ArgumentException("No field is empty!");
            }
            Regex regex = new Regex(@"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$");
            Match match = regex.Match(email);
            if (!match.Success)
                throw new System.ApplicationException("Please provide a valid email address!");
            
            _userID = id;
            _userName = name;
            _userEmail = email;
            _userPassword = password;
        }*/

        /*
        public User(int license, string name, string password, string email, string accName, int accNo, int bsb)
        {
            /*------------------------------------------------------------------------------------------
            if (name == "" || email == "" || password == "" || accName == "" || accNo == 0 || bsb == 0)
            {
                throw new System.ArgumentException("No field is empty!");
            }
            
            Regex regex = new Regex(@"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$");
            Match match = regex.Match(email);
            if (!match.Success)
                throw new System.ApplicationException("Please provide a valid email address!");
            
            if (Math.Floor(Math.Log10(bsb) + 1) != 9)
            {
                throw new System.ApplicationException("Please enter a 9-digit account number!");
            }
            if (Math.Floor(Math.Log10(bsb) + 1) != 6)
            {
                throw new System.ApplicationException("Please enter a 6-digit BSB number!");
            }--------------------------------------------------------------------------------------
            _license = license;
            _userName = name;
            _userPassword = password;
            _userEmail = email;
            _accName = accName;
            _accNo = accNo;
            _bsb = bsb;
        }*/
    }
}