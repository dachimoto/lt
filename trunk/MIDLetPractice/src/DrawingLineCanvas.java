import java.io.IOException;
import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.AlertType;
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.midlet.MIDlet;
import java.util.Vector;

public class DrawingLineCanvas extends Canvas {
	public MIDlet m_midlet;
	Display display;
	Graphics m_Graphic;
	public Vector arrFen;
	private String _Fen = "";
	private String m_sFirstPlayer = "";
	private String m_sSecondPlayer = "";
	private String m_sEvent = "";
	private String m_sDate = "";
	private String m_sResult = "";
	private int m_iCurPos = 0; 
	public String getFen(){
		return _Fen;
	}
	
	public void setFirstPlayer(String sFirstPlayer){
		m_sFirstPlayer = sFirstPlayer;
	}
	
	public void setSecondPlayer(String sSecondPlayer){		
		m_sSecondPlayer = sSecondPlayer;
	}
	
	public void setEvent(String sEvent){
		m_sEvent = sEvent;
	}
	
	public void setDate(String sDate){
		m_sDate = sDate;
	}
	
	public void setResult(String sResult){
		m_sResult = sResult;
	}	
	 
    protected void paint(Graphics g) {
        try {
        	m_Graphic = g;        	
        	String sFen = (String)arrFen.elementAt(m_iCurPos);       	        	
        	InitBoard(sFen);        	
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
	protected void keyPressed(int keyCode) {
        switch(keyCode) {
              case -1://UP
            	m_iCurPos = 0;
            	this.repaint();
            	break;
              case -2://Down
            	  m_iCurPos = arrFen.size()-1;
            	  this.repaint();            	  
            	  break;                
              case -4://Right
            	  if (m_iCurPos<arrFen.size()-1){
	            	  m_iCurPos++;
	            	  this.repaint();
            	  }
                  break;
              case -3://Left
            	  if (m_iCurPos>0){
	            	  m_iCurPos--;
	            	  this.repaint();
            	  }
            	  break;
              case Canvas.FIRE:                   
                  break;
              case 55://A		                    	  
            	  break;
              case 57://B
            	  break;
              case 42://C
            	  break;
              case 35://D
            	  break;
          }                  
  }    
    
    private void InitBoard(String sFen){
    	try{   		
    		m_Graphic.setColor(255,255, 255);
    		m_Graphic.fillRect(0,0,this.getWidth(),this.getHeight());   		
    		//System.out.println("Font size: " + Integer.toString(Font.SIZE_SMALL));
    		Font f = Font.getFont(Font.FACE_PROPORTIONAL, Font.STYLE_PLAIN, Font.SIZE_SMALL);
    		m_Graphic.setFont(f);
    		m_Graphic.setColor(255,0,0);   		
    		m_Graphic.drawString(m_sFirstPlayer,220, 0, Graphics.TOP|Graphics.LEFT);
    		m_Graphic.setColor(0, 0, 255);
    		m_Graphic.drawString(m_sSecondPlayer,220, 24, Graphics.TOP|Graphics.LEFT);
    		m_Graphic.setColor(0, 0, 0);  
    		m_Graphic.drawString("Event:",220, 48, Graphics.TOP|Graphics.LEFT);
    		m_Graphic.drawString(m_sEvent,220, 72, Graphics.TOP|Graphics.LEFT);   		    		
    		m_Graphic.drawString(m_sDate,220, 96, Graphics.TOP|Graphics.LEFT);
    		m_Graphic.drawString("__________",220, 120, Graphics.TOP|Graphics.LEFT);
    		String sResult = "";
    		if (m_sResult.equals("W")){
    			sResult = "Red won";
    		}
    		else if (m_sResult.equals("D")){
    			sResult = "Draw";
    		}
    		else {
    			sResult = "Blue won";
    		}
    		m_Graphic.drawString(sResult,220, 144, Graphics.TOP|Graphics.LEFT);
    		
        	Image imgBoard = Image.createImage("/boardline3.png");
        	m_Graphic.drawImage(imgBoard,0, 0, 0);
    		int i = 0;
    		String sTmp = "";
    		int iDist = 24;
    		System.out.println(sFen);
    		Image img;
    		for (i=0;i<sFen.length();i++){
    			sTmp = sFen.substring(i,i+1);    
    			sTmp = sTmp.replace('h', 'n').replace('H', 'N');
    			if (!sTmp.equals("0")){    				    				
    				String sImg = "";    				    				
    				if (sTmp.equals(sTmp.toUpperCase())){
    					//sImg = "/images/mr"+sTmp.toLowerCase()+".png";   					
    					sImg = "/mr"+sTmp.toLowerCase()+".png";
    					img = Image.createImage(sImg);
    				}
    				else{
    					//sImg = "/images/mb"+sTmp.toLowerCase()+".png";   					
    					sImg = "/mb"+sTmp.toLowerCase()+".png";
    					img = Image.createImage(sImg); 
    				}   	        	
    	        	int x = i%9*iDist;    	        	
    	        	int y = i/9*iDist;
    	        	m_Graphic.drawImage(img, x, y, 0);
    	        	img = null;    				
    			}    			
    		}    		
    	}
    	catch(IOException ex){    		
    		System.out.println("Error " + ex.toString() + " " + ex.getMessage());
    	}
    }   
}