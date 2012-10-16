namespace Misc
{
    partial class ClientForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtFilePath = new System.Windows.Forms.TextBox();
            this.btnUploadToImageShack = new System.Windows.Forms.Button();
            this.txtInfo = new System.Windows.Forms.TextBox();
            this.imageFolderBrowserDialog = new System.Windows.Forms.FolderBrowserDialog();
            this.btnSelectFile = new System.Windows.Forms.Button();
            this.imageFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.txtImageLink = new System.Windows.Forms.TextBox();
            this.lblImageLink = new System.Windows.Forms.Label();
            this.lblThumbLink = new System.Windows.Forms.Label();
            this.lblAdLink = new System.Windows.Forms.Label();
            this.txtThumbLink = new System.Windows.Forms.TextBox();
            this.txtAdLink = new System.Windows.Forms.TextBox();
            this.txtThumbExists = new System.Windows.Forms.TextBox();
            this.lblThumbExists = new System.Windows.Forms.Label();
            this.txtTotalRaters = new System.Windows.Forms.TextBox();
            this.lblTotalRaters = new System.Windows.Forms.Label();
            this.txtAverageRating = new System.Windows.Forms.TextBox();
            this.lblAverageRating = new System.Windows.Forms.Label();
            this.txtImageLocation = new System.Windows.Forms.TextBox();
            this.lblImageLocation = new System.Windows.Forms.Label();
            this.txtThumbLocation = new System.Windows.Forms.TextBox();
            this.lblThumbLocation = new System.Windows.Forms.Label();
            this.txtServer = new System.Windows.Forms.TextBox();
            this.lblServer = new System.Windows.Forms.Label();
            this.txtImageName = new System.Windows.Forms.TextBox();
            this.lblImageName = new System.Windows.Forms.Label();
            this.txtDonePage = new System.Windows.Forms.TextBox();
            this.lblDonePage = new System.Windows.Forms.Label();
            this.txtResolution = new System.Windows.Forms.TextBox();
            this.lblResolution = new System.Windows.Forms.Label();
            this.txtFileSize = new System.Windows.Forms.TextBox();
            this.lblFileSize = new System.Windows.Forms.Label();
            this.txtImageClass = new System.Windows.Forms.TextBox();
            this.lblImageClass = new System.Windows.Forms.Label();
            this.gbxLastUploadedImage = new System.Windows.Forms.GroupBox();
            this.btnShowDonePage = new System.Windows.Forms.Button();
            this.btnShowAdLink = new System.Windows.Forms.Button();
            this.btnShowThumbLink = new System.Windows.Forms.Button();
            this.btnShowImageLink = new System.Windows.Forms.Button();
            this.txtImageWidth = new System.Windows.Forms.TextBox();
            this.txtImageHeight = new System.Windows.Forms.TextBox();
            this.lblX = new System.Windows.Forms.Label();
            this.lblWidth = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.chkResize = new System.Windows.Forms.CheckBox();
            this.gbxUploadYourImage = new System.Windows.Forms.GroupBox();
            this.gbxLastUploadedImage.SuspendLayout();
            this.gbxUploadYourImage.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtFilePath
            // 
            this.txtFilePath.Location = new System.Drawing.Point(10, 25);
            this.txtFilePath.Name = "txtFilePath";
            this.txtFilePath.Size = new System.Drawing.Size(275, 20);
            this.txtFilePath.TabIndex = 0;
            // 
            // btnUploadToImageShack
            // 
            this.btnUploadToImageShack.Location = new System.Drawing.Point(10, 175);
            this.btnUploadToImageShack.Name = "btnUploadToImageShack";
            this.btnUploadToImageShack.Size = new System.Drawing.Size(353, 178);
            this.btnUploadToImageShack.TabIndex = 1;
            this.btnUploadToImageShack.Text = "Upload to ImageShack!";
            this.btnUploadToImageShack.UseVisualStyleBackColor = true;
            this.btnUploadToImageShack.Click += new System.EventHandler(this.btnUploadToImageShack_Click);
            // 
            // txtInfo
            // 
            this.txtInfo.Location = new System.Drawing.Point(16, 454);
            this.txtInfo.Multiline = true;
            this.txtInfo.Name = "txtInfo";
            this.txtInfo.Size = new System.Drawing.Size(980, 170);
            this.txtInfo.TabIndex = 2;
            // 
            // btnSelectFile
            // 
            this.btnSelectFile.Location = new System.Drawing.Point(288, 23);
            this.btnSelectFile.Name = "btnSelectFile";
            this.btnSelectFile.Size = new System.Drawing.Size(75, 23);
            this.btnSelectFile.TabIndex = 3;
            this.btnSelectFile.Text = "Select File...";
            this.btnSelectFile.UseVisualStyleBackColor = true;
            this.btnSelectFile.Click += new System.EventHandler(this.btnSelectFile_Click);
            // 
            // imageFileDialog
            // 
            this.imageFileDialog.FileName = "openFileDialog1";
            // 
            // txtImageLink
            // 
            this.txtImageLink.Location = new System.Drawing.Point(106, 37);
            this.txtImageLink.Name = "txtImageLink";
            this.txtImageLink.Size = new System.Drawing.Size(400, 20);
            this.txtImageLink.TabIndex = 4;
            // 
            // lblImageLink
            // 
            this.lblImageLink.AutoSize = true;
            this.lblImageLink.Location = new System.Drawing.Point(42, 40);
            this.lblImageLink.Name = "lblImageLink";
            this.lblImageLink.Size = new System.Drawing.Size(62, 13);
            this.lblImageLink.TabIndex = 5;
            this.lblImageLink.Text = "Image Link:";
            // 
            // lblThumbLink
            // 
            this.lblThumbLink.AutoSize = true;
            this.lblThumbLink.Location = new System.Drawing.Point(38, 66);
            this.lblThumbLink.Name = "lblThumbLink";
            this.lblThumbLink.Size = new System.Drawing.Size(66, 13);
            this.lblThumbLink.TabIndex = 6;
            this.lblThumbLink.Text = "Thumb Link:";
            // 
            // lblAdLink
            // 
            this.lblAdLink.AutoSize = true;
            this.lblAdLink.Location = new System.Drawing.Point(58, 92);
            this.lblAdLink.Name = "lblAdLink";
            this.lblAdLink.Size = new System.Drawing.Size(46, 13);
            this.lblAdLink.TabIndex = 7;
            this.lblAdLink.Text = "Ad Link:";
            // 
            // txtThumbLink
            // 
            this.txtThumbLink.Location = new System.Drawing.Point(106, 63);
            this.txtThumbLink.Name = "txtThumbLink";
            this.txtThumbLink.Size = new System.Drawing.Size(400, 20);
            this.txtThumbLink.TabIndex = 8;
            // 
            // txtAdLink
            // 
            this.txtAdLink.Location = new System.Drawing.Point(106, 89);
            this.txtAdLink.Name = "txtAdLink";
            this.txtAdLink.Size = new System.Drawing.Size(400, 20);
            this.txtAdLink.TabIndex = 9;
            // 
            // txtThumbExists
            // 
            this.txtThumbExists.Location = new System.Drawing.Point(106, 115);
            this.txtThumbExists.Name = "txtThumbExists";
            this.txtThumbExists.Size = new System.Drawing.Size(400, 20);
            this.txtThumbExists.TabIndex = 10;
            // 
            // lblThumbExists
            // 
            this.lblThumbExists.AutoSize = true;
            this.lblThumbExists.Location = new System.Drawing.Point(31, 118);
            this.lblThumbExists.Name = "lblThumbExists";
            this.lblThumbExists.Size = new System.Drawing.Size(73, 13);
            this.lblThumbExists.TabIndex = 11;
            this.lblThumbExists.Text = "Thumb Exists:";
            // 
            // txtTotalRaters
            // 
            this.txtTotalRaters.Location = new System.Drawing.Point(106, 141);
            this.txtTotalRaters.Name = "txtTotalRaters";
            this.txtTotalRaters.Size = new System.Drawing.Size(400, 20);
            this.txtTotalRaters.TabIndex = 12;
            // 
            // lblTotalRaters
            // 
            this.lblTotalRaters.AutoSize = true;
            this.lblTotalRaters.Location = new System.Drawing.Point(36, 144);
            this.lblTotalRaters.Name = "lblTotalRaters";
            this.lblTotalRaters.Size = new System.Drawing.Size(68, 13);
            this.lblTotalRaters.TabIndex = 13;
            this.lblTotalRaters.Text = "Total Raters:";
            // 
            // txtAverageRating
            // 
            this.txtAverageRating.Location = new System.Drawing.Point(106, 167);
            this.txtAverageRating.Name = "txtAverageRating";
            this.txtAverageRating.Size = new System.Drawing.Size(400, 20);
            this.txtAverageRating.TabIndex = 14;
            // 
            // lblAverageRating
            // 
            this.lblAverageRating.AutoSize = true;
            this.lblAverageRating.Location = new System.Drawing.Point(20, 170);
            this.lblAverageRating.Name = "lblAverageRating";
            this.lblAverageRating.Size = new System.Drawing.Size(84, 13);
            this.lblAverageRating.TabIndex = 15;
            this.lblAverageRating.Text = "Average Rating:";
            // 
            // txtImageLocation
            // 
            this.txtImageLocation.Location = new System.Drawing.Point(106, 193);
            this.txtImageLocation.Name = "txtImageLocation";
            this.txtImageLocation.Size = new System.Drawing.Size(400, 20);
            this.txtImageLocation.TabIndex = 16;
            // 
            // lblImageLocation
            // 
            this.lblImageLocation.AutoSize = true;
            this.lblImageLocation.Location = new System.Drawing.Point(21, 196);
            this.lblImageLocation.Name = "lblImageLocation";
            this.lblImageLocation.Size = new System.Drawing.Size(83, 13);
            this.lblImageLocation.TabIndex = 17;
            this.lblImageLocation.Text = "Image Location:";
            // 
            // txtThumbLocation
            // 
            this.txtThumbLocation.Location = new System.Drawing.Point(106, 219);
            this.txtThumbLocation.Name = "txtThumbLocation";
            this.txtThumbLocation.Size = new System.Drawing.Size(400, 20);
            this.txtThumbLocation.TabIndex = 18;
            // 
            // lblThumbLocation
            // 
            this.lblThumbLocation.AutoSize = true;
            this.lblThumbLocation.Location = new System.Drawing.Point(17, 222);
            this.lblThumbLocation.Name = "lblThumbLocation";
            this.lblThumbLocation.Size = new System.Drawing.Size(87, 13);
            this.lblThumbLocation.TabIndex = 19;
            this.lblThumbLocation.Text = "Thumb Location:";
            // 
            // txtServer
            // 
            this.txtServer.Location = new System.Drawing.Point(106, 245);
            this.txtServer.Name = "txtServer";
            this.txtServer.Size = new System.Drawing.Size(400, 20);
            this.txtServer.TabIndex = 20;
            // 
            // lblServer
            // 
            this.lblServer.AutoSize = true;
            this.lblServer.Location = new System.Drawing.Point(63, 248);
            this.lblServer.Name = "lblServer";
            this.lblServer.Size = new System.Drawing.Size(41, 13);
            this.lblServer.TabIndex = 21;
            this.lblServer.Text = "Server:";
            // 
            // txtImageName
            // 
            this.txtImageName.Location = new System.Drawing.Point(106, 271);
            this.txtImageName.Name = "txtImageName";
            this.txtImageName.Size = new System.Drawing.Size(400, 20);
            this.txtImageName.TabIndex = 22;
            // 
            // lblImageName
            // 
            this.lblImageName.AutoSize = true;
            this.lblImageName.Location = new System.Drawing.Point(34, 274);
            this.lblImageName.Name = "lblImageName";
            this.lblImageName.Size = new System.Drawing.Size(70, 13);
            this.lblImageName.TabIndex = 23;
            this.lblImageName.Text = "Image Name:";
            // 
            // txtDonePage
            // 
            this.txtDonePage.Location = new System.Drawing.Point(106, 297);
            this.txtDonePage.Name = "txtDonePage";
            this.txtDonePage.Size = new System.Drawing.Size(400, 20);
            this.txtDonePage.TabIndex = 24;
            // 
            // lblDonePage
            // 
            this.lblDonePage.AutoSize = true;
            this.lblDonePage.Location = new System.Drawing.Point(40, 300);
            this.lblDonePage.Name = "lblDonePage";
            this.lblDonePage.Size = new System.Drawing.Size(64, 13);
            this.lblDonePage.TabIndex = 25;
            this.lblDonePage.Text = "Done Page:";
            // 
            // txtResolution
            // 
            this.txtResolution.Location = new System.Drawing.Point(106, 323);
            this.txtResolution.Name = "txtResolution";
            this.txtResolution.Size = new System.Drawing.Size(400, 20);
            this.txtResolution.TabIndex = 26;
            // 
            // lblResolution
            // 
            this.lblResolution.AutoSize = true;
            this.lblResolution.Location = new System.Drawing.Point(44, 326);
            this.lblResolution.Name = "lblResolution";
            this.lblResolution.Size = new System.Drawing.Size(60, 13);
            this.lblResolution.TabIndex = 27;
            this.lblResolution.Text = "Resolution:";
            // 
            // txtFileSize
            // 
            this.txtFileSize.Location = new System.Drawing.Point(106, 349);
            this.txtFileSize.Name = "txtFileSize";
            this.txtFileSize.Size = new System.Drawing.Size(400, 20);
            this.txtFileSize.TabIndex = 28;
            // 
            // lblFileSize
            // 
            this.lblFileSize.AutoSize = true;
            this.lblFileSize.Location = new System.Drawing.Point(55, 352);
            this.lblFileSize.Name = "lblFileSize";
            this.lblFileSize.Size = new System.Drawing.Size(49, 13);
            this.lblFileSize.TabIndex = 29;
            this.lblFileSize.Text = "File Size:";
            // 
            // txtImageClass
            // 
            this.txtImageClass.Location = new System.Drawing.Point(106, 375);
            this.txtImageClass.Name = "txtImageClass";
            this.txtImageClass.Size = new System.Drawing.Size(400, 20);
            this.txtImageClass.TabIndex = 30;
            // 
            // lblImageClass
            // 
            this.lblImageClass.AutoSize = true;
            this.lblImageClass.Location = new System.Drawing.Point(37, 378);
            this.lblImageClass.Name = "lblImageClass";
            this.lblImageClass.Size = new System.Drawing.Size(67, 13);
            this.lblImageClass.TabIndex = 31;
            this.lblImageClass.Text = "Image Class:";
            // 
            // gbxLastUploadedImage
            // 
            this.gbxLastUploadedImage.Controls.Add(this.btnShowDonePage);
            this.gbxLastUploadedImage.Controls.Add(this.btnShowAdLink);
            this.gbxLastUploadedImage.Controls.Add(this.btnShowThumbLink);
            this.gbxLastUploadedImage.Controls.Add(this.btnShowImageLink);
            this.gbxLastUploadedImage.Controls.Add(this.lblImageClass);
            this.gbxLastUploadedImage.Controls.Add(this.txtImageClass);
            this.gbxLastUploadedImage.Controls.Add(this.lblFileSize);
            this.gbxLastUploadedImage.Controls.Add(this.txtFileSize);
            this.gbxLastUploadedImage.Controls.Add(this.lblResolution);
            this.gbxLastUploadedImage.Controls.Add(this.txtResolution);
            this.gbxLastUploadedImage.Controls.Add(this.lblDonePage);
            this.gbxLastUploadedImage.Controls.Add(this.txtDonePage);
            this.gbxLastUploadedImage.Controls.Add(this.lblImageName);
            this.gbxLastUploadedImage.Controls.Add(this.txtImageName);
            this.gbxLastUploadedImage.Controls.Add(this.lblServer);
            this.gbxLastUploadedImage.Controls.Add(this.txtServer);
            this.gbxLastUploadedImage.Controls.Add(this.lblThumbLocation);
            this.gbxLastUploadedImage.Controls.Add(this.txtThumbLocation);
            this.gbxLastUploadedImage.Controls.Add(this.lblImageLocation);
            this.gbxLastUploadedImage.Controls.Add(this.txtImageLocation);
            this.gbxLastUploadedImage.Controls.Add(this.lblAverageRating);
            this.gbxLastUploadedImage.Controls.Add(this.txtAverageRating);
            this.gbxLastUploadedImage.Controls.Add(this.lblTotalRaters);
            this.gbxLastUploadedImage.Controls.Add(this.txtTotalRaters);
            this.gbxLastUploadedImage.Controls.Add(this.lblThumbExists);
            this.gbxLastUploadedImage.Controls.Add(this.txtThumbExists);
            this.gbxLastUploadedImage.Controls.Add(this.txtAdLink);
            this.gbxLastUploadedImage.Controls.Add(this.txtThumbLink);
            this.gbxLastUploadedImage.Controls.Add(this.lblAdLink);
            this.gbxLastUploadedImage.Controls.Add(this.lblThumbLink);
            this.gbxLastUploadedImage.Controls.Add(this.lblImageLink);
            this.gbxLastUploadedImage.Controls.Add(this.txtImageLink);
            this.gbxLastUploadedImage.Location = new System.Drawing.Point(397, 12);
            this.gbxLastUploadedImage.Name = "gbxLastUploadedImage";
            this.gbxLastUploadedImage.Size = new System.Drawing.Size(599, 415);
            this.gbxLastUploadedImage.TabIndex = 32;
            this.gbxLastUploadedImage.TabStop = false;
            this.gbxLastUploadedImage.Text = "Last Uploaded Image Details";
            // 
            // btnShowDonePage
            // 
            this.btnShowDonePage.Location = new System.Drawing.Point(512, 294);
            this.btnShowDonePage.Name = "btnShowDonePage";
            this.btnShowDonePage.Size = new System.Drawing.Size(75, 23);
            this.btnShowDonePage.TabIndex = 35;
            this.btnShowDonePage.Text = "Show";
            this.btnShowDonePage.UseVisualStyleBackColor = true;
            this.btnShowDonePage.Click += new System.EventHandler(this.btnShowDonePage_Click);
            // 
            // btnShowAdLink
            // 
            this.btnShowAdLink.Location = new System.Drawing.Point(512, 87);
            this.btnShowAdLink.Name = "btnShowAdLink";
            this.btnShowAdLink.Size = new System.Drawing.Size(75, 23);
            this.btnShowAdLink.TabIndex = 34;
            this.btnShowAdLink.Text = "Show";
            this.btnShowAdLink.UseVisualStyleBackColor = true;
            this.btnShowAdLink.Click += new System.EventHandler(this.btnShowAdLink_Click);
            // 
            // btnShowThumbLink
            // 
            this.btnShowThumbLink.Location = new System.Drawing.Point(512, 60);
            this.btnShowThumbLink.Name = "btnShowThumbLink";
            this.btnShowThumbLink.Size = new System.Drawing.Size(75, 23);
            this.btnShowThumbLink.TabIndex = 33;
            this.btnShowThumbLink.Text = "Show";
            this.btnShowThumbLink.UseVisualStyleBackColor = true;
            this.btnShowThumbLink.Click += new System.EventHandler(this.btnShowThumbLink_Click);
            // 
            // btnShowImageLink
            // 
            this.btnShowImageLink.Location = new System.Drawing.Point(513, 34);
            this.btnShowImageLink.Name = "btnShowImageLink";
            this.btnShowImageLink.Size = new System.Drawing.Size(75, 23);
            this.btnShowImageLink.TabIndex = 32;
            this.btnShowImageLink.Text = "Show";
            this.btnShowImageLink.UseVisualStyleBackColor = true;
            this.btnShowImageLink.Click += new System.EventHandler(this.btnShowImageLink_Click);
            // 
            // txtImageWidth
            // 
            this.txtImageWidth.Location = new System.Drawing.Point(12, 69);
            this.txtImageWidth.Name = "txtImageWidth";
            this.txtImageWidth.ReadOnly = true;
            this.txtImageWidth.Size = new System.Drawing.Size(124, 20);
            this.txtImageWidth.TabIndex = 33;
            // 
            // txtImageHeight
            // 
            this.txtImageHeight.Location = new System.Drawing.Point(161, 69);
            this.txtImageHeight.Name = "txtImageHeight";
            this.txtImageHeight.ReadOnly = true;
            this.txtImageHeight.Size = new System.Drawing.Size(124, 20);
            this.txtImageHeight.TabIndex = 34;
            // 
            // lblX
            // 
            this.lblX.AutoSize = true;
            this.lblX.Location = new System.Drawing.Point(142, 75);
            this.lblX.Name = "lblX";
            this.lblX.Size = new System.Drawing.Size(12, 13);
            this.lblX.TabIndex = 35;
            this.lblX.Text = "x";
            // 
            // lblWidth
            // 
            this.lblWidth.AutoSize = true;
            this.lblWidth.Location = new System.Drawing.Point(12, 54);
            this.lblWidth.Name = "lblWidth";
            this.lblWidth.Size = new System.Drawing.Size(58, 13);
            this.lblWidth.TabIndex = 36;
            this.lblWidth.Text = "Width (px):";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(164, 53);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 13);
            this.label1.TabIndex = 37;
            this.label1.Text = "Height (px):";
            // 
            // chkResize
            // 
            this.chkResize.AutoSize = true;
            this.chkResize.Location = new System.Drawing.Point(294, 69);
            this.chkResize.Name = "chkResize";
            this.chkResize.Size = new System.Drawing.Size(58, 17);
            this.chkResize.TabIndex = 38;
            this.chkResize.Text = "Resize";
            this.chkResize.UseVisualStyleBackColor = true;
            this.chkResize.CheckedChanged += new System.EventHandler(this.chkResize_CheckedChanged);
            // 
            // gbxUploadYourImage
            // 
            this.gbxUploadYourImage.Controls.Add(this.chkResize);
            this.gbxUploadYourImage.Controls.Add(this.label1);
            this.gbxUploadYourImage.Controls.Add(this.lblWidth);
            this.gbxUploadYourImage.Controls.Add(this.lblX);
            this.gbxUploadYourImage.Controls.Add(this.txtImageHeight);
            this.gbxUploadYourImage.Controls.Add(this.txtImageWidth);
            this.gbxUploadYourImage.Controls.Add(this.btnSelectFile);
            this.gbxUploadYourImage.Controls.Add(this.btnUploadToImageShack);
            this.gbxUploadYourImage.Controls.Add(this.txtFilePath);
            this.gbxUploadYourImage.Location = new System.Drawing.Point(10, 12);
            this.gbxUploadYourImage.Name = "gbxUploadYourImage";
            this.gbxUploadYourImage.Size = new System.Drawing.Size(377, 414);
            this.gbxUploadYourImage.TabIndex = 42;
            this.gbxUploadYourImage.TabStop = false;
            this.gbxUploadYourImage.Text = "Upload Your Image";
            // 
            // ClientForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1009, 640);
            this.Controls.Add(this.gbxUploadYourImage);
            this.Controls.Add(this.gbxLastUploadedImage);
            this.Controls.Add(this.txtInfo);
            this.Name = "ClientForm";
            this.Text = "ImageShack API Wrapper Client";
            this.gbxLastUploadedImage.ResumeLayout(false);
            this.gbxLastUploadedImage.PerformLayout();
            this.gbxUploadYourImage.ResumeLayout(false);
            this.gbxUploadYourImage.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtFilePath;
        private System.Windows.Forms.Button btnUploadToImageShack;
        private System.Windows.Forms.TextBox txtInfo;
        private System.Windows.Forms.FolderBrowserDialog imageFolderBrowserDialog;
        private System.Windows.Forms.Button btnSelectFile;
        private System.Windows.Forms.OpenFileDialog imageFileDialog;
        private System.Windows.Forms.TextBox txtImageLink;
        private System.Windows.Forms.Label lblImageLink;
        private System.Windows.Forms.Label lblThumbLink;
        private System.Windows.Forms.Label lblAdLink;
        private System.Windows.Forms.TextBox txtThumbLink;
        private System.Windows.Forms.TextBox txtAdLink;
        private System.Windows.Forms.TextBox txtThumbExists;
        private System.Windows.Forms.Label lblThumbExists;
        private System.Windows.Forms.TextBox txtTotalRaters;
        private System.Windows.Forms.Label lblTotalRaters;
        private System.Windows.Forms.TextBox txtAverageRating;
        private System.Windows.Forms.Label lblAverageRating;
        private System.Windows.Forms.TextBox txtImageLocation;
        private System.Windows.Forms.Label lblImageLocation;
        private System.Windows.Forms.TextBox txtThumbLocation;
        private System.Windows.Forms.Label lblThumbLocation;
        private System.Windows.Forms.TextBox txtServer;
        private System.Windows.Forms.Label lblServer;
        private System.Windows.Forms.TextBox txtImageName;
        private System.Windows.Forms.Label lblImageName;
        private System.Windows.Forms.TextBox txtDonePage;
        private System.Windows.Forms.Label lblDonePage;
        private System.Windows.Forms.TextBox txtResolution;
        private System.Windows.Forms.Label lblResolution;
        private System.Windows.Forms.TextBox txtFileSize;
        private System.Windows.Forms.Label lblFileSize;
        private System.Windows.Forms.TextBox txtImageClass;
        private System.Windows.Forms.Label lblImageClass;
        private System.Windows.Forms.GroupBox gbxLastUploadedImage;
        private System.Windows.Forms.Button btnShowImageLink;
        private System.Windows.Forms.Button btnShowDonePage;
        private System.Windows.Forms.Button btnShowAdLink;
        private System.Windows.Forms.Button btnShowThumbLink;
        private System.Windows.Forms.TextBox txtImageWidth;
        private System.Windows.Forms.TextBox txtImageHeight;
        private System.Windows.Forms.Label lblX;
        private System.Windows.Forms.Label lblWidth;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox chkResize;
        private System.Windows.Forms.GroupBox gbxUploadYourImage;

    }
}

