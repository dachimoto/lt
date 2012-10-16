
import System.Drawing
import System.Windows.Forms

from System.Drawing import *
from System.Windows.Forms import *

class frmLogin(Form):
	def __init__(self):
		self.InitializeComponent()
	
	def InitializeComponent(self):
		resources = System.Resources.ResourceManager("HRM.frmLogin", System.Reflection.Assembly.GetEntryAssembly())
		self._txtPassword = System.Windows.Forms.TextBox()
		self._groupBox1 = System.Windows.Forms.GroupBox()
		self._txtUserName = System.Windows.Forms.TextBox()
		self._PasswordLabel = System.Windows.Forms.Label()
		self._UserNameLabel = System.Windows.Forms.Label()
		self._btnOK = System.Windows.Forms.Button()
		self._btnCancel = System.Windows.Forms.Button()
		self._pictureBox1 = System.Windows.Forms.PictureBox()
		self._groupBox1.SuspendLayout()
		self._pictureBox1.BeginInit()
		self.SuspendLayout()
		# 
		# txtPassword
		# 
		self._txtPassword.Location = System.Drawing.Point(99, 45)
		self._txtPassword.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtPassword.MaxLength = 50
		self._txtPassword.Name = "txtPassword"
		self._txtPassword.PasswordChar = "*"
		self._txtPassword.Size = System.Drawing.Size(170, 20)
		self._txtPassword.TabIndex = 1
		# 
		# groupBox1
		# 
		self._groupBox1.Controls.Add(self._txtPassword)
		self._groupBox1.Controls.Add(self._txtUserName)
		self._groupBox1.Controls.Add(self._PasswordLabel)
		self._groupBox1.Controls.Add(self._UserNameLabel)
		self._groupBox1.Location = System.Drawing.Point(69, 5)
		self._groupBox1.Name = "groupBox1"
		self._groupBox1.Size = System.Drawing.Size(281, 83)
		self._groupBox1.TabIndex = 7
		self._groupBox1.TabStop = False
		# 
		# txtUserName
		# 
		self._txtUserName.Location = System.Drawing.Point(99, 19)
		self._txtUserName.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtUserName.MaxLength = 50
		self._txtUserName.Name = "txtUserName"
		self._txtUserName.Size = System.Drawing.Size(170, 20)
		self._txtUserName.TabIndex = 0
		# 
		# PasswordLabel
		# 
		self._PasswordLabel.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._PasswordLabel.Location = System.Drawing.Point(10, 48)
		self._PasswordLabel.Margin = System.Windows.Forms.Padding(3, 3, 1, 3)
		self._PasswordLabel.Name = "PasswordLabel"
		self._PasswordLabel.Size = System.Drawing.Size(80, 14)
		self._PasswordLabel.TabIndex = 29
		self._PasswordLabel.Text = "&Password:"
		# 
		# UserNameLabel
		# 
		self._UserNameLabel.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._UserNameLabel.Location = System.Drawing.Point(10, 21)
		self._UserNameLabel.Margin = System.Windows.Forms.Padding(3, 2, 1, 3)
		self._UserNameLabel.Name = "UserNameLabel"
		self._UserNameLabel.Size = System.Drawing.Size(80, 17)
		self._UserNameLabel.TabIndex = 27
		self._UserNameLabel.Text = "&User name:"
		# 
		# btnOK
		# 
		self._btnOK.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._btnOK.Location = System.Drawing.Point(192, 94)
		self._btnOK.Name = "btnOK"
		self._btnOK.Size = System.Drawing.Size(76, 23)
		self._btnOK.TabIndex = 8
		self._btnOK.Text = "OK"
		# 
		# btnCancel
		# 
		self._btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel
		self._btnCancel.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._btnCancel.Location = System.Drawing.Point(275, 94)
		self._btnCancel.Name = "btnCancel"
		self._btnCancel.Size = System.Drawing.Size(75, 23)
		self._btnCancel.TabIndex = 10
		self._btnCancel.Text = "Cancel"
		self._btnCancel.Click += self.BtnCancelClick
		# 
		# pictureBox1
		# 
		self._pictureBox1.ErrorImage = resources.GetObject("pictureBox1.ErrorImage")
		self._pictureBox1.Image = resources.GetObject("pictureBox1.Image")
		self._pictureBox1.Location = System.Drawing.Point(5, 12)
		self._pictureBox1.Name = "pictureBox1"
		self._pictureBox1.Size = System.Drawing.Size(58, 55)
		self._pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
		self._pictureBox1.TabIndex = 9
		self._pictureBox1.TabStop = False
		# 
		# frmLogin
		# 
		self.ClientSize = System.Drawing.Size(355, 122)
		self.Controls.Add(self._groupBox1)
		self.Controls.Add(self._btnOK)
		self.Controls.Add(self._btnCancel)
		self.Controls.Add(self._pictureBox1)
		self.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
		self.KeyPreview = True
		self.MaximizeBox = False
		self.MinimizeBox = False
		self.Name = "frmLogin"
		self.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		self.Text = "Check login information"
		self._groupBox1.ResumeLayout(False)
		self._groupBox1.PerformLayout()
		self._pictureBox1.EndInit()
		self.ResumeLayout(False)


	def BtnCancelClick(self, sender, e):
		self.Close()

