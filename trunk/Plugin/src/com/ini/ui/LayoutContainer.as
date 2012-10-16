
package com.ini.ui{
	import flash.display.Shape;
	public class LayoutContainer extends Shape {

  		private var _bgColor:uint;
	    private var _size:uint;
	    private var _anpha:Number=0.7;
		
	    public function LayoutContainer(bgColor:uint ,x:Number,y:Number,width:Number,height:Number,radius:Number) {
	        this._bgColor = bgColor;	        
	    }	
	    
	    public function draw(x:Number,y:Number,width:Number,height:Number,radius:Number):void {	   
	        graphics.beginFill(_bgColor,_anpha);
	        graphics.drawRoundRectComplex(x,y,width,height,radius,radius,radius,radius);
	        graphics.endFill();
	    }	    
	    	        
	    public function setColor(color:uint):void{
	    	_bgColor = color;
	    }
	    
	    public function getColor():uint{
	    	return _bgColor;
	    }
	    
	     public function setAnpha(anpha:Number):void{
	    	_anpha = anpha;
	    }
	    
	    public function getAnpha():Number{
	    	return _anpha;
	    }
	    	    
	    public function clear():void{
	    	graphics.clear();
	    }
	}
}
