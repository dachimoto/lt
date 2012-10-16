import java.io.*;
import java.util.*;
import javax.microedition.io.*;
import javax.microedition.midlet.*;
import javax.microedition.io.file.*;

public class FileConnectionDemo extends MIDlet {

   public void startApp() {
      System.out.println("MIDlet Started....");
      getRoots();
      GetSDcardContent();
      //showFile("readme.txt");
   }

   public void pauseApp() {
   }

   public void destroyApp(boolean condition) {
      notifyDestroyed();
   }

   private void getRoots() {
      Enumeration drives = FileSystemRegistry.listRoots();
      System.out.println("The valid roots found are: ");
      while(drives.hasMoreElements()) {
         String root = (String) drives.nextElement();
         System.out.println("\t"+root);
      }
   }

   private void GetSDcardContent() {
      try {
         FileConnection fc = (FileConnection)
            Connector.open("file:///CFCard/");
         // Get a filtered list of all files and directories.
         // True means: include hidden files.
         // To list just visible files and directories, use
         // list() with no arguments.
         System.out.println
            ("List of files and directories under CFCard:");
         Enumeration filelist = fc.list("*", true);
         while(filelist.hasMoreElements()) {
            String fileName = (String) filelist.nextElement();
            fc = (FileConnection)
               Connector.open("file:///CFCard/" + fileName);
            if(fc.isDirectory()) {
               System.out.println("\tDirectory Name: " + fileName);
            } else {
               System.out.println
                  ("\tFile Name: " + fileName + 
                   "\tSize: "+fc.fileSize());
            }
            
         }   
         fc.close();
      } catch (IOException ioe) {
         System.out.println(ioe.getMessage());
      }
   }

   public void showFile(String fileName) {
      try {
         FileConnection fc = (FileConnection)
            Connector.open("file:///CFCard/" + fileName);
         if(!fc.exists()) {
            throw new IOException("File does not exist");
         }
         InputStream is = fc.openInputStream();
         byte b[] = new byte[1024];
         int length = is.read(b, 0, 1024);
         System.out.println
            ("Content of "+fileName + ": "+ new String(b, 0, length));
      } catch (Exception e) {
      }
   }
}
