using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoadAssistance.Classes
{
    public class Request
    {
        /*
        private int _customerID;
        public int CustomerID
        {
            get { return _customerID; }
        }
        */
        private string _issueType;
        public string IssueType
        {
            get { return _issueType; }
        }

        private string _description;
        public string Description
        {
            get { return _description; }
        }

        private string _customerName;
        public string CustomerName
        {
            get { return _customerName; }
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

        private string _regNo;
        public string RegNo
        {
            get { return _regNo; }
        }

        public Request(string issueType, string description, string customerName, string make, string model, string color, string regNo)
        {
            _issueType = issueType;
            _description = description;
            _customerName = customerName;
            _make = make;
            _model = model;
            _color = color;
            _regNo = regNo;
        }
    }
}