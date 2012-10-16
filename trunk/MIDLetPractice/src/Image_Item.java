import java.io.IOException;
import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.io.*;
import java.io.*;;
 
public class Image_Item extends MIDlet  
{
    public Image_Item() {
    }	
    Display display=Display.getDisplay(this);
    // Main form
    private Form form;       
    
    public void startApp() 
    {
        form = new Form("Form example");
        try 
        {
        	HttpConnection c = (HttpConnection) Connector.open("http://coremetrics.com/images/coremetrics-logo.gif");
        	DataInputStream response = new DataInputStream(c.openInputStream());
        	int len = (int)c.getLength();
        	byte[] receivedImage = new byte[len];
        	response.readFully(receivedImage);
        	response.close();
        	 
        	// We have now the image in a byte array.
        	// We have to transform it in a LCUI Image object        	 
        	Image im = Image.createImage(receivedImage, 0, receivedImage.length);        	
            //Image Logo = Image.createImage("images/MyPicture.jpg");
            //ImageItem(label,Image,layout,alternative text)
            ImageItem imageitem =new ImageItem("ImageItem Example",im,ImageItem.LAYOUT_CENTER,"My Picture");
            form.append(imageitem);         
            
            //form.addCommand(exitCommand);
            //form.addCommand(helpCommand);
            
            //form.setCommandListener(this);
            // Get display for drawning                    
            //display.setCurrent(form);            
        } 
        catch (IOException ex) 
        {
            System.out.println("Exception occurred: "+ex);
        }
       display.setCurrent(form);
    }
    
    public void pauseApp() {
    }
 
    // Your MIDlet should not call destroyApp(), only system will call this life-cycle method    
    public void destroyApp(boolean unconditional) {
    }
    
    public void exitMIDlet() {
        display.setCurrent(null);
        notifyDestroyed();
    }    
}