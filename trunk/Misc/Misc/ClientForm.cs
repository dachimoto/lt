using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Net;
using ImageShackAPIWrapper;
using System.Diagnostics;
using System.Xml;

namespace Misc
{
    public partial class ClientForm : Form
    {
        private UploadedImageDetails _lastImageUploadDetails;
        

        public ClientForm()
        {
            InitializeComponent();
            _lastImageUploadDetails = new UploadedImageDetails();
            chkResize.Checked = false;
        }


        private void btnUploadToImageShack_Click(object sender, EventArgs e)
        {
            IImageShackUploader uploader = new StandardImageShackUploader();

            ClearLastUploadedImageDisplayDetails();
            if (chkResize.Checked == true)
            {
                int resizeWidth;
                bool validResizeWidth = int.TryParse(txtImageWidth.Text, out resizeWidth);
                int resizeHeight;
                bool validResizeHeight = int.TryParse(txtImageHeight.Text, out resizeHeight);
                if (!validResizeHeight || !validResizeWidth)
                {
                    txtInfo.Text = "Invalid resize width or height entered";
                }
                else
                {
                    txtInfo.Text = "Uploading Image...";

                    // uploading image can take some time, so assign it to a BackgroundWorker to prevent the
                    // main UI thread being frozen up.
                    BackgroundWorker bw = new BackgroundWorker();
                    bw.DoWork += delegate(object sender2, DoWorkEventArgs e2)
                    { 
                        _lastImageUploadDetails = uploader.UploadImage(txtFilePath.Text, resizeWidth, resizeHeight); 
                    };

                    bw.RunWorkerAsync();

                    // when the background worker is finished, run this anonymous method which either updates
                    // the details of the last uploaded image or displays an appropriate error message
                    // if there were problems.
                    bw.RunWorkerCompleted += delegate(object sender3, RunWorkerCompletedEventArgs e3)
                    {
                        try
                        {
                            if (e3.Error != null)
                            {
                                throw e3.Error;
                            }
                            UpdateLastUploadedImageDisplayDetails(_lastImageUploadDetails); txtInfo.Text = "Image Uploaded.";
                        }
                        catch (FileNotFoundException exp)
                        {
                            txtInfo.Text = exp.Message;
                        }
                        catch (XmlException exp)
                        {
                            txtInfo.Text = exp.Message;
                        }
                    };
                }
            }
            else
            {

                txtInfo.Text = "Uploading Image...";

                BackgroundWorker bw = new BackgroundWorker();

                // same deal as the code above like this, except this time we're not resizing the image.
                bw.DoWork +=
                    delegate(object sender2, DoWorkEventArgs e2)
                    {
                        _lastImageUploadDetails = uploader.UploadImage(txtFilePath.Text);
                    };

                bw.RunWorkerAsync();

                bw.RunWorkerCompleted += delegate(object sender3, RunWorkerCompletedEventArgs e3)
                {
                    try
                    {
                        if (e3.Error != null)
                        {
                            throw e3.Error;
                        }
                        UpdateLastUploadedImageDisplayDetails(_lastImageUploadDetails); txtInfo.Text = "Image Uploaded.";
                    }
                    catch (FileNotFoundException exp)
                    {
                        txtInfo.Text = exp.Message;
                    }
                    catch (XmlException exp)
                    {
                        txtInfo.Text = exp.Message;
                    }

                };
            }
        }


        private void btnSelectFile_Click(object sender, EventArgs e)
        {
            DialogResult result = imageFileDialog.ShowDialog();
            if (result == DialogResult.OK)
            {
                txtFilePath.Text = imageFileDialog.FileName;
            }
        }


        private void UpdateLastUploadedImageDisplayDetails(UploadedImageDetails details)
        {
            txtImageLink.Text = details.ImageLink;
            txtThumbLink.Text = details.ThumbLink;
            txtAdLink.Text = details.AdLink;
            txtThumbExists.Text = details.ThumbExists.ToString();
            txtTotalRaters.Text = details.TotalRaters.ToString();
            txtAverageRating.Text = details.AverageRating.ToString();
            txtImageLocation.Text = details.ImageLocation;
            txtThumbLocation.Text = details.ThumbLocation;
            txtServer.Text = details.Server;
            txtImageName.Text = details.ImageName;
            txtDonePage.Text = details.DonePage;
            txtResolution.Text = details.Resolution;
            txtFileSize.Text = details.FileSize.ToString();
            txtImageClass.Text = details.ImageClass;
        }


        private void ClearLastUploadedImageDisplayDetails()
        {
            txtImageLink.Text = "";
            txtThumbLink.Text = "";
            txtAdLink.Text = "";
            txtThumbExists.Text = "";
            txtTotalRaters.Text = "";
            txtAverageRating.Text = "";
            txtImageLocation.Text = "";
            txtThumbLocation.Text = "";
            txtServer.Text = "";
            txtImageName.Text = "";
            txtDonePage.Text = "";
            txtResolution.Text = "";
            txtFileSize.Text = "";
            txtImageClass.Text = "";
        }


        private void btnShowImageLink_Click(object sender, EventArgs e)
        {
            // show the image link in web browser.
            try
            {
                Process.Start(_lastImageUploadDetails.ImageLink);
            }
            catch (Exception exp)
            {
                txtInfo.Text = "Unable to open image link.";
            }
        }


        private void btnShowThumbLink_Click(object sender, EventArgs e)
        {
            try
            {
                Process.Start(_lastImageUploadDetails.ThumbLink);
            }
            catch (Exception exp)
            {
                txtInfo.Text = "Unable to open thumb link.";
            }
        }


        private void btnShowAdLink_Click(object sender, EventArgs e)
        {
            try
            {
                Process.Start(_lastImageUploadDetails.AdLink);
            }
            catch (Exception exp)
            {
                txtInfo.Text = "Unable to open ad link.";
            }
        }


        private void btnShowDonePage_Click(object sender, EventArgs e)
        {
            try
            {
                Process.Start(_lastImageUploadDetails.DonePage);
            }
            catch (Exception exp)
            {
                txtInfo.Text = "Unable to open done page.";
            }
        }


        private void chkResize_CheckedChanged(object sender, EventArgs e)
        {
            if (chkResize.Checked)
            {
                txtImageWidth.ReadOnly = false;
                txtImageHeight.ReadOnly = false;
            }
            else
            {
                txtImageWidth.ReadOnly = true;
                txtImageHeight.ReadOnly = true;
            }
        }
    }
}