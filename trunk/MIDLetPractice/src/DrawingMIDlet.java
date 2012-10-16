import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.midlet.MIDlet;
import javax.microedition.lcdui.CommandListener;

import java.io.IOException;
import java.io.InputStream;
import java.util.Random;
import java.util.Vector;

public class DrawingMIDlet extends MIDlet implements CommandListener
{
	//Canvas for drawing line
	private DrawingLineCanvas canvas;
	private Command cmNew;
	private Command cmExit;
	private String m_sMoves = "";
	private String m_sFirstPlayer = "";
	private String m_sSecondPlayer = "";
	private String m_sDate = "";
	private String m_sEvent = "";
	private String m_sResult = "";
	Display display;

	public DrawingMIDlet() throws IOException{		
		setupCanvas();
	}

	public void destroyApp(boolean unconditional) {
	}

	protected void pauseApp() {

	}

	private void setupCanvas() throws IOException{		
	    canvas = new DrawingLineCanvas();
	    canvas.m_midlet = this;
	    canvas.setTitle("Drawing the line");
		cmNew = new Command("New", Command.SCREEN, 1);		
		cmExit = new Command("Exit", Command.EXIT, 1); 
		canvas.addCommand(cmNew);
		canvas.addCommand(cmExit);		
		canvas.setCommandListener(this);	
		Vector arrFen = new Vector();
		//m_sMoves = "C2z5h8x7H2x3r9z8P7x1p7x1H8x7h2x3R1x1e3x5R1z4c8x2H7x6p3x1H6x7p3x1R4z7c2y2R7x3c2z3C8z7r1z2P3x1r2x4P3x1r2z7R9z8e5x3R8x6c8y1R7z2h7x8R2z6c3x3C7x4r7x3C7z2r8x3R6x3h8x6R6z7r7x2A6x5h6x5E7x5r7y3R8y3e7x5R7y1p1x1P1x1r7z9R7z9r9y1R9y1r9x2E5x3r9y1R9y1p5x1R9z6a6x5P9x1p9x1P9x1r8x3R6x2p5x1P9z8p9x1P8z7p9z8R8x4r8z5R8z5p5z6R5y4r9z5E3y1p8x1E1y3r5z3P7x1p6x1R6z3p8x1R3z2p8z7R2z3p6z7E3x5pxx1P7z6pxz6R3z4p7z6A5y6pxz7A4x5p6z5R4z5p5z4R5z3p7z6R3z4p6z7R4z3p7z6R3z4p6z7K5z4r3y2R4z3r3z6K4z5p7z6R3x3a5y6R3y6r6z8A5y4p4x1R3z6p4x1R6z4p6z7R4z3";
		newGame();
		int i=0;
		int j=0;
		arrFen.addElement("rheakaehr0000000000c00000c0p0p0p0p0p000000000000000000P0P0P0P0P0C00000C0000000000RHEAKAEHR");
		while (i<m_sMoves.length()){
			String sTmp = m_sMoves.substring(i,i+4);
			if (i%4!=0){
				sTmp = sTmp.toLowerCase();
			}
			//System.out.println((String)arrFen.elementAt(j));
			//System.out.println(sTmp);
			int[] iArr = new int[2];
			arrFen.insertElementAt(GetNextFen(sTmp,(String)arrFen.elementAt(j),iArr),j+1);
			if (iArr!=null){
				System.out.println(Integer.toString(iArr[0]));
			}
			i=i+4;
			j++;
		}	
		canvas.arrFen = arrFen;
		canvas.setFirstPlayer(m_sFirstPlayer);
		canvas.setSecondPlayer(m_sSecondPlayer);
		canvas.setEvent(m_sEvent);
		canvas.setDate(m_sDate);
		canvas.setResult(m_sResult);
	}

	public void startApp() {
		display=Display.getDisplay(this);		
	    display.setCurrent(canvas);    
	}
	
	public void commandAction(Command c, Displayable s) {
		if (c == cmNew) {
			try {
				setupCanvas();
				canvas.repaint();
				display.setCurrent(canvas);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		else if (c == cmExit) {
			destroyApp(false);
			notifyDestroyed();
		}
	}
	
    private String GetNextFen(String sMove, String sFen, int[] objRef)
    {
    	String sCurFen = sFen;
    	String sPiece = sMove.substring(0,1);
    	String sSource = sMove.substring(1,2);
    	String sType = sMove.substring(2,3);
    	int iTarget = Integer.parseInt(sMove.substring(3,4));
    	int iPos = -1;
    	int iSource = -1;
    	int iRow=-1;            	
    	//sCurFen = replace(sCurFen,"/", "");
    	if (sPiece.equals(sPiece.toUpperCase())){
    		//sCurFen = sCurFen.split("").reverse().join("");
    		char[] arr = sCurFen.toCharArray();
    		sCurFen = "";
    		for (int i=arr.length-1;i>-1;i--){
    			sCurFen += arr[i];
    		}
    	}
    	
    	if (sType.equals("y") && (sPiece.toUpperCase().equals("A") || sPiece.toUpperCase().equals("E"))){
    		iPos = sCurFen.indexOf(sPiece,9);	
    	}
    	else{
    		iPos = sCurFen.indexOf(sPiece);	
    	}
    	
    	while (iPos>-1){    		
    		if (isNumeric(sSource)==true){
    			iSource = Integer.parseInt(sSource)-1;
    			iRow = iPos/9;            			
    			if (iPos%9 == iSource){
    				sCurFen = sCurFen.substring(0,iPos) + "0" + sCurFen.substring(iPos+1);    				
    				objRef[0] = iPos;
    				break;
    			}
    		}
    		else{
    			if (!sPiece.toUpperCase().equals("P")){
    				if (sSource.equals("x")){
    					iPos = sCurFen.indexOf(sPiece,iPos+1);
    				}
    				iSource = iPos%9;
    				iRow = iPos/9;
    				sCurFen = sCurFen.substring(0,iPos) + "0" + sCurFen.substring(iPos+1);
    				objRef[0] = iPos;
    				break;            				
    			}
    			else{//Piece is Pawn
    				int[] arrPos = new int[5];
    				arrPos[0] = iPos;
    				arrPos[1] = -1;
    				arrPos[2] = -1;
    				arrPos[3] = -1;
    				arrPos[4] = -1;
    				arrPos[1] = sCurFen.indexOf(sPiece,arrPos[0]+1);	
    				if (arrPos[1] > -1){
    					arrPos[2] = sCurFen.indexOf(sPiece,arrPos[1]+1);
    					if (arrPos[2]>-1){
    						arrPos[3] = sCurFen.indexOf(sPiece,arrPos[2]+1);
    						if (arrPos[3]>-1){
    							arrPos[4] = sCurFen.indexOf(sPiece,arrPos[3]+1);
    						}
    					}
    				}
    				       				
    				String sPawns = "~-1~";       				       				
    				for (int i=0;i<5;i++){
    					for (int j=i+1;j<5;j++){
    						if (arrPos[i]>-1 && arrPos[j]>-1 && Math.abs(arrPos[i]-arrPos[j])%9==0){
    							if (sPawns.indexOf("~" + Integer.toString(arrPos[i]) + "~")==-1){
    								sPawns += ",~" + Integer.toString(arrPos[i]) + "~";
    							}
    							if (sPawns.indexOf("~" + Integer.toString(arrPos[j]) + "~") == -1){
    								sPawns += ",~" + Integer.toString(arrPos[j]) + "~";
    							}
    						}
    					}
    				}
    				sPawns = replace(sPawns,"~-1~,","");    				
    				String[] arr = split(sPawns,",");         			
    				if (sSource.equals("x")){
    					iPos = Integer.parseInt(replace(arr[arr.length-1],"~",""));        					         							
    				}
    				else if (sSource.equals("y")){
    					iPos = Integer.parseInt(replace(arr[0],"~",""));
    				}
    				iSource = iPos%9;
    				iRow = iPos/9;
    				sCurFen = sCurFen.substring(0,iPos) + "0" + sCurFen.substring(iPos+1);
    				objRef[0] = iPos;
    				break;
    			}
    		}
    		iPos = sCurFen.indexOf(sPiece,iPos+1);        		
    	}//end of while
    	
    	if (sType.equals("z")){
    		iTarget--;
    		sCurFen = sCurFen.substring(0, iRow*9 + iTarget) + sPiece + sCurFen.substring(iRow*9 + iTarget + 1);   		
    		objRef[1] = iRow*9 + iTarget;
    	}
    	else{
    		if (sPiece.toUpperCase().equals("K") ||sPiece.toUpperCase().equals("R")||sPiece.toUpperCase().equals("C")||sPiece.toUpperCase().equals("P")){
    			if (sType.equals("x")){
    				iRow = iRow + iTarget;
    			}
    			else{
    				iRow = iRow - iTarget;
    			}
    			sCurFen = sCurFen.substring(0, iRow*9 + iSource) + sPiece + sCurFen.substring(iRow*9 + iSource + 1);    			
    			objRef[1] = iRow*9+iSource;
    		}
    		else if (sPiece.toUpperCase().equals("H")){
    			iTarget--;
    			if (Math.abs(iTarget-iSource)==1){
    				if (sType.equals("x")){
    					iRow = iRow + 2;
    				}
    				else{
    					iRow = iRow - 2;
    				}
    			} 
    			else{
    				if (sType.equals("x")){
    					iRow = iRow + 1;
    				}
    				else{
    					iRow = iRow - 1;
    				}            				
    			}
    			sCurFen = sCurFen.substring(0, iRow*9 + iTarget) + sPiece + sCurFen.substring(iRow*9 + iTarget + 1);    			
    			objRef[1] = iRow*9+iTarget;
    		}
    		else if (sPiece.toUpperCase().equals("E")){
    			iTarget--;
    			if (sType.equals("x")){
    				iRow = iRow + 2;
    			}
    			else{
    				iRow = iRow-2;
    			}
    			sCurFen = sCurFen.substring(0, iRow*9 + iTarget) + sPiece + sCurFen.substring(iRow*9 + iTarget + 1);
    			objRef[1] = iRow*9+iTarget;
    		}
    		else if (sPiece.toUpperCase().equals("A")){
    			iTarget--;
    			if (sType.equals("x")){
    				iRow = iRow + 1;
    			}
    			else{
    				iRow = iRow-1;
    			}
    			sCurFen = sCurFen.substring(0, iRow*9 + iTarget) + sPiece + sCurFen.substring(iRow*9 + iTarget + 1);
    			objRef[1] = iRow*9+iTarget;
    		}
    	}
    	if (sPiece.toUpperCase().equals(sPiece)){
    		//sCurFen = sCurFen.split("").reverse().join("");
    		char[] arr = sCurFen.toCharArray();
    		sCurFen = "";
    		for (int i = arr.length-1;i>-1;i--){
    			sCurFen += arr[i];
    		}
    		objRef[0] = 89 - objRef[0];
    		objRef[1] = 89 - objRef[1];    		
    	}
    	//Alert.show(sCurFen);
    	/*
    	sCurFen = sCurFen.substring(0,9) + "/" +
    			sCurFen.substring(9,9) + "/" +
    			sCurFen.substring(18,27) + "/" +
    			sCurFen.substring(27,36) + "/" +
    			sCurFen.substring(36,45) + "/" +
    			sCurFen.substring(45,54) + "/" +
    			sCurFen.substring(54,63) + "/" +
    			sCurFen.substring(63,72) + "/" +
    			sCurFen.substring(72,81) + "/" +
    			sCurFen.substring(81,90);
    	*/		
    	return sCurFen;
    }
    
    private String replace(String _text, String _searchStr, String _replacementStr) {      
        StringBuffer sb = new StringBuffer();

        // Search for search
        int searchStringPos = _text.indexOf(_searchStr);
        int startPos = 0;
        int searchStringLength = _searchStr.length();

        // Iterate to add string
        while (searchStringPos != -1) {
            sb.append(_text.substring(startPos, searchStringPos)).append(_replacementStr);
            startPos = searchStringPos + searchStringLength;
            searchStringPos = _text.indexOf(_searchStr, startPos);
        }

        // Create string
        sb.append(_text.substring(startPos,_text.length()));

        return sb.toString();
    } 
    
    private String[] split(String original,String separator) {
        Vector nodes = new Vector();
        // Parse nodes into vector
        int index = original.indexOf(separator);
        while(index >= 0) {
            nodes.addElement( original.substring(0, index) );
            original = original.substring(index+separator.length());
            index = original.indexOf(separator);
        }
        // Get the last node
        nodes.addElement( original );

         // Create split string array
        String[] result = new String[ nodes.size() ];
        if( nodes.size() > 0 ) {
            for(int loop = 0; loop < nodes.size(); loop++)
            {
                result[loop] = (String)nodes.elementAt(loop);
                //System.out.println(result[loop]);
            }

        }
       return result;
    }
    
    private boolean isNumeric(String sNumber){
    	try {
    		Integer.parseInt(sNumber);
    		return true;
    	}
    	catch(Exception ex){
    		return false;
    	}    	
    }
    
	private void newGame()throws IOException{
		HttpConnection http = null;
		InputStream iStrm = null;
		Random rnd = new Random();
		int iGame = rnd.nextInt(985);
		String url = "http://spreadsheets.google.com/tq?tqx=out:txt&key=0AjAyA-re6mTqdGp4RHh6MmFLOGoybTMyS1RqT1Jsb1E&hl&tq=select%20A,B,C,K,I,D%20where%20U%3D" + Integer.toString(iGame);
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
				String sRet = sb.toString();
				int iPos = sRet.indexOf("rows:");
				sRet = sRet.substring(iPos);
				iPos = sRet.indexOf("{v:'");
				int iPos2 = 0;
				if (iPos > -1){
					iPos2 = sRet.indexOf("'", iPos+4);
					m_sFirstPlayer = sRet.substring(iPos+4, iPos2);
					//System.out.println(m_sFirstPlayer);
					
					iPos = sRet.indexOf("{v:'", iPos2);
					if (iPos>-1){
						iPos2 = sRet.indexOf("'", iPos+4);
						m_sSecondPlayer = sRet.substring(iPos+4, iPos2);
						//System.out.println(m_sSecondPlayer);
						
						iPos = sRet.indexOf("{v:'", iPos2);
						if (iPos>-1){
							iPos2 = sRet.indexOf("'", iPos+4);
							m_sMoves = sRet.substring(iPos+4, iPos2);
							//System.out.println(m_sMoves);
							
							iPos = sRet.indexOf("{v:'", iPos2);
							if (iPos>-1){
								iPos2 = sRet.indexOf("'", iPos+4);
								if (iPos2>0){
									m_sEvent = sRet.substring(iPos+4, iPos2);
									//System.out.println(m_sEvent);
								}
								
								iPos = sRet.indexOf("{v:'", iPos2);
								if (iPos>-1){									
									iPos2 = sRet.indexOf("'", iPos+4);
									m_sResult = sRet.substring(iPos+4, iPos2);
									//System.out.println(m_sEvent);
									
									iPos = sRet.indexOf("f:'", iPos2);
									if (iPos > -1){
										iPos2 = sRet.indexOf("'", iPos+3);										
										m_sDate = sRet.substring(iPos+3, iPos2);
										//System.out.println(m_sDate);									
									}
								}
							}
						}
					}
				}
				//System.out.println(sRet);
			}
		} finally {
 
			if (iStrm != null)
				iStrm.close();
			if (http != null)
				http.close();
		}
	}    
}