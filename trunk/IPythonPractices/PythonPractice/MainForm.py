import System.Drawing
import System.Windows.Forms

from System.Drawing import *
from System.Windows.Forms import *

class MainForm(Form):
	def __init__(self):
		self.InitializeComponent()
	
	def InitializeComponent(self):
		self._splitContainer1 = System.Windows.Forms.SplitContainer()
		self._tabControl1 = System.Windows.Forms.TabControl()
		self._tabPage1 = System.Windows.Forms.TabPage()
		self._tabPage2 = System.Windows.Forms.TabPage()
		self._treeView1 = System.Windows.Forms.TreeView()
		self._splitContainer1.BeginInit()
		self._splitContainer1.Panel1.SuspendLayout()
		self._splitContainer1.Panel2.SuspendLayout()
		self._splitContainer1.SuspendLayout()
		self._tabControl1.SuspendLayout()
		self.SuspendLayout()
		# 
		# splitContainer1
		# 
		self._splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
		self._splitContainer1.Location = System.Drawing.Point(0, 0)
		self._splitContainer1.Name = "splitContainer1"
		# 
		# splitContainer1.Panel1
		# 
		self._splitContainer1.Panel1.Controls.Add(self._treeView1)
		# 
		# splitContainer1.Panel2
		# 
		self._splitContainer1.Panel2.Controls.Add(self._tabControl1)
		self._splitContainer1.Size = System.Drawing.Size(459, 390)
		self._splitContainer1.SplitterDistance = 153
		self._splitContainer1.TabIndex = 0
		# 
		# tabControl1
		# 
		self._tabControl1.Controls.Add(self._tabPage1)
		self._tabControl1.Controls.Add(self._tabPage2)
		self._tabControl1.Dock = System.Windows.Forms.DockStyle.Fill
		self._tabControl1.Location = System.Drawing.Point(0, 0)
		self._tabControl1.Name = "tabControl1"
		self._tabControl1.SelectedIndex = 0
		self._tabControl1.Size = System.Drawing.Size(302, 390)
		self._tabControl1.TabIndex = 0
		# 
		# tabPage1
		# 
		self._tabPage1.Location = System.Drawing.Point(4, 22)
		self._tabPage1.Name = "tabPage1"
		self._tabPage1.Padding = System.Windows.Forms.Padding(3)
		self._tabPage1.Size = System.Drawing.Size(294, 364)
		self._tabPage1.TabIndex = 0
		self._tabPage1.Text = "tabPage1"
		self._tabPage1.UseVisualStyleBackColor = True
		# 
		# tabPage2
		# 
		self._tabPage2.Location = System.Drawing.Point(4, 22)
		self._tabPage2.Name = "tabPage2"
		self._tabPage2.Padding = System.Windows.Forms.Padding(3)
		self._tabPage2.Size = System.Drawing.Size(192, 74)
		self._tabPage2.TabIndex = 1
		self._tabPage2.Text = "tabPage2"
		self._tabPage2.UseVisualStyleBackColor = True
		# 
		# treeView1
		# 
		self._treeView1.Dock = System.Windows.Forms.DockStyle.Fill
		self._treeView1.Location = System.Drawing.Point(0, 0)
		self._treeView1.Name = "treeView1"
		self._treeView1.Size = System.Drawing.Size(153, 390)
		self._treeView1.TabIndex = 0
		# 
		# MainForm
		# 
		self.ClientSize = System.Drawing.Size(459, 390)
		self.Controls.Add(self._splitContainer1)
		self.Name = "MainForm"
		self.Text = "PythonPractice"
		self.Load += self.MainFormLoad
		self._splitContainer1.Panel1.ResumeLayout(False)
		self._splitContainer1.Panel2.ResumeLayout(False)
		self._splitContainer1.EndInit()
		self._splitContainer1.ResumeLayout(False)
		self._tabControl1.ResumeLayout(False)
		self.ResumeLayout(False)
	