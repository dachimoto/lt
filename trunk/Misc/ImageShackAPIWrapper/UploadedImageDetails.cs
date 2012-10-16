using System;
using System.Collections.Generic;
using System.Text;

namespace ImageShackAPIWrapper
{
    public class UploadedImageDetails
    {
        private string _imageLink;
        private string _thumbLink;
        private string _adLink;
        private bool _thumbExists;
        private int _totalRaters;
        private double _averageRating;
        private string _imageLocation;
        private string _thumbLocation;
        private string _server;
        private string _imageName;
        private string _donePage;
        private string _resolution;
        private int _fileSize;
        private string _imageClass;


        public string ImageLink
        {
            get { return _imageLink; }
            set { _imageLink = value; }
        }


        public string ThumbLink
        {
            get { return _thumbLink; }
            set { _thumbLink = value; }
        }


        public string AdLink
        {
            get { return _adLink; }
            set { _adLink = value; }
        }


        public bool ThumbExists
        {
            get { return _thumbExists; }
            set { _thumbExists = value; }
        }


        public int TotalRaters
        {
            get { return _totalRaters; }
            set { _totalRaters = value; }
        }


        public double AverageRating
        {
            get { return _averageRating; }
            set { _averageRating = value; }
        }


        public string ImageLocation
        {
            get { return _imageLocation; }
            set { _imageLocation = value; }
        }


        public string ThumbLocation
        {
            get { return _thumbLocation; }
            set { _thumbLocation = value; }
        }


        public string Server
        {
            get { return _server; }
            set { _server = value; }
        }


        public string ImageName
        {
            get { return _imageName; }
            set { _imageName = value; }
        }


        public string DonePage
        {
            get { return _donePage; }
            set { _donePage = value; }
        }


        public string Resolution
        {
            get { return _resolution; }
            set { _resolution = value; }
        }


        public int FileSize
        {
            get { return _fileSize; }
            set { _fileSize = value; }
        }


        public string ImageClass
        {
            get { return _imageClass; }
            set { _imageClass = value; }
        }
    }
}
