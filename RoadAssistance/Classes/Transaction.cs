using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoadAssistance.Classes
{
    public class Transaction
    {
        private int _transactionID;
        public int TransactionID
        {
            get { return _transactionID; }
        }

        private double _cost;
        public double Cost
        {
            get { return _cost; }
        }

        private string _contractorName;
        public string ContractorName
        {
            get { return _contractorName; }
        }

        private string _review;
        public string Review
        {
            get { return _review; }
        }

        private double _rating;
        public double Rating
        {
            get { return _rating; }
        }

        public Transaction(int id, double cost, string contractorName, string review, double rating)
        {
            _transactionID = id;
            _cost = cost;
            _contractorName = contractorName;
            _review = review;
            _rating = rating;
        }
    }
}