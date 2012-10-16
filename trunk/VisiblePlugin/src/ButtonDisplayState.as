// ActionScript file
package {
	 import flash.display.Shape;
	public class ButtonDisplayState extends Shape {
	    private var bgColor:uint;
	    private var size:uint;
	    private var xShape:Number;
	    private var yShape:Number;
	    private var widthShape:Number;
	    private var heightShape:Number;
	    private var radiusShape:Number;	    	    	    	    
	
	    public function ButtonDisplayState(bgColor:uint,x:Number,y:Number,width:Number,height:Number,radius:Number) {
	        this.bgColor = bgColor;
	        //this.size    = size;
	        draw(x,y,width,height,radius);
	    }
 
	    private function draw(x:Number,y:Number,width:Number,height:Number,radius:Number):void {
	        graphics.beginFill(bgColor);
	        
	       // graphics.drawRoundRectComplex(370,290,90,20,5,5,5,5);
	        graphics.drawRoundRectComplex(x,y,width,height,radius,radius,radius,radius);
	        graphics.endFill();
	    }
	}	
}