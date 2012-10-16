import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import java.util.Enumeration;
import javax.microedition.io.file.*;
import javax.microedition.io.*;
import java.io.*;
 
public class FileListMIDlet extends MIDlet implements CommandListener {
    private Form form;
    private Command exitCommand;
 
    public void startApp() {
        form = new Form("C:/contents"); //creates a new Form screen
        exitCommand = new Command("Exit", Command.EXIT, 1); //creates the exit command
        form.addCommand(exitCommand); //adds the command to the Form
        form.setCommandListener(this); //sets a command listener
        Display.getDisplay(this).setCurrent(form);
        getFileList("file:///c:/");
    }
 
    public void pauseApp() {
    }
 
    public void destroyApp(boolean unconditional) {
    }
 
    protected void getFileList(String path) {
        try { 
            //Opens a file connection in READ mode
            FileConnection fc = (FileConnection)Connector.open(path, Connector.READ);
            Enumeration filelist = fc.list("*", true); //also hidden files are shown
            String filename;
            while(filelist.hasMoreElements()) {
                filename = (String) filelist.nextElement();
                fc = (FileConnection)Connector.open(path + filename, Connector.READ);
                if(fc.isDirectory()) { //checks if fc is a directory
                    long size = fc.directorySize(false);
                    form.append(filename+" - "+Integer.toString((int)size)+"B\n");
                } else { //otherwise, is a file
                    long size = fc.fileSize();
                    form.append(filename+" - "+Integer.toString((int)size)+"B\n");
                }
            }   
            fc.close();
        }
        catch (IOException ioe) {
            System.out.println("IOException: "+ioe.getMessage());            
        }
        catch (SecurityException se) {
            System.out.println("SecurityException: "+se.getMessage());            
        }
    }
 
    public void commandAction(Command c, Displayable d) {
        if (c == exitCommand) this.notifyDestroyed();
    }    
}