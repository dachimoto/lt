import java.io.DataOutputStream;
import java.io.IOException;
import javax.microedition.io.Connector;
import javax.microedition.io.file.FileConnection;
import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.AlertType;
import javax.microedition.lcdui.ChoiceGroup;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.Item;
import javax.microedition.lcdui.ItemCommandListener;
import javax.microedition.lcdui.TextField;
import javax.microedition.midlet.MIDlet;

public class StubMIDlet extends MIDlet implements CommandListener,
        ItemCommandListener {
    private Display display;
    private Form mainForm;
    private TextField logField;
    private DataOutputStream logStream;

    /**
     * ChoiceGroup object is the visual component which can be represented as
     * radiobuttons object within Form object
     */
    private ChoiceGroup radiobuttonsObj;
    /**
     * incremental id's counter for radiobuttons objects
     */
    private int radiobuttonsIdCounter;

    private final String LOG_PATH;
    private static final String LOG_FILE = "JavaMEStubLog.txt";

    private static final Command ADD_RADIOBUTTON_COMMAND =
            new Command("Add new rbutton", Command.ITEM, 0);
    private static final Command DELETE_RADIOBUTTON_COMMAND =
            new Command("Delete rbutton", Command.ITEM, 0);
    private static final Command EXECUTE_COMMAND =
            new Command("Execute snippet", Command.ITEM, 0);
    private static final Command EXIT_COMMAND =
            new Command("Exit", Command.EXIT, 0);

    public StubMIDlet() {
        // The Others directory cannot be accessed through properties, so use
        // the picture directory (e.g. C:\Data\Images) as the destination for
        // logs
        LOG_PATH = System.getProperty("fileconn.dir.photos");

        display = Display.getDisplay(this);

        //set counter to 0. It means there are no radiobuttons ojects at this
        //moment
        radiobuttonsIdCounter = 0;

        setupMainForm();
        setupLogFile();
    }

    /**
     * Sets up the main form.
     */
    private void setupMainForm() {
        mainForm = new Form("StubMIDlet");

        logField = new TextField("Log", null, Short.MAX_VALUE, TextField.PLAIN);
        mainForm.append(logField);

        mainForm.addCommand(EXECUTE_COMMAND);
        mainForm.addCommand(EXIT_COMMAND);
        mainForm.setCommandListener(this);
    }

    /**
     * Sets up the stream for logging.
     */
    private void setupLogFile() {
        String fcVersion =
            System.getProperty("microedition.io.file.FileConnection.version");
        if (fcVersion == null) {
            printString("The device doesn't support file logging.\n" +
                    "Log output is not available.");
            return;
        }
        try {
            FileConnection fconn =
                    (FileConnection)Connector.open(LOG_PATH + LOG_FILE);
            if (!fconn.exists()) {
                fconn.create();
            }
            logStream = fconn.openDataOutputStream();
            fconn.close();
        } catch (IOException ex) {
            printString("The log file could not be set up.\n" +
                    "Log output is not available.");
            return;
        }
    }

    /**
     * Executes the snippet.
     * Implementation appends Radiobuttons object to mainForm object,
     * autocreates some radiobuttons items and
     * add two additional commands(one to Form and other to ChoiceGroup)
     */
    private void executeSnippet() {
        //adds RadiobuttonsObj object to our form
        mainForm.insert( 0 ,getRadiobuttonsObj());

        //adds delete radiobutton item command to RadiobuttonsObj object
        getRadiobuttonsObj().addCommand(DELETE_RADIOBUTTON_COMMAND);
        //sets up commands handler for RadiobuttonsObj object
        getRadiobuttonsObj().setItemCommandListener(this);
        //adds add radiobutton item command to RadiobuttonsObj object
        mainForm.addCommand(ADD_RADIOBUTTON_COMMAND);
        printString("Radiobuttons object successfully created!");

        String text = "Snippet executed";
        printString(text);
        try {
            logPrintString(text);
        } catch (IOException ex) {
            printString(ex.getMessage());
        }
        displayNote(text);
    }

    /**
     * Method creates ChoiceGroup object of "radiobuttons" type if it is not
     * exist and return the reference to it, or return the reference
     * to existing object.
     * @return the reference to ChoiceGroup object
     */
    private ChoiceGroup getRadiobuttonsObj() {
        if (radiobuttonsObj == null) {
            String[] rButtonsStrings = new String[3];

            //autocreating of names array for three radiobutton items
            for (radiobuttonsIdCounter = 0;
                    radiobuttonsIdCounter < 3;
                    radiobuttonsIdCounter++) {
                rButtonsStrings[radiobuttonsIdCounter] =
                        "radio " + radiobuttonsIdCounter;
            }
            //creating the ChoiceGroup object of radiobuttons type
            radiobuttonsObj = new ChoiceGroup("Radio Buttons!",
                    ChoiceGroup.EXCLUSIVE,
                    rButtonsStrings, null);
        }
        return radiobuttonsObj;
    }

    /**
     * Displays an information alert.
     */
    private void displayNote(String text) {
        Alert infoNote = new Alert("Info", text, null, AlertType.INFO);
        infoNote.setTimeout(3000);
        display.setCurrent(infoNote, mainForm);
    }

    /**
     * Prints a string on the screen.
     */
    private void printString(String text) {
        logField.insert(text + "\n", logField.size());
    }

    /**
     * Prints a string in the log file.
     */
    private void logPrintString(String text) throws IOException {
        if (logStream == null) {
            return;
        }
        logStream.writeChars(text + "\n");
        logStream.flush();
    }

    /**
     * Closes the opened resources and exits the application.
     */
    private void exit() {
        try {
            if (logStream != null) {
                logStream.close();
            }
        } catch (IOException ex) {
            printString(ex.getMessage());
        }
        notifyDestroyed();
    }

    /**
     * From MIDlet.
     * Called when the MIDlet is started.
     */
    public void startApp() {
        // The initial display is the main form
        display.setCurrent(mainForm);
    }

    /**
     * From MIDlet.
     * Called to signal the MIDlet to enter the Paused state.
     */
    public void pauseApp() {
        // No implementation required
    }

    /**
     * From MIDlet.
     * Called to signal the MIDlet to terminate.
     * @param unconditional whether the MIDlet has to be unconditionally
     * terminated
     */
    public void destroyApp(boolean unconditional) {
        // No implementation required
    }

    /**
     * From CommandListener.
     * Called by the system to indicate that a command has been invoked on a
     * particular displayable.
     * @param command the command that was invoked
     * @param displayable the displayable where the command was invoked
     */
    public void commandAction(Command command, Displayable displayable) {
        if (command == EXIT_COMMAND) {
            // Exit the MIDlet
            exit();
        } else if (command == EXECUTE_COMMAND) {
            // Execute the snippet
            executeSnippet();
            //remove execute command for safe working(we don't want second
            //attemp to create radiobuttons object)
            mainForm.removeCommand(EXECUTE_COMMAND);
        } else if (command == ADD_RADIOBUTTON_COMMAND) {
            printString("starting radiobutton item creation");
            String newrbuttonString = "Radio " + radiobuttonsIdCounter;
            radiobuttonsIdCounter++;
            //adding new radiobutton item
            getRadiobuttonsObj().append(newrbuttonString, null);
            printString("new radiobutton item successfully created!");
        }
    }

    /**
     * Implements the ItemCommandListener interface for our form.
     * It provides commands handling from Item's within Form object.
     * @param command - some type of Command object
     * @param item - Item object which owns command object
     */
    public void commandAction(Command command, Item item) {
        if (command == DELETE_RADIOBUTTON_COMMAND &&
                item == getRadiobuttonsObj()) {
            printString("starting selected radiobutton item deleting");
            //getting index of selected item
            int selectedIndex = getRadiobuttonsObj().getSelectedIndex();
            //deleting selected radiobutton item
            getRadiobuttonsObj().delete(selectedIndex);
            printString("new radiobutton item successfully created!");
        }
    }
}
