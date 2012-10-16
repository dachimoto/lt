
import System.Drawing
import System.Windows.Forms

from System.Drawing import *
from System.Windows.Forms import *

class frmSplash(Form):	
	def __init__(self):
		self.InitializeComponent()
	
	def InitializeComponent(self):
		self._components = System.ComponentModel.Container()
		resources = System.Resources.ResourceManager("HRM.frmSplash", System.Reflection.Assembly.GetEntryAssembly())
		self._lklClose = System.Windows.Forms.LinkLabel()
		self._label2 = System.Windows.Forms.Label()
		self._label1 = System.Windows.Forms.Label()
		self._lklWebsite = System.Windows.Forms.LinkLabel()
		self._pictureBox1 = System.Windows.Forms.PictureBox()
		self._timer1 = System.Windows.Forms.Timer(self._components)
		self._pictureBox3 = System.Windows.Forms.PictureBox()
		self._pictureBox1.BeginInit()
		self._pictureBox3.BeginInit()
		self.SuspendLayout()
		# 
		# lklClose
		# 
		self._lklClose.AutoSize = True
		self._lklClose.BackColor = System.Drawing.SystemColors.Window
		self._lklClose.Location = System.Drawing.Point(460, 287)
		self._lklClose.Name = "lklClose"
		self._lklClose.Size = System.Drawing.Size(33, 13)
		self._lklClose.TabIndex = 13
		self._lklClose.TabStop = True
		self._lklClose.Text = "Close"
		self._lklClose.LinkClicked += self.LklCloseLinkClicked
		# 
		# label2
		# 
		self._label2.AutoSize = True
		self._label2.BackColor = System.Drawing.SystemColors.Window
		self._label2.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._label2.Location = System.Drawing.Point(11, 287)
		self._label2.Name = "label2"
		self._label2.Size = System.Drawing.Size(393, 13)
		self._label2.TabIndex = 12
		self._label2.Text = "Copyright © 2010 Coremetrics, an IBM Company. All rights reserved."
		# 
		# label1
		# 
		self._label1.AutoSize = True
		self._label1.BackColor = System.Drawing.SystemColors.Window
		self._label1.Font = System.Drawing.Font("Microsoft Sans Serif", 14.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._label1.Location = System.Drawing.Point(156, 8)
		self._label1.Name = "label1"
		self._label1.Size = System.Drawing.Size(303, 24)
		self._label1.TabIndex = 11
		self._label1.Text = "Coremetrics Usage Report Tool"
		# 
		# lklWebsite
		# 
		self._lklWebsite.AutoSize = True
		self._lklWebsite.BackColor = System.Drawing.SystemColors.Window
		self._lklWebsite.Location = System.Drawing.Point(157, 33)
		self._lklWebsite.Name = "lklWebsite"
		self._lklWebsite.Size = System.Drawing.Size(111, 13)
		self._lklWebsite.TabIndex = 10
		self._lklWebsite.TabStop = True
		self._lklWebsite.Text = "www.coremetrics.com"
		self._lklWebsite.LinkClicked += self.LklWebsiteLinkClicked
		# 
		# pictureBox1
		# 
		self._pictureBox1.BackColor = System.Drawing.SystemColors.Window
		self._pictureBox1.Image = resources.GetObject("pictureBox1.Image")
		self._pictureBox1.Location = System.Drawing.Point(0, 1)
		self._pictureBox1.Name = "pictureBox1"
		self._pictureBox1.Size = System.Drawing.Size(504, 313)
		self._pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
		self._pictureBox1.TabIndex = 8
		self._pictureBox1.TabStop = False
		self._pictureBox1.Click += self.PictureBox1Click
		# 
		# timer1
		# 
		self._timer1.Enabled = True
		self._timer1.Interval = 1000
		self._timer1.Tick += self.Timer1Tick
		# 
		# pictureBox3
		# 
		self._pictureBox3.BackColor = System.Drawing.SystemColors.Window
		self._pictureBox3.Cursor = System.Windows.Forms.Cursors.Hand
		self._pictureBox3.Image = resources.GetObject("pictureBox3.Image")
		self._pictureBox3.ImageLocation = ""
		self._pictureBox3.Location = System.Drawing.Point(0, 1)
		self._pictureBox3.Name = "pictureBox3"
		self._pictureBox3.Size = System.Drawing.Size(150, 69)
		self._pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
		self._pictureBox3.TabIndex = 9
		self._pictureBox3.TabStop = False
		self._pictureBox3.Click += self.PictureBox3Click
		# 
		# frmSplash
		# 
		self.ClientSize = System.Drawing.Size(505, 314)
		self.Controls.Add(self._pictureBox3)
		self.Controls.Add(self._lklClose)
		self.Controls.Add(self._label2)
		self.Controls.Add(self._label1)
		self.Controls.Add(self._lklWebsite)
		self.Controls.Add(self._pictureBox1)
		self.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
		self.Name = "frmSplash"
		self.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		self.Text = "frmSplash"
		self._pictureBox1.EndInit()
		self._pictureBox3.EndInit()
		self.ResumeLayout(False)
		self.PerformLayout()


	def LklCloseLinkClicked(self, sender, e):
		self.Close()

	def LklWebsiteLinkClicked(self, sender, e):
		Process.Start(lklWebsite.Text, "open");

	def PictureBox1Click(self, sender, e):
		self.Close()

	def PictureBox3Click(self, sender, e):
		Process.Start("www.coremetrics.com", "open");

	def Timer1Tick(self, sender, e):
		self.Close()
	
	def HideLinks(self):
		self._lklClose.Visible = False
		self._lklWebsite.Visible = False