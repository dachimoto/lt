
import System.Drawing
import System.Windows.Forms

from System.Drawing import *
from System.Windows.Forms import *

class frmEditAccountList(Form):
	def __init__(self):
		self._TabPag = None
		self._TabCtrl = None
		self.InitializeComponent()
	
	def InitializeComponent(self):
		dataGridViewCellStyle11 = System.Windows.Forms.DataGridViewCellStyle()
		dataGridViewCellStyle12 = System.Windows.Forms.DataGridViewCellStyle()
		dataGridViewCellStyle13 = System.Windows.Forms.DataGridViewCellStyle()
		self._lblTotalMapped = System.Windows.Forms.Label()
		self._chkAccountNotMapped = System.Windows.Forms.CheckBox()
		self._groupBox2 = System.Windows.Forms.GroupBox()
		self._btnRemove = System.Windows.Forms.Button()
		self._btnMultipleAssociate = System.Windows.Forms.Button()
		self._btnMap = System.Windows.Forms.Button()
		self._txtZuoraAccountNo = System.Windows.Forms.TextBox()
		self._label5 = System.Windows.Forms.Label()
		self._btnZuoraAccount = System.Windows.Forms.Button()
		self._lblSelectedAccounts = System.Windows.Forms.Label()
		self._label1 = System.Windows.Forms.Label()
		self._cmbClientSiteStatus = System.Windows.Forms.ComboBox()
		self._dtgrd = System.Windows.Forms.DataGridView()
		self._btnZAccountNotMapped = System.Windows.Forms.Button()
		self._label10 = System.Windows.Forms.Label()
		self._label2 = System.Windows.Forms.Label()
		self._txtClientSiteName = System.Windows.Forms.TextBox()
		self._cmbPageSize = System.Windows.Forms.ComboBox()
		self._label7 = System.Windows.Forms.Label()
		self._lblPage = System.Windows.Forms.Label()
		self._btnNext = System.Windows.Forms.Button()
		self._btnLast = System.Windows.Forms.Button()
		self._lblTotalNotMapped = System.Windows.Forms.Label()
		self._btnPrevious = System.Windows.Forms.Button()
		self._groupBox1 = System.Windows.Forms.GroupBox()
		self._btnFirst = System.Windows.Forms.Button()
		self._btnSearch = System.Windows.Forms.Button()
		self._label6 = System.Windows.Forms.Label()
		self._label4 = System.Windows.Forms.Label()
		self._label3 = System.Windows.Forms.Label()
		self._txtClientSiteID = System.Windows.Forms.TextBox()
		self._txtAccountNo = System.Windows.Forms.TextBox()
		self._txtZuoraName = System.Windows.Forms.TextBox()
		self._groupBox2.SuspendLayout()
		self._dtgrd.BeginInit()
		self._groupBox1.SuspendLayout()
		self.SuspendLayout()
		# 
		# lblTotalMapped
		# 
		self._lblTotalMapped.AutoSize = True
		self._lblTotalMapped.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._lblTotalMapped.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._lblTotalMapped.Location = System.Drawing.Point(405, 96)
		self._lblTotalMapped.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._lblTotalMapped.Name = "lblTotalMapped"
		self._lblTotalMapped.Size = System.Drawing.Size(142, 13)
		self._lblTotalMapped.TabIndex = 97
		self._lblTotalMapped.Text = "Total Accounts Mapped"
		# 
		# chkAccountNotMapped
		# 
		self._chkAccountNotMapped.AutoSize = True
		self._chkAccountNotMapped.Location = System.Drawing.Point(690, 66)
		self._chkAccountNotMapped.Name = "chkAccountNotMapped"
		self._chkAccountNotMapped.Size = System.Drawing.Size(163, 17)
		self._chkAccountNotMapped.TabIndex = 96
		self._chkAccountNotMapped.Text = "Show Accounts Not Mapped"
		self._chkAccountNotMapped.UseVisualStyleBackColor = True
		# 
		# groupBox2
		# 
		self._groupBox2.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right
		self._groupBox2.Controls.Add(self._btnRemove)
		self._groupBox2.Controls.Add(self._btnMultipleAssociate)
		self._groupBox2.Controls.Add(self._btnMap)
		self._groupBox2.Controls.Add(self._txtZuoraAccountNo)
		self._groupBox2.Controls.Add(self._label5)
		self._groupBox2.Controls.Add(self._btnZuoraAccount)
		self._groupBox2.Location = System.Drawing.Point(0, 480)
		self._groupBox2.Name = "groupBox2"
		self._groupBox2.Size = System.Drawing.Size(1116, 63)
		self._groupBox2.TabIndex = 95
		self._groupBox2.TabStop = False
		self._groupBox2.Text = "Select Zuora Account No. below to do the mapping"
		# 
		# btnRemove
		# 
		self._btnRemove.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left
		self._btnRemove.Enabled = False
		self._btnRemove.Location = System.Drawing.Point(670, 29)
		self._btnRemove.Name = "btnRemove"
		self._btnRemove.Size = System.Drawing.Size(95, 22)
		self._btnRemove.TabIndex = 94
		self._btnRemove.Text = "Remove..."
		self._btnRemove.UseVisualStyleBackColor = True
		# 
		# btnMultipleAssociate
		# 
		self._btnMultipleAssociate.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left
		self._btnMultipleAssociate.Enabled = False
		self._btnMultipleAssociate.Location = System.Drawing.Point(473, 29)
		self._btnMultipleAssociate.Name = "btnMultipleAssociate"
		self._btnMultipleAssociate.Size = System.Drawing.Size(191, 22)
		self._btnMultipleAssociate.TabIndex = 93
		self._btnMultipleAssociate.Text = "Multiple Account Associate..."
		self._btnMultipleAssociate.UseVisualStyleBackColor = True
		# 
		# btnMap
		# 
		self._btnMap.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left
		self._btnMap.Enabled = False
		self._btnMap.Location = System.Drawing.Point(330, 30)
		self._btnMap.Name = "btnMap"
		self._btnMap.Size = System.Drawing.Size(137, 22)
		self._btnMap.TabIndex = 92
		self._btnMap.Text = "Associate Account..."
		self._btnMap.UseVisualStyleBackColor = True
		# 
		# txtZuoraAccountNo
		# 
		self._txtZuoraAccountNo.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left
		self._txtZuoraAccountNo.Location = System.Drawing.Point(126, 31)
		self._txtZuoraAccountNo.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtZuoraAccountNo.MaxLength = 20
		self._txtZuoraAccountNo.Name = "txtZuoraAccountNo"
		self._txtZuoraAccountNo.Size = System.Drawing.Size(161, 20)
		self._txtZuoraAccountNo.TabIndex = 91
		# 
		# label5
		# 
		self._label5.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left
		self._label5.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label5.Location = System.Drawing.Point(9, 35)
		self._label5.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label5.Name = "label5"
		self._label5.Size = System.Drawing.Size(115, 17)
		self._label5.TabIndex = 90
		self._label5.Text = "Zuora Account No. (*)"
		# 
		# btnZuoraAccount
		# 
		self._btnZuoraAccount.Anchor = System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left
		self._btnZuoraAccount.Location = System.Drawing.Point(293, 30)
		self._btnZuoraAccount.Name = "btnZuoraAccount"
		self._btnZuoraAccount.Size = System.Drawing.Size(31, 23)
		self._btnZuoraAccount.TabIndex = 89
		self._btnZuoraAccount.Text = "..."
		self._btnZuoraAccount.UseVisualStyleBackColor = True
		# 
		# lblSelectedAccounts
		# 
		self._lblSelectedAccounts.AutoSize = True
		self._lblSelectedAccounts.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._lblSelectedAccounts.Location = System.Drawing.Point(687, 41)
		self._lblSelectedAccounts.Name = "lblSelectedAccounts"
		self._lblSelectedAccounts.Size = System.Drawing.Size(141, 13)
		self._lblSelectedAccounts.TabIndex = 95
		self._lblSelectedAccounts.Text = "Selected accounts: 0/0"
		# 
		# label1
		# 
		self._label1.AutoSize = True
		self._label1.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._label1.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label1.Location = System.Drawing.Point(0, 96)
		self._label1.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label1.Name = "label1"
		self._label1.Size = System.Drawing.Size(360, 13)
		self._label1.TabIndex = 94
		self._label1.Text = "To export all accounts to Excel, please change Page size to 0"
		# 
		# cmbClientSiteStatus
		# 
		self._cmbClientSiteStatus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
		self._cmbClientSiteStatus.FormattingEnabled = True
		self._cmbClientSiteStatus.Items.AddRange(System.Array[System.Object](
			["Inactive",
			"Active",
			"All Statuses"]))
		self._cmbClientSiteStatus.Location = System.Drawing.Point(791, 12)
		self._cmbClientSiteStatus.Name = "cmbClientSiteStatus"
		self._cmbClientSiteStatus.Size = System.Drawing.Size(245, 21)
		self._cmbClientSiteStatus.TabIndex = 94
		# 
		# dtgrd
		# 
		self._dtgrd.AllowUserToAddRows = False
		self._dtgrd.AllowUserToDeleteRows = False
		self._dtgrd.Anchor = System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right
		dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
		dataGridViewCellStyle11.BackColor = System.Drawing.SystemColors.Control
		dataGridViewCellStyle11.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0)
		dataGridViewCellStyle11.ForeColor = System.Drawing.SystemColors.WindowText
		dataGridViewCellStyle11.SelectionBackColor = System.Drawing.Color.LemonChiffon
		dataGridViewCellStyle11.SelectionForeColor = System.Drawing.Color.Red
		dataGridViewCellStyle11.WrapMode = System.Windows.Forms.DataGridViewTriState.True
		self._dtgrd.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle11
		self._dtgrd.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
		dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
		dataGridViewCellStyle12.BackColor = System.Drawing.SystemColors.Window
		dataGridViewCellStyle12.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0)
		dataGridViewCellStyle12.ForeColor = System.Drawing.Color.FromArgb(0, 0, 0)
		dataGridViewCellStyle12.SelectionBackColor = System.Drawing.Color.LemonChiffon
		dataGridViewCellStyle12.SelectionForeColor = System.Drawing.Color.Red
		dataGridViewCellStyle12.WrapMode = System.Windows.Forms.DataGridViewTriState.False
		self._dtgrd.DefaultCellStyle = dataGridViewCellStyle12
		self._dtgrd.Location = System.Drawing.Point(3, 113)
		self._dtgrd.MultiSelect = False
		self._dtgrd.Name = "dtgrd"
		self._dtgrd.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing
		dataGridViewCellStyle13.SelectionBackColor = System.Drawing.Color.LemonChiffon
		dataGridViewCellStyle13.SelectionForeColor = System.Drawing.Color.Red
		self._dtgrd.RowsDefaultCellStyle = dataGridViewCellStyle13
		self._dtgrd.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
		self._dtgrd.Size = System.Drawing.Size(1113, 361)
		self._dtgrd.TabIndex = 96
		# 
		# btnZAccountNotMapped
		# 
		self._btnZAccountNotMapped.Location = System.Drawing.Point(859, 65)
		self._btnZAccountNotMapped.Name = "btnZAccountNotMapped"
		self._btnZAccountNotMapped.Size = System.Drawing.Size(177, 21)
		self._btnZAccountNotMapped.TabIndex = 97
		self._btnZAccountNotMapped.Text = "Zuora Account not mapped..."
		self._btnZAccountNotMapped.UseVisualStyleBackColor = True
		# 
		# label10
		# 
		self._label10.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label10.Location = System.Drawing.Point(687, 15)
		self._label10.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label10.Name = "label10"
		self._label10.Size = System.Drawing.Size(93, 17)
		self._label10.TabIndex = 93
		self._label10.Text = "Client Site Status"
		# 
		# label2
		# 
		self._label2.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label2.Location = System.Drawing.Point(9, 41)
		self._label2.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label2.Name = "label2"
		self._label2.Size = System.Drawing.Size(86, 17)
		self._label2.TabIndex = 88
		self._label2.Text = "Client Site Name"
		# 
		# txtClientSiteName
		# 
		self._txtClientSiteName.Location = System.Drawing.Point(113, 37)
		self._txtClientSiteName.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtClientSiteName.MaxLength = 20
		self._txtClientSiteName.Name = "txtClientSiteName"
		self._txtClientSiteName.Size = System.Drawing.Size(295, 20)
		self._txtClientSiteName.TabIndex = 87
		# 
		# cmbPageSize
		# 
		self._cmbPageSize.FormattingEnabled = True
		self._cmbPageSize.Items.AddRange(System.Array[System.Object](
			["20",
			"30",
			"40",
			"50",
			"100"]))
		self._cmbPageSize.Location = System.Drawing.Point(483, 66)
		self._cmbPageSize.Name = "cmbPageSize"
		self._cmbPageSize.Size = System.Drawing.Size(115, 21)
		self._cmbPageSize.TabIndex = 86
		self._cmbPageSize.Text = "0"
		# 
		# label7
		# 
		self._label7.AutoSize = True
		self._label7.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label7.Location = System.Drawing.Point(414, 69)
		self._label7.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label7.Name = "label7"
		self._label7.Size = System.Drawing.Size(53, 13)
		self._label7.TabIndex = 85
		self._label7.Text = "Page size"
		# 
		# lblPage
		# 
		self._lblPage.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._lblPage.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._lblPage.Location = System.Drawing.Point(9, 69)
		self._lblPage.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._lblPage.Name = "lblPage"
		self._lblPage.Size = System.Drawing.Size(102, 17)
		self._lblPage.TabIndex = 84
		self._lblPage.Text = "Page #"
		# 
		# btnNext
		# 
		self._btnNext.Location = System.Drawing.Point(259, 65)
		self._btnNext.Name = "btnNext"
		self._btnNext.Size = System.Drawing.Size(60, 21)
		self._btnNext.TabIndex = 82
		self._btnNext.Text = "Next >"
		self._btnNext.UseVisualStyleBackColor = True
		# 
		# btnLast
		# 
		self._btnLast.Location = System.Drawing.Point(322, 65)
		self._btnLast.Name = "btnLast"
		self._btnLast.Size = System.Drawing.Size(50, 21)
		self._btnLast.TabIndex = 83
		self._btnLast.Text = "Last >|"
		self._btnLast.UseVisualStyleBackColor = True
		# 
		# lblTotalNotMapped
		# 
		self._lblTotalNotMapped.AutoSize = True
		self._lblTotalNotMapped.Font = System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0)
		self._lblTotalNotMapped.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._lblTotalNotMapped.Location = System.Drawing.Point(638, 96)
		self._lblTotalNotMapped.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._lblTotalNotMapped.Name = "lblTotalNotMapped"
		self._lblTotalNotMapped.Size = System.Drawing.Size(166, 13)
		self._lblTotalNotMapped.TabIndex = 98
		self._lblTotalNotMapped.Text = "Total Accounts Not Mapped"
		# 
		# btnPrevious
		# 
		self._btnPrevious.Location = System.Drawing.Point(178, 65)
		self._btnPrevious.Name = "btnPrevious"
		self._btnPrevious.Size = System.Drawing.Size(75, 21)
		self._btnPrevious.TabIndex = 81
		self._btnPrevious.Text = "< Previous"
		self._btnPrevious.UseVisualStyleBackColor = True
		# 
		# groupBox1
		# 
		self._groupBox1.Anchor = System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right
		self._groupBox1.Controls.Add(self._btnZAccountNotMapped)
		self._groupBox1.Controls.Add(self._chkAccountNotMapped)
		self._groupBox1.Controls.Add(self._lblSelectedAccounts)
		self._groupBox1.Controls.Add(self._cmbClientSiteStatus)
		self._groupBox1.Controls.Add(self._label10)
		self._groupBox1.Controls.Add(self._label2)
		self._groupBox1.Controls.Add(self._txtClientSiteName)
		self._groupBox1.Controls.Add(self._cmbPageSize)
		self._groupBox1.Controls.Add(self._label7)
		self._groupBox1.Controls.Add(self._lblPage)
		self._groupBox1.Controls.Add(self._btnLast)
		self._groupBox1.Controls.Add(self._btnNext)
		self._groupBox1.Controls.Add(self._btnPrevious)
		self._groupBox1.Controls.Add(self._btnFirst)
		self._groupBox1.Controls.Add(self._btnSearch)
		self._groupBox1.Controls.Add(self._label6)
		self._groupBox1.Controls.Add(self._label4)
		self._groupBox1.Controls.Add(self._label3)
		self._groupBox1.Controls.Add(self._txtClientSiteID)
		self._groupBox1.Controls.Add(self._txtAccountNo)
		self._groupBox1.Controls.Add(self._txtZuoraName)
		self._groupBox1.Location = System.Drawing.Point(0, 1)
		self._groupBox1.Name = "groupBox1"
		self._groupBox1.Size = System.Drawing.Size(1120, 92)
		self._groupBox1.TabIndex = 93
		self._groupBox1.TabStop = False
		# 
		# btnFirst
		# 
		self._btnFirst.Location = System.Drawing.Point(113, 65)
		self._btnFirst.Name = "btnFirst"
		self._btnFirst.Size = System.Drawing.Size(59, 21)
		self._btnFirst.TabIndex = 80
		self._btnFirst.Text = "|< First"
		self._btnFirst.UseVisualStyleBackColor = True
		# 
		# btnSearch
		# 
		self._btnSearch.Location = System.Drawing.Point(604, 65)
		self._btnSearch.Name = "btnSearch"
		self._btnSearch.Size = System.Drawing.Size(75, 21)
		self._btnSearch.TabIndex = 79
		self._btnSearch.Text = "Search"
		self._btnSearch.UseVisualStyleBackColor = True
		# 
		# label6
		# 
		self._label6.AutoSize = True
		self._label6.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label6.Location = System.Drawing.Point(414, 41)
		self._label6.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label6.Name = "label6"
		self._label6.Size = System.Drawing.Size(68, 13)
		self._label6.TabIndex = 76
		self._label6.Text = "Client Site ID"
		# 
		# label4
		# 
		self._label4.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label4.Location = System.Drawing.Point(414, 16)
		self._label4.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label4.Name = "label4"
		self._label4.Size = System.Drawing.Size(67, 17)
		self._label4.TabIndex = 75
		self._label4.Text = "Account No."
		# 
		# label3
		# 
		self._label3.AutoSize = True
		self._label3.ImeMode = System.Windows.Forms.ImeMode.NoControl
		self._label3.Location = System.Drawing.Point(9, 15)
		self._label3.Margin = System.Windows.Forms.Padding(3, 3, 1, 1)
		self._label3.Name = "label3"
		self._label3.Size = System.Drawing.Size(64, 13)
		self._label3.TabIndex = 74
		self._label3.Text = "Zuora name"
		# 
		# txtClientSiteID
		# 
		self._txtClientSiteID.Location = System.Drawing.Point(483, 38)
		self._txtClientSiteID.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtClientSiteID.MaxLength = 20
		self._txtClientSiteID.Name = "txtClientSiteID"
		self._txtClientSiteID.Size = System.Drawing.Size(196, 20)
		self._txtClientSiteID.TabIndex = 10
		# 
		# txtAccountNo
		# 
		self._txtAccountNo.Location = System.Drawing.Point(483, 12)
		self._txtAccountNo.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtAccountNo.MaxLength = 20
		self._txtAccountNo.Name = "txtAccountNo"
		self._txtAccountNo.Size = System.Drawing.Size(196, 20)
		self._txtAccountNo.TabIndex = 8
		# 
		# txtZuoraName
		# 
		self._txtZuoraName.Location = System.Drawing.Point(113, 12)
		self._txtZuoraName.Margin = System.Windows.Forms.Padding(1, 3, 3, 3)
		self._txtZuoraName.MaxLength = 255
		self._txtZuoraName.Name = "txtZuoraName"
		self._txtZuoraName.Size = System.Drawing.Size(295, 20)
		self._txtZuoraName.TabIndex = 1
		# 
		# frmEditAccountList
		# 
		self.ClientSize = System.Drawing.Size(1120, 545)
		self.Controls.Add(self._lblTotalMapped)
		self.Controls.Add(self._groupBox2)
		self.Controls.Add(self._label1)
		self.Controls.Add(self._dtgrd)
		self.Controls.Add(self._lblTotalNotMapped)
		self.Controls.Add(self._groupBox1)
		self.Name = "frmEditAccountList"
		self.Text = "Account List"
		self.WindowState = System.Windows.Forms.FormWindowState.Maximized
		self.Activated += self.FrmEditAccountListActivated
		self.FormClosing += self.FrmEditAccountListFormClosing
		self.Load += self.FrmEditAccountListLoad
		self._groupBox2.ResumeLayout(False)
		self._groupBox2.PerformLayout()
		self._dtgrd.EndInit()
		self._groupBox1.ResumeLayout(False)
		self._groupBox1.PerformLayout()
		self.ResumeLayout(False)
		self.PerformLayout()


	def FrmEditAccountListLoad(self, sender, e):
		pass
	
	def TabPag(self):
		return self._TabPag
	
	def SetTabPag(self, value):
		self._TabPag = value
		
	def GetTabPag(self):
		return self._TabPag

	def SetTablCtrl(self,value):
		self._TabCtrl = value
		
	def GetTablCtrl(self):
		return self._TabCtrl

	def FrmEditAccountListActivated(self, sender, e):
		self._TabCtrl.SelectedTab = self._TabPag
		if self._TabCtrl.Visible == False:
			self._TabCtrl.Visible = True

	def FrmEditAccountListFormClosing(self, sender, e):
		self._TabPag.Dispose()
		#If no Tabpage left
		if self._TabCtrl.TabPages.Count == 0:
			self._TabCtrl.Visible = False