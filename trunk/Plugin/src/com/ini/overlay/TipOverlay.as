// Thanh
package com.ini.overlay
{
	import com.ini.ui.*;
	
	import flash.display.*;
	import flash.text.*;
	
	public class TipOverlay extends Sprite {
		private var bgColor:uint;
		private var tfTip:TextField;
		private var tfContent:TextField;
		private var tfSaleEnds:TextField;
		
		private var xLayout:Number;
		private var yLayout:Number;
		private var widthLayout:Number;
		private var heightLayout:Number;
		private var radius:Number;
		//private var movie:MovieClip ;
		private var isShow:Boolean						= false;
		private var _sTitle:String						= "";
		private var _sSaleEnd:String					= "";
		private var _layout:LayoutContainer;
		private static const HEIGHT_TEXTFIELD:Number	= 20;
		private static const _HEIGHT_OFFSET:Number		= 10; 
		private var _stage:Stage;
		
				
		public function TipOverlay(stage:Stage,bgColor:uint ,x:Number,y:Number,width:Number,height:Number,radius:Number) {
			//movie= new MovieClip();
			_stage = stage;			
	        this.bgColor = bgColor;
	        this.xLayout=x;
	        this.yLayout=y;
	        this.widthLayout=width;
	        this.heightLayout=height;
	        this.radius=radius;
	        this.isShow = false;
	        _layout=new LayoutContainer(this.bgColor,xLayout,yLayout,widthLayout,heightLayout,radius);
	        tfTip=new TextField();
	        tfContent=new TextField();
	        tfSaleEnds=new TextField();
	    }
	    
		public function setTextTitle(str:String):void{
			this._sTitle=str;
		}
		public function setTextSaleEnd(str:String):void{
			this._sSaleEnd=str;
		}
		public function setVisible(bVisible:Boolean):void{
			this.isShow = bVisible;
			if (bVisible){
				//_stage.addChild(movie);
				_stage.addChild(_layout);
				_stage.addChild(tfTip);
				_stage.addChild(tfContent);
				_stage.addChild(tfSaleEnds);
			}
			else{
				this._layout.clear();
				//this.movie.graphics.clear();
				//_stage.removeChild(movie);
				_stage.removeChild(_layout);
				_stage.removeChild(tfTip);
				_stage.removeChild(tfContent);
				_stage.removeChild(tfSaleEnds);								
			}
		}		 
		
		public function IsVisible():Boolean{
			return this.isShow;
		}
		
		public function setXY(x:Number,y:Number):void{
			this.xLayout = x;
			this.yLayout = y;
		}
		

	    public function drawItem():void {
	    	//////////////////////////////////////
	    	//									//
	    	//	TIP   | conten here				//
	    	//		  |							//
	    	//									//
	    	//////////////////////////////////////
					
	    	var xTempTip:Number=this.xLayout +_HEIGHT_OFFSET;
  			var txtFormatTitle:TextFormat = new TextFormat();
            txtFormatTitle.font = "Arial";
            txtFormatTitle.size = 25;
            txtFormatTitle.bold = true;
            
  			var txtFormatContent:TextFormat = new TextFormat();
            txtFormatContent.font = "Arial";
            txtFormatContent.size = 12;
            //format Sale Ends
  			var txtFormatSaleEnd:TextFormat = new TextFormat();
            txtFormatSaleEnd.font = "Arial";
            txtFormatSaleEnd.size = 12;
            txtFormatSaleEnd.bold = true;                                  
            	    	
	    	tfTip.textColor = 0xf6f6f6;
	    	tfTip.text="TIP"
      		tfTip.autoSize = TextFieldAutoSize.CENTER;
		    tfTip.setTextFormat(txtFormatTitle);
			tfTip.selectable = false;
      		tfTip.visible = true;
      		tfTip.x=xTempTip;
      		tfTip.y=this.yLayout +15;	          		
      		
      		var xLine:Number=xTempTip + tfTip.width +_HEIGHT_OFFSET;
      		var heightLine:Number=heightLayout/2;
      		var heightLOSaleEnd:Number=30;		
      		
			// Draw line TIP |
			_layout.setColor(0xffffff);
			_layout.setAnpha(1);
			_layout.draw(xLine,yLayout + _HEIGHT_OFFSET,2,heightLayout-heightLOSaleEnd-_HEIGHT_OFFSET*2,radius);
			    	
   	    	
   	    	tfContent.textColor = 0xf6f6f6;
	    	tfContent.text=this._sTitle;
	    	tfContent.multiline=true;
	    	tfContent.wordWrap=true;
		    tfContent.setTextFormat(txtFormatContent);
			tfContent.selectable = false;
      		tfContent.visible = true;
      		tfContent.width=(this.widthLayout+xLayout) -(xLine +15) ;
      		tfContent.x=xLine +10 ;
      		tfContent.y=this.yLayout +15;
      		


      		//display layout content
      		
      		var heightSpace:Number=2;
      		_layout.setColor(this.bgColor);
      		_layout.setAnpha(0.7);
      		_layout.draw(xLayout,yLayout, widthLayout, heightLayout-heightLOSaleEnd, radius);
      		//display layout sale end
      		_layout.draw(xLayout,yLayout+(heightLayout-heightLOSaleEnd)+heightSpace, widthLayout, heightLOSaleEnd, radius);
			//draw label SaleEnds    	    	
   	    	tfSaleEnds.textColor = 0xf6f6f6;
	    	tfSaleEnds.text=this._sSaleEnd.toUpperCase();
			tfSaleEnds.autoSize= TextFieldAutoSize.CENTER;
			tfSaleEnds.setTextFormat(txtFormatSaleEnd);
			tfSaleEnds.selectable = false;
      		tfSaleEnds.visible = true;
      		tfSaleEnds.height=HEIGHT_TEXTFIELD;
      		tfSaleEnds.x=(this.xLayout + (this.widthLayout/2))-  tfSaleEnds.width/2 ;
      		tfSaleEnds.y=yLayout+(heightLayout-heightLOSaleEnd) +heightSpace + (heightLOSaleEnd -HEIGHT_TEXTFIELD)/2 ;//this.yLayout + this.heightLayout - 20;
      		      		      		    		
      		
			_stage.addChild(_layout);
			_stage.addChild(tfTip);
			_stage.addChild(tfContent);
			_stage.addChild(tfSaleEnds);			
	    }	 	    
	}
}