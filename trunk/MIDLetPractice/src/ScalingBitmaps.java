import java.io.IOException;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.Image;
import javax.microedition.midlet.MIDlet;
 
 
public class ScalingBitmaps extends MIDlet implements CommandListener {
 
    private Image image;
 
    private Command zoomIn;
    private Command zoomOut;
    private Command exitCommand;
 
    private Form form;
    private Display display;
 
    private double zoomFactor = 1.2;
 
    /**
     * Constructor. Constructs the object and initializes displayables.
     */
    public ScalingBitmaps() {
        try {
            image = Image.createImage("/vietnam.jpg");
        } catch (IOException e) {
            //TODO: Handle exception.
        }
 
        form = new Form("Scale Bitmap");
        zoomIn = new Command("Zoom In", Command.OK, 1);
        zoomOut = new Command("Zoom Out", Command.OK, 2);
        exitCommand = new Command("Exit", Command.EXIT, 3);
 
 
        form.addCommand(zoomIn);
        form.addCommand(zoomOut);
        form.addCommand(exitCommand);
        form.setCommandListener(this);
 
        form.append(image);
 
        display = Display.getDisplay(this);
        display.setCurrent(form);
    }
 
    /**
     * From CommandListener.
     * Called by the system to indicate that a command has been invoked on a
     * particular displayable.
     * @param cmd the command that was invoked
     * @param displayable the displayable where the command was invoked
     */
    public void commandAction(Command cmd, Displayable displayable) {
        if (cmd == exitCommand) {
            notifyDestroyed();
        } else if (cmd == zoomOut) {
            image = scaleImage(image, (int)(image.getWidth() / zoomFactor), 
                                      (int)(image.getHeight() / zoomFactor));
            form.deleteAll();
            form.append(image);
        } else if (cmd == zoomIn) {
            image = scaleImage(image, (int)(image.getWidth() * zoomFactor), 
                                      (int)(image.getHeight() * zoomFactor));
            form.deleteAll();
            form.append(image);
        }
 
    }
 
    /**
     * Changes size of bitmap.
     * @param sourceImage source image.
     * @param newWidth width of new image.
     * @param newHeight height of new image.
     * @return scaled image.
     */
    private Image scaleImage(Image sourceImage, int newWidth, int newHeight) {
        //Remember image size.
        int oldWidth = sourceImage.getWidth();
        int oldHeight = sourceImage.getHeight();
 
        //Create buffer for input image.
        int[] inputData = new int[oldWidth * oldHeight];
        //Fill it with image data.
        sourceImage.getRGB(inputData, 0, oldWidth, 0, 0, oldWidth, oldHeight);
 
        //Create buffer for output image.
        int[] outputData = new int[newWidth * newHeight];
 
        int YD = (oldHeight / newHeight - 1) * oldWidth;
        int YR = oldHeight % newHeight;
        int XD = oldWidth / newWidth;
        int XR = oldWidth % newWidth;
        //New image buffer offset.
        int outOffset = 0;
        //Source image buffer offset.
        int inOffset = 0;
 
        for (int y = newHeight, YE = 0; y > 0; y--) {
            for (int x = newWidth, XE = 0; x > 0; x--) {
                //Copying pixel from old image to new.
                outputData[outOffset++] = inputData[inOffset];
                inOffset += XD;
                //Calculations for "smooth" scaling in x dimension.
                XE += XR;
                if (XE >= newWidth) {
                    XE -= newWidth;
                    inOffset++;
                }
            }
            inOffset += YD;
            //Calculations for "smooth" scaling in y dimension.
            YE += YR;
            if (YE >= newHeight) {
                YE -= newHeight;
                inOffset += oldWidth;
            }
        }
        //Create image from output buffer.
        return Image.createRGBImage(outputData, newWidth, newHeight, false);
    }
 
    /**
     * From MIDlet.
     * Called when the MIDlet is started.
     */
    public void startApp() {
        // No implementation required.
    }
 
    /**
     * From MIDlet.
     * Called to signal the MIDlet to enter the Paused state.
     */
    public void pauseApp() {
        // No implementation required.
    }
 
    /**
     * From MIDlet.
     * Called to signal the MIDlet to terminate.
     * @param unconditional whether the MIDlet has to be unconditionally
     * terminated
     */
    public void destroyApp(boolean unconditional) {
    }
}