import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.AlertType;
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Graphics;
import javax.microedition.midlet.MIDlet;
 
 
public class HotKeyCanvas extends Canvas {
	MIDlet m_midlet;
	Display display;
	Alert alert;
	public HotKeyCanvas(MIDlet midlet){
		m_midlet=midlet;
	}
 
	protected void paint(Graphics g) {
		// background color set
		g.setColor(0xabcdef);
		g.fillRect(0, 0, getWidth(), getHeight());
		g.setColor(0x65535);
                //this is used as a list 
                //caps latters used as a hot key for that item 
                //in usual case we go through list using arrow key after that press ok
                //but in this case we just press hot key no.
                //like for Name press 6 and we will go to the name info page.
                //and press 2 we will go directly to the address info page
		g.drawString("1.Name",6 ,6, Graphics.TOP|Graphics.LEFT);
		g.drawString("2.Dob",6 ,31, Graphics.TOP|Graphics.LEFT);
		g.drawString("3.Phone no",6 ,56, Graphics.TOP|Graphics.LEFT);
		g.drawString("4.Add",6 ,81, Graphics.TOP|Graphics.LEFT);
	}
	protected void keyPressed(int keyCode){
 
		display=Display.getDisplay(m_midlet);
                 //this is for Name.
 
		if(keyCode==54)
		{
                //alert is used to show the name info.
		alert = new Alert("Option Selected", " vivart pandey", null, null);
	      alert.setTimeout(Alert.FOREVER);
	      alert.setType(AlertType.INFO);
	      display.setCurrent(alert);}
 
                //this is for Dob.
		if(keyCode==51)
		{
		alert = new Alert("Option Selected", " 11-jun-1985", null, null);
	      alert.setTimeout(Alert.FOREVER);
	      alert.setType(AlertType.INFO);
	      display.setCurrent(alert);}
 
                //this is for Address.
		if(keyCode==50)
		{
		alert = new Alert("Option Selected", "Hyderabad,india", null, null);
	      alert.setTimeout(Alert.FOREVER);
	      alert.setType(AlertType.INFO);
	      display.setCurrent(alert);}
 
                 //this for phone no
		if(keyCode==55)
		{
		alert = new Alert("Option Selected", "09985374273", null, null);
	      alert.setTimeout(Alert.FOREVER);
	      alert.setType(AlertType.INFO);
	      display.setCurrent(alert);}
 
 
 
	}
 
}