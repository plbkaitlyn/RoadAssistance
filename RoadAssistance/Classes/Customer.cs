using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoadAssistance
{
    public class Customer : User
    {
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

        private string _regNo;
        public string RegNo
        {
            get { return _regNo; }
        }

        private string _make;
        public string Make
        {
            get { return _make; }
        }

        private string _model;
        public string Model
        {
            get { return _model; }
        }

        private string _color;
        public string Color
        {
            get { return _color; }
        }

        private string _cardName;
        public string CardName
        {
            get { return _cardName; }
        }

        private double _cardNo;
        public double CardNumber
        {
            get { return _cardNo; }
        }

        private int _expMonth;
        public int ExpMonth
        {
            get { return _expMonth; }
        }

        private int _expYear;
        public int ExpYear
        {
            get { return _expYear; }
        }

        private int _cvv;
        public int CVV
        {
            get { return _cvv; }
        }

        public Customer(string name, string password, string email) : base(name, password)
        {
            _userEmail = email;
        }

        public Customer(string name,string password,string email,string regNo,string make,string model,string color,string cardName,double cardNo)
            : base(name, password)
        {
            _userEmail = email;
            _regNo = regNo;
            _make = make;
            _model = model;
            _color = color;
            _cardName = cardName;
            _cardNo = cardNo;
        }

        public Customer(string fullname, string userName,string password,string email,string regNo,string make,string model,string color,string cardName,double cardNo,int expMonth,int expYear,int cvv)
            : base(userName, password)
        {
            _fullname = fullname;
            _userEmail = email;
            _regNo = regNo;
            _make = make;
            _model = model;
            _color = color;
            _cardName = cardName;
            _cardNo = cardNo;
            _expMonth = expMonth;
            _expYear = expYear;
            _cvv = cvv;
        }
    }
}