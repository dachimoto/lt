import javax.microedition.lcdui.Display;
import javax.microedition.midlet.MIDlet;
import javax.microedition.midlet.MIDletStateChangeException;
 
 
public class HotkeyMidlet extends MIDlet {
 
	private Display display;
 
 
	protected void destroyApp(boolean arg0) throws MIDletStateChangeException {
			}
 
	protected void pauseApp() {
 
	}
 
	protected void startApp() throws MIDletStateChangeException {
		//  daisplay canvas
		display = Display.getDisplay(this);
		HotKeyCanvas cd=new HotKeyCanvas(this);
 
		display.setCurrent(cd);
 
	}
 
}