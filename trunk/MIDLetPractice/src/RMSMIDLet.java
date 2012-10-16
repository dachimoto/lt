/*
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 */

import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.List;
import javax.microedition.lcdui.Screen;
import javax.microedition.midlet.MIDlet;
import javax.microedition.rms.RecordComparator;
import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;
import javax.microedition.rms.RecordStoreException;
import javax.microedition.rms.RecordStoreNotOpenException;

/**
 * A simple class that shows various functionality of RMS.
 * The general flow of this MIDlet is:
 *      
 *      In the constructor (See RMSMIDlet),
 *      create and populate two record stores, one of personal
 *      contacts, the other with business contacts.
 *      Display the first screen. This screen shows a list
 *      of all RMS stores found in the MIDlet suite's name
 *      space. This screen allows the user to select a
 *      record store and either display pertinent information
 *      about the record store such as size, etc., or to view
 *      the contents of the selected store. When the contents
 *      of a record store are viewed, they are sorted by last
 *      name, though this can be changed by instantiate a
 *      SimpleComparator object with the appropriate
 *      sort order parameter.
 *
 *      Traversal from screen to screen is handled
 *      by RMSMIDlet, commandAction.
 *      
 */
public class RMSMIDLet extends MIDlet implements CommandListener {
    private Display myDisplay;  // handle to the display
    private Alert alert;        // used to display errors

    // Our commands to display on every screen.
    private Command CMD_EXIT;
    private Command CMD_DETAILS;
    private Command CMD_OK;

    // Our screens
    private List mainScr;
    private List detailScr;
    private List dataScr;

    // An array of all RMS stores found in this
    // MIDlets name space.
    private String[] recordStoreNames;

    /**
     * Seed data for creating personal contacts RMS store
     */
    private final String personalContacts[] = {
        "John", "Zach", "2225556669",
        "Mark", "Lynn", "5125551212",
        "Joy", "Beth", "2705551234",
        "Abby", "Lynn", "4085558566",
    };

    /**
     * Seed data for creating business contacts RMS store
     */
    private final String businessContacts[] = {
        "Ted", "Alan", "4125552235",
        "Sterling", "Wincle", "9995559111",
        "Deborah", "Elaine", "4445552323",
        "Suzanne", "Melissa"," 5125556064",
        "Frank", "Kenneth", "7775551212",
        "Dwight", "Poe", "1115557234",
        "Laura", "Beth", "2055558888",
        "Lisa", "Dawn", "2705551267",
        "Betty", "June", "5555551556",
        "Yvonne", "Poe", "6665558888",
        "Lizzy", "Loo", "5025557971",
        "John", "Gerald", "3335551256",
    };

    /**
     * Display a warning on the screen and revert
     * to the main screen.
     *
     * s  A warning string to display
     */
    private void doAlert(String s) {
        alert.setString(s);
        myDisplay.setCurrent(alert, mainScr);
    }

    /**
     * Notify the system we are exiting.
     */
    private void doExit() {
        destroyApp(false);
        notifyDestroyed();
    }

    /**
     * In our simple MIDlet, all screens have the same commands,
     * with the possible exception of the detailScr.
     * 
     * Also set up the command listener to call commandAction.
     * See RMSMIDlet#commandAction
     */
    private void addCommonCommands(Screen s,
                                   boolean doDetails) {
        s.addCommand(CMD_OK);
        s.addCommand(CMD_EXIT);
        if (doDetails) {
            s.addCommand(CMD_DETAILS);
        }
        s.setCommandListener(this);
    }

    /**
     * The public constructor. In our constructor, we get
     * a handle to our display and create two record stores.
     * In the event of an error, we display an alert.
     */
    public RMSMIDLet() {
        CMD_EXIT = new Command("Exit", Command.EXIT, 3);
        CMD_DETAILS = new Command("Details", Command.SCREEN, 2);
        CMD_OK = new Command("OK", Command.OK, 1);
        myDisplay = Display.getDisplay(this);
        alert = new Alert("Warning");
        alert.setTimeout(2000);

        CreateAddressBook.createRecordStore("Personal",
                                            personalContacts);
        CreateAddressBook.createRecordStore("Business",
                                            businessContacts);

        // Now, get a list of RMS stores and add their
        // names to the mainScr.
        recordStoreNames = RecordStore.listRecordStores();
        mainScr = new List("Select RMS Store", List.IMPLICIT,
                           recordStoreNames, null);
        addCommonCommands(mainScr, true);
    }

    /**
     * Called by the system to start our MIDlet.
     */
    protected void startApp() {
        myDisplay.setCurrent(mainScr);
    }

    /**
     * Called by the system to pause our MIDlet.
     * No actions required by our MIDLet.
     */
    protected void pauseApp() {}

    /**
     * Called by the system to end our MIDlet.
     * No actions required by our MIDLet.
     */
    protected void destroyApp(boolean unconditional) {}

    /**
     * Generate a screen with a sorted list of the contents
     * of the selected RMS store identified by index
     * If any errors encountered, display an alert and
     * redisplay the mainScr.
     *
     * index  an index into recordStoreNames
     */
    public void genDataScr(int index) {
        SimpleComparator rc;
        RecordEnumeration re;
        RecordStore rs;
        dataScr = null;
        byte record[];

        try {
            rs = RecordStore.openRecordStore(
                                recordStoreNames[index], false);
        } catch (RecordStoreException e) {
            doAlert("Could not open " + recordStoreNames[index]);
            return;
        }

        // Create an enumeration that sorts by last name
        rc = new SimpleComparator(
                     SimpleComparator.SORT_BY_LAST_NAME);
        try {
            re = rs.enumerateRecords(null, rc, false);
        } catch (RecordStoreNotOpenException e) {
            doAlert("Could not create enumeration: " + e);
            return;
        }

        // Create a screen and append the contents of the
        // selected RMS store.
        dataScr = new List(recordStoreNames[index] + " Data",
                           List.IMPLICIT);
        addCommonCommands(dataScr, false);

        try {
            while (re.hasNextElement()) {
                byte[] b = re.nextRecord();
                dataScr.append(SimpleRecord.getFirstName(b) +
                               " " + SimpleRecord.getLastName(b),
                               null);
            }
        } catch (Exception e) {
            doAlert("Could not build list: " + e);
            dataScr = null;
        } finally {
            try {
                rs.closeRecordStore();
            } catch (RecordStoreException e) {}
        }
    }

    /**
     * Generate a screen that shows some of the details
     * of the selected RMS store.
     *
     * RMS store information displayed:
     * - name
     * - number of records
     * - size, in bytes
     * - available size, in bytes
     * - version number
     *
     * index  an index into recordStoreNames
     */
    public void genDetailScr(int index) {
        RecordStore rs;
        detailScr = null;

        try {
            rs = RecordStore.openRecordStore(
                                        recordStoreNames[index],
                                        false);
        } catch (Exception e) {
            doAlert("Could not open " + recordStoreNames[index]);
            return;
        }

        detailScr = new List(recordStoreNames[index] + " Details",
                             List.IMPLICIT);
        addCommonCommands(detailScr, false);


        try {
            detailScr.append("Name: "  + rs.getName(), null);
            detailScr.append("# recs: " +
                             rs.getNumRecords(), null);
            detailScr.append("Size: " + rs.getSize(), null);
            detailScr.append("Avail: " + 
                             rs.getSizeAvailable(),null);
            detailScr.append("Version: " +
                             rs.getVersion(), null);
        } catch (Exception e) {
            detailScr = null;
            doAlert("Failed to retrieve data");
            return;
        } finally {
            try {
                rs.closeRecordStore();
            } catch (RecordStoreException e) {}
        }
    }

    /***
     * Respond to command selections.
     * Commands are:
     * EXIT: if selected, then exit
             (see RMSMIDlet, doExit)
     * OK:   if selected, interpreted in the context of
     *       the current screen.
     *
     * This method implements a state machine that drives
     * the MIDlet from one state (screen) to the next.
     */
    public void commandAction(Command c,
                              Displayable d) {

        // Every screen has an EXIT command.
        // Handle this consistently for all screens.
        if (c == CMD_EXIT) {
            doExit();
            return;
        }

        // switch based on screen.
        if (d == mainScr) {

            // main screen: two commands to handle. If
            // OK was selected, then generate the dataScr
            // and make it active. If DETAILS was selected,
            // generate the detailScr and make it active.
            if ((c == List.SELECT_COMMAND) || (c == CMD_OK)) {
                genDataScr(mainScr.getSelectedIndex());
                myDisplay.setCurrent(dataScr);
            } else if (c == CMD_DETAILS) {
                genDetailScr(mainScr.getSelectedIndex());
                myDisplay.setCurrent(detailScr);
            }

        } else if (d == detailScr) {

            // If OK selected, go back to mainScr
            if (c == CMD_OK) {
                myDisplay.setCurrent(mainScr);
            }

        } else if (d == dataScr) {

            // If OK selected, go back to mainScr
            if (c == CMD_OK) {
                myDisplay.setCurrent(mainScr);
            }

        }
    }
}

/*
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 */



/**
 * Static helper class that creates a record
 * store from data in an array.
 */
class CreateAddressBook {

    // Don't allow this class to be instantiated
    private CreateAddressBook() {}
    /**
     * Helper method that creates a record
     * store from data in an array.
     * Returns:
     *  true      if RMS store was created
     *  false     otherwise
     *  name      the name of the record store to create
     *  seedData  an array w/ data to seed record store
     */
    static boolean createRecordStore(String name,
                                     String[] seedData) {
        RecordStore recordStore;
        boolean ret = false;
        // Delete any previous record store with same name.
        // Silently ignore failure.
        try {
            RecordStore.deleteRecordStore(name);
        } catch (Exception rse) {}

        // Create new RMS store. If we fail, return false.
        try {
            recordStore = RecordStore.openRecordStore(name, true);
        } catch (RecordStoreException rse) {
            return ret;
        }

        ret = true; // assume success

        // Now, populate the record store with the seed data
        for (int i = 0; i < seedData.length; i += 3) {
            byte[] record = SimpleRecord.createRecord(seedData[i],
                                                      seedData[i+1],
                                                      seedData[i+2]);

            try {
                recordStore.addRecord(record, 0, record.length);
            } catch (RecordStoreException rse) {
                ret = false;
                break;
            }
        }

        // Get here when adds are complete, or an error occured.
        // In any case, close the record store. We shouldn't
        // have a failure, so silently ignore any exceptions.
        try {
            recordStore.closeRecordStore();
        } catch (RecordStoreException rsne) {}

        return ret;
    }
}

/*
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 */


/**
 * This class implements the RecordComparator interface.
 * It works on the records created by SimpleRecord.
 * It sorts on either first name or last name.
 */
class SimpleComparator implements RecordComparator {

    /**
     * Sorting values (sort by first or last name)
     */
    public final static int SORT_BY_FIRST_NAME = 1;
    public final static int SORT_BY_LAST_NAME = 2;

    /**
     * Sort order.  Set by constructor.
     */
    private int sortOrder = -1;

    /**
     * Public constructor: sets the sort order to be
     * used for this instantiation.
     *
     * Sanitize s: if it is not one of the
     * valid sort codes, set it to SORT_BY_LAST_NAME
     * silently.
     *  s  the desired sort order
     */
    SimpleComparator(int s) {
        switch (s) {
        case SORT_BY_FIRST_NAME:
        case SORT_BY_LAST_NAME:
            this.sortOrder = s;
            break;
        default:
            this.sortOrder = SORT_BY_LAST_NAME;
            break;
        }
    }

    /**
     * This is the compare method. It takes two
     * records, and depending on the sort order
     * extracts and lexicographically compares the
     * subfields as two Strings.
     *
     *  r1  First record to compare
     *  r2  Second record to compare
     * return one of the following:
     * 
     * RecordComparator.PRECEDES
     *     if r1 is lexicographically less than r2
     * RecordComparator.FOLLOWS
     *     if r1 is lexicographically greater than r2
     * RecordComparator.EQUIVALENT
     *     if r1 and r2 are lexicographically equivalent
     */
    public int compare(byte[] r1,
                       byte[] r2) {

        String n1 = null;
        String n2 = null;

        // Based on sortOrder, extract the correct fields
        // from the record and convert them to lower case
        // so that we can perform a case-insensitive compare.
        if (sortOrder == SORT_BY_FIRST_NAME) {
            n1 = SimpleRecord.getFirstName(r1).toLowerCase();
            n2 = SimpleRecord.getFirstName(r2).toLowerCase();
        } else if (sortOrder == SORT_BY_LAST_NAME) {
            n1 = SimpleRecord.getLastName(r1).toLowerCase();
            n2 = SimpleRecord.getLastName(r2).toLowerCase();
        }

        int n = n1.compareTo(n2);
        if (n < 0) {
            return RecordComparator.PRECEDES;
        }
        if (n > 0) {
            return RecordComparator.FOLLOWS;
        }

        return RecordComparator.EQUIVALENT;
    }
}

/*
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 */


/**
 * This class provides static methods that allow us
 * to hide the format of a record.
 * N.B. no synchronized access is provided
 */
final class SimpleRecord {

    private final static int FIRST_NAME_INDEX = 0;
    private final static int LAST_NAME_INDEX = 20;
  private final static int FIELD_LEN = 20;
    private final static int PHONE_INDEX = 40;
    private final static int MAX_REC_LEN = 60;

    private static StringBuffer recBuf =
        new StringBuffer(MAX_REC_LEN);

    // Don't let anyone instantiate this class
    private SimpleRecord() {}

    // Clear internal buffer
    private static void clearBuf() {
        for (int i = 0; i < MAX_REC_LEN; i++) {
            recBuf.insert(i, ' ');
        }
        recBuf.setLength(MAX_REC_LEN);
    }

    /**
     * Takes component parts and return a record suitable
     * for our address book.
     *
     *  return  byte[] the newly created record
     *  first   record field: first name
     *  last    record field: last name
     *  num     record field: phone number
     */
    public static byte[] createRecord(String first,
                                      String last,
                                      String num) {
        clearBuf();
        recBuf.insert(FIRST_NAME_INDEX, first);
        recBuf.insert(LAST_NAME_INDEX, last);
        recBuf.insert(PHONE_INDEX, num);
        recBuf.setLength(MAX_REC_LEN);
        return recBuf.toString().getBytes();
    }

    /**
     * Extracts the first name field from a record.
     *  return  String contains the first name field
     *  b       the record to parse
     */
    public static String getFirstName(byte[] b) {
        return new String(b, FIRST_NAME_INDEX, FIELD_LEN).trim();
    }

    /**
     * Extracts the last name field from a record.
     *  return  String contains the last name field
     *  b       the record to parse
     */
    public static String getLastName(byte[] b) {
        return new String(b, LAST_NAME_INDEX, FIELD_LEN).trim();
    }

    /**
     * Extracts the phone number field from a record.
     *  return  String contains the phone number field
     *  b       the record to parse
     */
    public static String getPhoneNum(byte[] b) {
        return new String(b, PHONE_INDEX, FIELD_LEN).trim();
    }
}
