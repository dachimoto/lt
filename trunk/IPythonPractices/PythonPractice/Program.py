import clr
clr.AddReference('System.Windows.Forms')
clr.AddReference('System.Drawing')

from System.Windows.Forms import Application
import MainForm

Application.EnableVisualStyles()
Application.SetCompatibleTextRenderingDefault(false);
form = MainForm.MainForm()
Application.Run(form)
