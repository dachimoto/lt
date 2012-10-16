// ActionScript file
package{
  import flash.display.SimpleButton;
  import flash.events.MouseEvent;	
  import flash.net.URLRequest;
  import flash.net.navigateToURL;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFormatAlign;
	  public class CustomSimpleButton extends SimpleButton {
	    private var upColor:uint   = 0xff6600;
	    private var overColor:uint = 0xff6600;
	    private var downColor:uint = 0xff6600;
	    private var size:uint      = 80;
		public function createLabel(colour:uint, btnText:String):TextField
		{
			var txt:TextField = new TextField();
			txt.width = 50;
			txt.height = 10;
			
			var navButton:TextFormat = new TextFormat();
			navButton.font = "Arial";
			
			navButton.color = colour;
			navButton.size = 10;
			navButton.align = TextFormatAlign.CENTER;
			
			txt.defaultTextFormat = navButton;
			txt.text = btnText;
			txt.selectable = false;
			
			return txt;
		}
	    public function CustomSimpleButton(x:Number,y:Number,width:Number,height:Number,radius:Number) {
	    	
	        downState      = new ButtonDisplayState(downColor,x,y,width,height,radius);
	        overState      = new ButtonDisplayState(overColor,x,y,width,height,radius);
	        upState        = new ButtonDisplayState(upColor,x,y,width,height,radius);
	       // hitTestState   = new ButtonDisplayState(upColor, size * 2);
	        //hitTestState.x = -(size / 4);
	        //hitTestState.y = hitTestState.x;
	        hitTestState   = new ButtonDisplayState(upColor, x,y,width,height,radius);
	        hitTestState.x = - x;	        
	        hitTestState.y = hitTestState.x;
	        useHandCursor  = true;
	    }
	}
}