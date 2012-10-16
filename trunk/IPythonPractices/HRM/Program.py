import clr
clr.AddReference('System.Windows.Forms')
clr.AddReference('System.Drawing')

from System.Windows.Forms import Application
import frmMain

Application.EnableVisualStyles()
#Application.SetCompatibleTextRenderingDefault(False)
frm = frmMain.frmMain()
frm.ShowDialog();
