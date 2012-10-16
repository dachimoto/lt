// ActionScript file
package{
	import flash.display.Shape;
	public class LayoutContainer extends Shape {

  		private var bgColor:uint;
	    private var size:uint;
		
	    public function LayoutContainer(bgColor:uint ,x:Number,y:Number,width:Number,height:Number,radius:Number) {
	        this.bgColor = bgColor;
	        draw(x,y,width,height,radius);
	    }	
	    private function draw(x:Number,y:Number,width:Number,height:Number,radius:Number):void {
	        graphics.beginFill(bgColor,0.5);
	        //graphics.drawRoundRectComplex(170,260,300,80,5,5,5,5);
	        graphics.drawRoundRectComplex(x,y,width,height,radius,radius,radius,radius);
	        graphics.endFill();
	    }	    
	}
}