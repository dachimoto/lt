
package com.ini.overlay{
	import com.ini.model.*;
	import com.ini.ui.*;
	import com.ini.utils.*;
	
	import flash.display.*;
	import flash.text.*;
	
	public class TitleOverlay extends Shape {
		private var _bgColor:uint;
		private var _bgColorAnpha:Number	= 0.7;
		
		private var _tfTitle:TextField;
		private var _tfHost:TextField;
		private var _tfSaleEnds:TextField;
				
		private var _xLayout:Number;
		private var _yLayout:Number;
		private var _pad:Number				= 10;
		private var _widthLayout:Number;
		private var _heightLayout:Number;
		private var _radius:Number;
		private var _height_Offset:Number	= 5;
		
		//private  var  _movie:MovieClip ;
		private var _isShow:Boolean=false;
		private var _sTitle:String			= "";
		private var _sHost:String			= "";				
		private var _sSaleEnd:String		= "";
		private var _layout:LayoutContainer;
		private var _stage:Stage;
						
		public function TitleOverlay(stage:Stage,bgColor:uint ,x:Number,y:Number,width:Number,height:Number,radius:Number) {
			//_movie= new MovieClip();
			_stage = stage;			
	        this._bgColor = bgColor;
	        this._xLayout=x;
	        this._yLayout=y;
	        this._widthLayout=width;
	        this._heightLayout=height;
	        this._radius=radius;
	        this._isShow = false;
	        _layout=new LayoutContainer(this._bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,radius);	        	       
	        _tfTitle=new TextField();
	        _tfHost=new TextField();
	        _tfSaleEnds=new TextField();	       
	    }
	    
	   
		public function setTextTitle(str:String):void{
			this._sTitle=str;
		}
		
		public function setTextHost(str:String):void{
			this._sHost=str;
		}
		
		public function setTitleInfo(info:Title):void{
			if(info == null) return;
			_sTitle = info.getTitle();
			_sHost = info.getHostName();
			_sSaleEnd = info.getSaleEnd();
		}
				
		public function setTextSaleEnd(str:String):void{
			this._sSaleEnd=str;
		}
		public function setVisible(bVisible:Boolean):void{
			
			this._isShow = bVisible;			

			if (bVisible){
				//_stage.addChild(_movie);
				_stage.addChild(_layout);						
				_stage.addChild(_tfTitle);
				_stage.addChild(_tfHost);
				_stage.addChild(_tfSaleEnds);				
			}
			else{
				this._layout.clear();
				//this._movie.graphics.clear();
				//_stage.removeChild(_movie);
				_stage.removeChild(_layout);						
				_stage.removeChild(_tfTitle);
				_stage.removeChild(_tfHost);
				_stage.removeChild(_tfSaleEnds);			
			}
		}		 
		
		public function IsVisible():Boolean{
			return this._isShow;
		}
		
		public function setXY(x:Number,y:Number):void{
			this._xLayout = x;
			this._yLayout = y;
		}
		
		public function getX():Number{
			return _xLayout;
		}
		public function getY():Number{
			return _yLayout;
		}		
			
		private var isDrawed:Boolean = false;
	    public function drawItem():void {
			//_movie.graphics.clear();	
	    	var xTempTip:Number=this._xLayout +_pad;
	    	
	    	var txtFormatTitle:TextFormat = new TextFormat();
            txtFormatTitle.font = "Arial";
            txtFormatTitle.align=TextFormatAlign.CENTER;
            txtFormatTitle.size = 12;
            txtFormatTitle.bold = true;
            		 			
            //format Sale Ends
  			var txtFormatSaleEnd:TextFormat = new TextFormat();
            txtFormatSaleEnd.font = "Arial";
            txtFormatSaleEnd.size = 12;
            txtFormatSaleEnd.bold = true;                              
            
            _tfTitle.text=this._sTitle.toUpperCase();	    	
            _tfTitle.textColor = 0xf6f6f6;
            _tfTitle.autoSize=TextFieldAutoSize.CENTER;
            _tfTitle.multiline=true;
            _tfTitle.wordWrap=true;
            _tfTitle.setTextFormat(txtFormatTitle);
            _tfTitle.selectable = false;
      		_tfTitle.visible = true;
      		_tfTitle.width=this._widthLayout - 2*this._pad;		    			
      		_tfTitle.x=this._xLayout + this._widthLayout/2  - _tfTitle.width/2;
      		  	_tfTitle.y=_yLayout +_pad;
      		
      		_tfHost.textColor = 0xf6f6f6;
	    	_tfHost.text="HOSTED BY " + this._sHost.toUpperCase();
	    	_tfHost.autoSize= TextFieldAutoSize.CENTER;
		    _tfHost.setTextFormat(txtFormatTitle);
			_tfHost.selectable = false;
      		_tfHost.visible = true;
      		_tfHost.x=this._xLayout + this._widthLayout/2  - _tfHost.width/2;
      		_tfHost.y=_yLayout +_pad + _tfTitle.height;	

	  	            	    	     		      				
			//draw SaleEnds   	    	
   	    	_tfSaleEnds.textColor = 0xf6f6f6;
	    	_tfSaleEnds.text=this._sSaleEnd.toUpperCase();
			_tfSaleEnds.autoSize= TextFieldAutoSize.CENTER;
			_tfSaleEnds.setTextFormat(txtFormatSaleEnd);
			_tfSaleEnds.selectable = false;
      		_tfSaleEnds.visible = true;
      		_tfSaleEnds.x=(this._xLayout + (this._widthLayout/2))-  _tfSaleEnds.width/2 ;
      		_tfSaleEnds.y=this._yLayout + this._heightLayout - 25;
      		
      		     		    
      		var startLayout1:Number =  	_yLayout + this._heightLayout - 30; 
      		_layout.setColor(this._bgColor);
      		_layout.setAnpha(this._bgColorAnpha);
      		_layout.draw(_xLayout,startLayout1, _widthLayout,_yLayout + this._heightLayout - startLayout1, _radius);//bg2/
      		
      		var hLayoutTemp:Number=this._tfHost.height + this._tfTitle.height + (this._pad*2) +_height_Offset;
      		var yLayoutTemp:Number=startLayout1-2-hLayoutTemp;
			//reset position Y control 
			_tfTitle.y=yLayoutTemp +_pad;
			_tfHost.y=yLayoutTemp +_pad + _tfTitle.height;	  
      		_layout.draw(this._xLayout,yLayoutTemp, this._widthLayout, hLayoutTemp, _radius);//bg1/
      		  			
			_stage.addChild(_layout);						
			_stage.addChild(_tfTitle);
			_stage.addChild(_tfHost);
			_stage.addChild(_tfSaleEnds);	
							
	    }	 	    
	}
}
