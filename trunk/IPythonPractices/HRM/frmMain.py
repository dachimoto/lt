import System.Drawing
import System.Windows.Forms

from System.Drawing import *
from System.Windows.Forms import *

import frmLogin
import frmSplash
import frmEditAccountList

class frmMain(Form):
	def __init__(self):
		self.InitializeComponent()
	
	def InitializeComponent(self):
		self._components = System.ComponentModel.Container()
		resources = System.Resources.ResourceManager("HRM.frmMain", System.Reflection.Assembly.GetEntryAssembly())
		self._toolStrip1 = System.Windows.Forms.ToolStrip()
		self._tsbNew = System.Windows.Forms.ToolStripButton()
		self._openToolStripButton = System.Windows.Forms.ToolStripButton()
		self._toolStripSeparator2 = System.Windows.Forms.ToolStripSeparator()
		self._tsbExportToExcel = System.Windows.Forms.ToolStripButton()
		self._toolStripSeparator = System.Windows.Forms.ToolStripSeparator()
		self._tsbExportToCSV = System.Windows.Forms.ToolStripButton()
		self._toolStripSeparator7 = System.Windows.Forms.ToolStripSeparator()
		self._tsbRefresh = System.Windows.Forms.ToolStripButton()
		self._helpToolStripButton = System.Windows.Forms.ToolStripButton()
		self._menuStrip1 = System.Windows.Forms.MenuStrip()
		self._infToolStripMenuItem = System.Windows.Forms.ToolStripMenuItem()
		self._tsAccountList = System.Windows.Forms.ToolStripMenuItem()
		self._tsEditAccountList = System.Windows.Forms.ToolStripMenuItem()
		self._tsAccountMapping = System.Windows.Forms.ToolStripMenuItem()
		self._tsUsageReport = System.Windows.Forms.ToolStripMenuItem()
		self._toolStripSeparator4 = System.Windows.Forms.ToolStripSeparator()
		self._tsTracking = System.Windows.Forms.ToolStripMenuItem()
		self._systemToolStripMenuItem = System.Windows.Forms.ToolStripMenuItem()
		self._tsExportToExcel = System.Windows.Forms.ToolStripMenuItem()
		self._tsExportToCSV = System.Windows.Forms.ToolStripMenuItem()
		self._tsRefresh = System.Windows.Forms.ToolStripMenuItem()
		self._tsOption = System.Windows.Forms.ToolStripMenuItem()
		self._tsDBConfig = System.Windows.Forms.ToolStripMenuItem()
		self._toolStripSeparator3 = System.Windows.Forms.ToolStripSeparator()
		self._tsChangePassword = System.Windows.Forms.ToolStripMenuItem()
		self._tsLogout = System.Windows.Forms.ToolStripMenuItem()
		self._tsLogin = System.Windows.Forms.ToolStripMenuItem()
		self._toolStripSeparator1 = System.Windows.Forms.ToolStripSeparator()
		self._tsExit = System.Windows.Forms.ToolStripMenuItem()
		self._windowsToolStripMenuItem = System.Windows.Forms.ToolStripMenuItem()
		self._tsCascade = System.Windows.Forms.ToolStripMenuItem()
		self._tsArrangeIcon = System.Windows.Forms.ToolStripMenuItem()
		self._tsTitleHorizontal = System.Windows.Forms.ToolStripMenuItem()
		self._tsTileVertical = System.Windows.Forms.ToolStripMenuItem()
		self._helpToolStripMenuItem = System.Windows.Forms.ToolStripMenuItem()
		self._tsAbout = System.Windows.Forms.ToolStripMenuItem()
		self._statusStrip1 = System.Windows.Forms.StatusStrip()
		self._tssServer = System.Windows.Forms.ToolStripStatusLabel()
		self._tssDatabase = System.Windows.Forms.ToolStripStatusLabel()
		self._tssUser = System.Windows.Forms.ToolStripStatusLabel()
		self._tssproBar = System.Windows.Forms.ToolStripProgressBar()
		self._tssVersion = System.Windows.Forms.ToolStripStatusLabel()
		self._tabControl1 = System.Windows.Forms.TabControl()
		self._imageList1 = System.Windows.Forms.ImageList(self._components)
		self._toolStrip1.SuspendLayout()
		self._menuStrip1.SuspendLayout()
		self._statusStrip1.SuspendLayout()
		self.SuspendLayout()
		# 
		# toolStrip1
		# 
		self._toolStrip1.ImageScalingSize = System.Drawing.Size(36, 36)
		self._toolStrip1.Items.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._tsbNew,
			self._openToolStripButton,
			self._toolStripSeparator2,
			self._tsbExportToExcel,
			self._toolStripSeparator,
			self._tsbExportToCSV,
			self._toolStripSeparator7,
			self._tsbRefresh,
			self._helpToolStripButton]))
		self._toolStrip1.Location = System.Drawing.Point(0, 24)
		self._toolStrip1.Name = "toolStrip1"
		self._toolStrip1.Size = System.Drawing.Size(743, 43)
		self._toolStrip1.TabIndex = 1
		self._toolStrip1.Text = "toolStrip1"
		# 
		# tsbNew
		# 
		self._tsbNew.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
		self._tsbNew.Enabled = False
		self._tsbNew.Image = resources.GetObject("tsbNew.Image")
		self._tsbNew.ImageTransparentColor = System.Drawing.Color.Magenta
		self._tsbNew.Name = "tsbNew"
		self._tsbNew.Size = System.Drawing.Size(40, 40)
		self._tsbNew.Tag = "D"
		self._tsbNew.Text = "&New"
		# 
		# openToolStripButton
		# 
		self._openToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
		self._openToolStripButton.Image = resources.GetObject("openToolStripButton.Image")
		self._openToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta
		self._openToolStripButton.Name = "openToolStripButton"
		self._openToolStripButton.Size = System.Drawing.Size(40, 40)
		self._openToolStripButton.Tag = "D"
		self._openToolStripButton.Text = "&Open"
		# 
		# toolStripSeparator2
		# 
		self._toolStripSeparator2.Name = "toolStripSeparator2"
		self._toolStripSeparator2.Size = System.Drawing.Size(6, 43)
		# 
		# tsbExportToExcel
		# 
		self._tsbExportToExcel.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
		self._tsbExportToExcel.Image = resources.GetObject("tsbExportToExcel.Image")
		self._tsbExportToExcel.ImageTransparentColor = System.Drawing.Color.Magenta
		self._tsbExportToExcel.Name = "tsbExportToExcel"
		self._tsbExportToExcel.Size = System.Drawing.Size(40, 40)
		self._tsbExportToExcel.Tag = ""
		self._tsbExportToExcel.Text = "Export to Excel"
		# 
		# toolStripSeparator
		# 
		self._toolStripSeparator.Name = "toolStripSeparator"
		self._toolStripSeparator.Size = System.Drawing.Size(6, 43)
		# 
		# tsbExportToCSV
		# 
		self._tsbExportToCSV.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
		self._tsbExportToCSV.Image = resources.GetObject("tsbExportToCSV.Image")
		self._tsbExportToCSV.ImageTransparentColor = System.Drawing.Color.Magenta
		self._tsbExportToCSV.Name = "tsbExportToCSV"
		self._tsbExportToCSV.Size = System.Drawing.Size(40, 40)
		self._tsbExportToCSV.Text = "toolStripButton1"
		# 
		# toolStripSeparator7
		# 
		self._toolStripSeparator7.Name = "toolStripSeparator7"
		self._toolStripSeparator7.Size = System.Drawing.Size(6, 43)
		# 
		# tsbRefresh
		# 
		self._tsbRefresh.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
		self._tsbRefresh.Image = resources.GetObject("tsbRefresh.Image")
		self._tsbRefresh.ImageTransparentColor = System.Drawing.Color.Magenta
		self._tsbRefresh.Name = "tsbRefresh"
		self._tsbRefresh.Size = System.Drawing.Size(40, 40)
		self._tsbRefresh.Text = "Refresh"
		# 
		# helpToolStripButton
		# 
		self._helpToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
		self._helpToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta
		self._helpToolStripButton.Name = "helpToolStripButton"
		self._helpToolStripButton.Size = System.Drawing.Size(23, 40)
		self._helpToolStripButton.Text = "He&lp"
		# 
		# menuStrip1
		# 
		self._menuStrip1.Items.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._infToolStripMenuItem,
			self._systemToolStripMenuItem,
			self._windowsToolStripMenuItem,
			self._helpToolStripMenuItem]))
		self._menuStrip1.Location = System.Drawing.Point(0, 0)
		self._menuStrip1.MdiWindowListItem = self._windowsToolStripMenuItem
		self._menuStrip1.Name = "menuStrip1"
		self._menuStrip1.Size = System.Drawing.Size(743, 24)
		self._menuStrip1.TabIndex = 0
		self._menuStrip1.Text = "menuStrip1"
		# 
		# infToolStripMenuItem
		# 
		self._infToolStripMenuItem.DropDownItems.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._tsAccountList,
			self._tsEditAccountList,
			self._tsAccountMapping,
			self._tsUsageReport,
			self._toolStripSeparator4,
			self._tsTracking]))
		self._infToolStripMenuItem.Name = "infToolStripMenuItem"
		self._infToolStripMenuItem.Size = System.Drawing.Size(41, 20)
		self._infToolStripMenuItem.Tag = ""
		self._infToolStripMenuItem.Text = "&View"
		# 
		# tsAccountList
		# 
		self._tsAccountList.Name = "tsAccountList"
		self._tsAccountList.Size = System.Drawing.Size(201, 22)
		self._tsAccountList.Text = "Account List"
		self._tsAccountList.Visible = False
		# 
		# tsEditAccountList
		# 
		self._tsEditAccountList.Name = "tsEditAccountList"
		self._tsEditAccountList.ShortcutKeys = System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.A
		self._tsEditAccountList.Size = System.Drawing.Size(201, 22)
		self._tsEditAccountList.Text = "Account Associate"
		self._tsEditAccountList.Click += self.TsEditAccountListClick
		# 
		# tsAccountMapping
		# 
		self._tsAccountMapping.Name = "tsAccountMapping"
		self._tsAccountMapping.ShortcutKeys = System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.M
		self._tsAccountMapping.Size = System.Drawing.Size(201, 22)
		self._tsAccountMapping.Text = "Account Mapping"
		self._tsAccountMapping.Visible = False
		# 
		# tsUsageReport
		# 
		self._tsUsageReport.Name = "tsUsageReport"
		self._tsUsageReport.ShortcutKeys = System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.U
		self._tsUsageReport.Size = System.Drawing.Size(201, 22)
		self._tsUsageReport.Text = "Usage Report"
		# 
		# toolStripSeparator4
		# 
		self._toolStripSeparator4.Name = "toolStripSeparator4"
		self._toolStripSeparator4.Size = System.Drawing.Size(198, 6)
		# 
		# tsTracking
		# 
		self._tsTracking.Name = "tsTracking"
		self._tsTracking.ShortcutKeys = System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.T
		self._tsTracking.Size = System.Drawing.Size(201, 22)
		self._tsTracking.Tag = ""
		self._tsTracking.Text = "Tracking"
		# 
		# systemToolStripMenuItem
		# 
		self._systemToolStripMenuItem.DropDownItems.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._tsExportToExcel,
			self._tsExportToCSV,
			self._tsRefresh,
			self._tsOption,
			self._tsDBConfig,
			self._toolStripSeparator3,
			self._tsChangePassword,
			self._tsLogout,
			self._tsLogin,
			self._toolStripSeparator1,
			self._tsExit]))
		self._systemToolStripMenuItem.Name = "systemToolStripMenuItem"
		self._systemToolStripMenuItem.Size = System.Drawing.Size(44, 20)
		self._systemToolStripMenuItem.Tag = ""
		self._systemToolStripMenuItem.Text = "&Tools"
		# 
		# tsExportToExcel
		# 
		self._tsExportToExcel.Name = "tsExportToExcel"
		self._tsExportToExcel.ShortcutKeys = System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.E
		self._tsExportToExcel.Size = System.Drawing.Size(194, 22)
		self._tsExportToExcel.Tag = ""
		self._tsExportToExcel.Text = "Export to Excel"
		# 
		# tsExportToCSV
		# 
		self._tsExportToCSV.Name = "tsExportToCSV"
		self._tsExportToCSV.Size = System.Drawing.Size(194, 22)
		self._tsExportToCSV.Text = "Export to CSV"
		# 
		# tsRefresh
		# 
		self._tsRefresh.Name = "tsRefresh"
		self._tsRefresh.ShortcutKeys = System.Windows.Forms.Keys.F5
		self._tsRefresh.Size = System.Drawing.Size(194, 22)
		self._tsRefresh.Text = "Refresh"
		# 
		# tsOption
		# 
		self._tsOption.Name = "tsOption"
		self._tsOption.Size = System.Drawing.Size(194, 22)
		self._tsOption.Text = "Option..."
		# 
		# tsDBConfig
		# 
		self._tsDBConfig.Enabled = False
		self._tsDBConfig.Name = "tsDBConfig"
		self._tsDBConfig.Size = System.Drawing.Size(194, 22)
		self._tsDBConfig.Tag = "F"
		self._tsDBConfig.Text = "Database configuration.."
		# 
		# toolStripSeparator3
		# 
		self._toolStripSeparator3.Name = "toolStripSeparator3"
		self._toolStripSeparator3.Size = System.Drawing.Size(191, 6)
		# 
		# tsChangePassword
		# 
		self._tsChangePassword.Name = "tsChangePassword"
		self._tsChangePassword.Size = System.Drawing.Size(194, 22)
		self._tsChangePassword.Text = "Change password..."
		self._tsChangePassword.Visible = False
		# 
		# tsLogout
		# 
		self._tsLogout.Name = "tsLogout"
		self._tsLogout.Size = System.Drawing.Size(194, 22)
		self._tsLogout.Text = "Log out..."
		# 
		# tsLogin
		# 
		self._tsLogin.Name = "tsLogin"
		self._tsLogin.Size = System.Drawing.Size(194, 22)
		self._tsLogin.Tag = "F"
		self._tsLogin.Text = "Login..."
		# 
		# toolStripSeparator1
		# 
		self._toolStripSeparator1.Name = "toolStripSeparator1"
		self._toolStripSeparator1.Size = System.Drawing.Size(191, 6)
		# 
		# tsExit
		# 
		self._tsExit.Name = "tsExit"
		self._tsExit.Size = System.Drawing.Size(194, 22)
		self._tsExit.Tag = "E"
		self._tsExit.Text = "E&xit"
		# 
		# windowsToolStripMenuItem
		# 
		self._windowsToolStripMenuItem.DropDownItems.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._tsCascade,
			self._tsArrangeIcon,
			self._tsTitleHorizontal,
			self._tsTileVertical]))
		self._windowsToolStripMenuItem.Name = "windowsToolStripMenuItem"
		self._windowsToolStripMenuItem.Size = System.Drawing.Size(62, 20)
		self._windowsToolStripMenuItem.Text = "&Windows"
		# 
		# tsCascade
		# 
		self._tsCascade.Name = "tsCascade"
		self._tsCascade.Size = System.Drawing.Size(144, 22)
		self._tsCascade.Tag = "E"
		self._tsCascade.Text = "Cascade"
		# 
		# tsArrangeIcon
		# 
		self._tsArrangeIcon.Name = "tsArrangeIcon"
		self._tsArrangeIcon.Size = System.Drawing.Size(144, 22)
		self._tsArrangeIcon.Tag = "E"
		self._tsArrangeIcon.Text = "Arrange Icons"
		# 
		# tsTitleHorizontal
		# 
		self._tsTitleHorizontal.Name = "tsTitleHorizontal"
		self._tsTitleHorizontal.Size = System.Drawing.Size(144, 22)
		self._tsTitleHorizontal.Tag = "E"
		self._tsTitleHorizontal.Text = "Title horizontal"
		# 
		# tsTileVertical
		# 
		self._tsTileVertical.Name = "tsTileVertical"
		self._tsTileVertical.Size = System.Drawing.Size(144, 22)
		self._tsTileVertical.Tag = "E"
		self._tsTileVertical.Text = "Tile vertical"
		# 
		# helpToolStripMenuItem
		# 
		self._helpToolStripMenuItem.DropDownItems.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._tsAbout]))
		self._helpToolStripMenuItem.Name = "helpToolStripMenuItem"
		self._helpToolStripMenuItem.Size = System.Drawing.Size(40, 20)
		self._helpToolStripMenuItem.Text = "&Help"
		# 
		# tsAbout
		# 
		self._tsAbout.Name = "tsAbout"
		self._tsAbout.Size = System.Drawing.Size(115, 22)
		self._tsAbout.Tag = "E"
		self._tsAbout.Text = "&About..."
		# 
		# statusStrip1
		# 
		self._statusStrip1.Items.AddRange(System.Array[System.Windows.Forms.ToolStripItem](
			[self._tssServer,
			self._tssDatabase,
			self._tssUser,
			self._tssproBar,
			self._tssVersion]))
		self._statusStrip1.Location = System.Drawing.Point(0, 324)
		self._statusStrip1.Name = "statusStrip1"
		self._statusStrip1.Size = System.Drawing.Size(743, 22)
		self._statusStrip1.TabIndex = 15
		self._statusStrip1.Text = "statusStrip1"
		# 
		# tssServer
		# 
		self._tssServer.BackColor = System.Drawing.SystemColors.Control
		self._tssServer.Name = "tssServer"
		self._tssServer.Size = System.Drawing.Size(39, 17)
		self._tssServer.Text = "Server"
		# 
		# tssDatabase
		# 
		self._tssDatabase.BackColor = System.Drawing.SystemColors.ButtonFace
		self._tssDatabase.Name = "tssDatabase"
		self._tssDatabase.Size = System.Drawing.Size(53, 17)
		self._tssDatabase.Text = "Database"
		# 
		# tssUser
		# 
		self._tssUser.BackColor = System.Drawing.SystemColors.ButtonFace
		self._tssUser.Name = "tssUser"
		self._tssUser.Size = System.Drawing.Size(29, 17)
		self._tssUser.Text = "User"
		# 
		# tssproBar
		# 
		self._tssproBar.Name = "tssproBar"
		self._tssproBar.Size = System.Drawing.Size(300, 16)
		self._tssproBar.Visible = False
		# 
		# tssVersion
		# 
		self._tssVersion.BackColor = System.Drawing.SystemColors.Control
		self._tssVersion.ImageAlign = System.Drawing.ContentAlignment.MiddleRight
		self._tssVersion.Name = "tssVersion"
		self._tssVersion.Size = System.Drawing.Size(42, 17)
		self._tssVersion.Text = "Version"
		self._tssVersion.Visible = False
		# 
		# tabControl1
		# 
		self._tabControl1.Dock = System.Windows.Forms.DockStyle.Top
		self._tabControl1.Location = System.Drawing.Point(0, 67)
		self._tabControl1.Name = "tabControl1"
		self._tabControl1.SelectedIndex = 0
		self._tabControl1.Size = System.Drawing.Size(743, 21)
		self._tabControl1.TabIndex = 2
		self._tabControl1.Visible = False
		self._tabControl1.SelectedIndexChanged += self.TabControl1SelectedIndexChanged
		# 
		# imageList1
		# 
		self._imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
		self._imageList1.ImageSize = System.Drawing.Size(48, 48)
		self._imageList1.TransparentColor = System.Drawing.Color.Transparent
		# 
		# frmMain
		# 
		self.ClientSize = System.Drawing.Size(743, 346)
		self.Controls.Add(self._tabControl1)
		self.Controls.Add(self._toolStrip1)
		self.Controls.Add(self._menuStrip1)
		self.Controls.Add(self._statusStrip1)
		self.IsMdiContainer = True
		self.Name = "frmMain"
		self.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		self.Text = "Usage Report"
		self.WindowState = System.Windows.Forms.FormWindowState.Maximized
		self.Load += self.FrmMainLoad
		self._toolStrip1.ResumeLayout(False)
		self._toolStrip1.PerformLayout()
		self._menuStrip1.ResumeLayout(False)
		self._menuStrip1.PerformLayout()
		self._statusStrip1.ResumeLayout(False)
		self._statusStrip1.PerformLayout()
		self.ResumeLayout(False)
		self.PerformLayout()


	def FrmMainLoad(self, sender, e):
		frmS = frmSplash.frmSplash()		
		frmS.HideLinks()
		frmS.ShowDialog()		
		frm = frmLogin.frmLogin()
		frm.ShowDialog()

	def TabControl1SelectedIndexChanged(self, sender, e):
		for frm in self.MdiChildren:
			if frm.TabPag().Equals(self._tabControl1.SelectedTab):
				frm.Select()				

	def TsEditAccountListClick(self, sender, e):
		frm = frmEditAccountList.frmEditAccountList()
		frm.MdiParent = self
		Application.DoEvents()
		frm.SetTablCtrl(self._tabControl1)
		tp = TabPage()
		tp.Parent = self._tabControl1
		tp.Text = frm.Text
		tp.Show()
		frm.SetTabPag(tp)
		self._tabControl1.SelectedTab = tp
		frm.Show()
		frm.WindowState = FormWindowState.Maximized		