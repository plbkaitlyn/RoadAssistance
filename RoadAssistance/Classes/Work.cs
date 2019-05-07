using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoadAssistance.Classes
{
    public class Work
    {
        private int _workID;
        public int WorkID
        {
            get { return _workID; }
        }
        
        private double _distance;
        public double Distance
        {
            get { return _distance; }
        }

        private string _customerName;
        public string CustomerName
        {
            get { return _customerName; }
        }

        private int _customerID;
        public int CustomerID
        {
            get { return _customerID; }
        }

        private string _issueType;
        public string IssueType
        {
            get { return _issueType; }
        }

        public Work(int workID, double distance, string customerName, int customerID, string type)
        {
            _workID = workID;
            _distance = distance;
            _customerName = customerName;
            _customerID = customerID;
            _issueType = type;
        }
        /**/
    }
}