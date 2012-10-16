import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.io.*;
import java.io.*;
 
public class FileViewer extends MIDlet implements CommandListener {
	private Display display; // Reference to Display object
	private TextBox tbViewer; // View file contents in a textbox
	private Command cmView; // Command to view file
	private Command cmExit; // Command to exit
	//private String url = "http://www.corej2me.com/midpbook_v1e1/scratch/fileViewer.hlp";
	//private String url = "http://languages.services.officelive.com/Documents/testMIDLet.txt";
	//private String url = "http://languages.services.officelive.com/Documents/EnViJa.html";
	//private String url =  "http://json-time.appspot.com/time.json?tz=US/Central";
	//private String url = "http://api.iknow.co.jp/items/matching/english.json?include_sentences=true&&language=en&translation_language=ja&page=1&per_page=1";
	//private String url = "http://spreadsheets.google.com/tq?tqx=out:txt&tq=select%20B%20where%20A%20%3D%201&key=0AjAyA-re6mTqcHdLM3ZuSnVBTmdfR3V0R0hpWDM5Rnc";
	private String url = "http://spreadsheets.google.com/tq?tqx=out:txt&tq=select%20A,B,C,D%20where%20U%3D1&key=0AjAyA-re6mTqdFZzWkN2RWRva2F4YVFHeWZjNlFrOVE";
 
	public FileViewer() {
		display = Display.getDisplay(this);
 
		// Define commands
		cmView = new Command("View", Command.SCREEN, 2);
		cmExit = new Command("Exit", Command.EXIT, 1);
 
		tbViewer = new TextBox("Viewer", "", 250, TextField.ANY);
		tbViewer.addCommand(cmView);
		tbViewer.addCommand(cmExit);
		tbViewer.setCommandListener(this);
	}
 
	public void startApp() {
		display.setCurrent(tbViewer);
	}
 
	private void viewFile() throws IOException {
		HttpConnection http = null;
		InputStream iStrm = null;
 
		try {
 
			http = (HttpConnection) Connector.open(url);
 
			// ----------------
			// Client Request
			// ----------------
			// 1) Send request method
			http.setRequestMethod(HttpConnection.GET);			
 
			// 2) Send header information (this header is optional)
			http.setRequestProperty("User-Agent","Profile/MIDP-1.0 Configuration/CLDC-1.0");
 
			// 3) Send body/data - No data for this request
 
			// ----------------
			// Server Response
			// ----------------
			// 1) Get status Line
			System.out.println("Msg: " + http.getResponseMessage());
			System.out.println("Code: " + http.getResponseCode());
 
			// 2) Get header information
			if (http.getResponseCode() == HttpConnection.HTTP_OK) {
				// 3) Get data (show the file contents)
				iStrm = http.openDataInputStream();
				
				StringBuffer sb = new StringBuffer();
				int ch = 0;
				for(int ccnt=0; ccnt < 2000; ccnt++) { // get the title.
					ch = iStrm.read();
				    if (ch == -1){
				      break;
				    }
				    sb.append((char)ch);
				}
				System.out.println(sb.toString());
				tbViewer.setString(sb.toString());
				
				/*
				int length = (int) http.getLength();
				System.out.println("Length:" + Integer.toString(length));
				if (length > 0) {
					byte serverData[] = new byte[length];
					iStrm.read(serverData);				
					String str =  new String(serverData);
					System.out.println(str);
					tbViewer.setString(str);
				}
				*/
			}
		} finally {
 
			if (iStrm != null)
				iStrm.close();
			if (http != null)
				http.close();
		}
	}
 
	public void pauseApp() {
	}
 
	public void destroyApp(boolean unconditional) {
	}
 
	public void commandAction(Command c, Displayable s) {
		if (c == cmView) {
			try {
				viewFile();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		} else if (c == cmExit) {
			destroyApp(false);
			notifyDestroyed();
		}
	}
}