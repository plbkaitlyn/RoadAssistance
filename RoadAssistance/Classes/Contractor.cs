using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoadAssistance
{
    public class Contractor : User
    {
        private int _license;
        public int License
        {
            get { return _license; }
        }

        private string _fullname;
        public string FullName
        {
            get { return _fullname; }
        }

        private string _userEmail;
        public string Email
        {
            get { return _userEmail; }
        }
        
        private string _accName;
        public string AccountName
        {
            get { return _accName; }
        }

        private int _accNo;
        public int AccountNumber
        {
            get { return _accNo; }
        }

        private int _bsb;
        public int BSB
        {
            get { return _bsb; }
        }
        
        public Contractor(string fullname, int license, string userName, string password, string email, string accName, int accNo, int bsb) : base (userName, password)
        {
            _license = license;
            _fullname = fullname;
            _userEmail = email;
            _accName = accName;
            _accNo = accNo;
            _bsb = bsb;
        }
    }
}