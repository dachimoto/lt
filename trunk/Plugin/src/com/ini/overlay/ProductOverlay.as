
package com.ini.overlay{
	import com.ini.model.*;
	import com.ini.ui.*;
	import com.ini.utils.*;
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.*;
	
	public class ProductOverlay extends Shape {
		private var _bgColor:uint;
		private var _bgColorAnpha:Number				= 0.7;
		private var _bgColorDetails:uint				= 0xFFA500;
		private var _bgColorDetailsAnpha:Number			= 1;
		
		private var _tfBrand:TextField;
		private var _tfPrice:TextField;	
		private var _tfSaleOffPrice:TextField;
		
		//private var _tfDetailView:TextField;
		// create button Detail
		private var myGUI:GUI; 										
		private var _btnDetail:SimpleButton;
		private static const _HEIGHT_TEXTFIELD:Number	= 20;  // height of textfield
		private static const _WIDTH_BUTTON:Number		= 80;  // height of button "Shop now"		
				
		private var _tfTitle:TextField;
		private var tfSaleEnds:TextField;
		
		
		private var _xLayout:Number;
		private var _yLayout:Number;
		private var _pad:Number=10;
		private var _widthLayout:Number;
		private var _heightLayout:Number;
		private var _radius:Number;
		//private  var  _movie:MovieClip ;
		private var _isShow:Boolean						= false;
		private var _sTitle:String						= "";
		private var _sBrand:String						= "";
		private var _sPrice:String						= "";
		private var _sSalePrice:String					= "";
		
		private var _sSaleEnd:String					= "";
		private var _layout:LayoutContainer;
		private var _stage:Stage;
		private var _url:String							= "";
		private static const  _BG_COLOR_BUTTON:uint		= 0xff6600; // background color button
								
		public function ProductOverlay(stage:Stage,bgColor:uint , bgColorDetails:uint, x:Number,y:Number,width:Number,height:Number,radius:Number) {
			_stage = stage;			
	        this._bgColor = bgColor;
	        this._bgColorDetails=bgColorDetails;
	        this._xLayout=x;
	        this._yLayout=y;
	        this._widthLayout=width;
	        this._heightLayout=height;
	        this._radius=radius;
	        this._isShow = false;
	        _layout=new LayoutContainer(this._bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,radius);
	        
	        _tfBrand=new TextField();
	        _tfPrice=new TextField();
	        _tfSaleOffPrice=new TextField();	   
	        _tfTitle=new TextField();
	        tfSaleEnds=new TextField();
	        _btnDetail=new SimpleButton();
	        myGUI=new GUI();
	        myGUI.setRadius(3);
	        myGUI.setPadding(0);
			myGUI.setColorGradient([_BG_COLOR_BUTTON , _BG_COLOR_BUTTON]);	  
			this._btnDetail = myGUI.GuiButton("SHOP NOW");      
	       
	    }
	    
	    private function btnShopNowClick(event:MouseEvent):void{
		    var request:URLRequest = new URLRequest(_url);
		    try {		    	
		        navigateToURL(request, '_blank');
		    } catch (e:Error) {
		        trace("Error occurred!");
		    }
		}
	       
	    public function setLinkForDetailsView(url:String):void{
			this._url=url;
		}
		
		 public function getLinkForDetailsView():String{
			return this._url;
		}
		
		public function setTextTitle(str:String):void{
			this._sTitle=str;
		}
		
		public function setTextPrice(str:String):void{
			this._sPrice=str;
		}
		
		public function setTextSalePrice(str:String):void{
			this._sSalePrice=str;
		}
		
		public function setTexBrand(str:String):void{
			this._sBrand=str;
		}
		
		
		public function setTextSaleEnd(str:String):void{
			this._sSaleEnd=str;
		}
		
		public function setProductInfo(info:Product):void{
			if(info == null) return;
			_sTitle = info.getName();
			_sBrand	= info.getBrand();	
			_sPrice = info.getPrice();
			_sSalePrice = info.getSalePrice();			
			_url = info.getUrl();
			_sSaleEnd = info.getSaleEnd();
		}
		
		public function setVisible(bVisible:Boolean):void{
			
			this._isShow = bVisible;			

			if (bVisible){
				//_stage.addChild(_movie);
				_stage.addChild(_layout);			
				_stage.addChild(_tfBrand);	
				_stage.addChild(_tfPrice);	
				_stage.addChild(_tfSaleOffPrice);				
					
				_stage.addChild(_tfTitle);
				_stage.addChild(tfSaleEnds);
				_stage.addChild(_btnDetail);					
			}
			else{
				this._layout.clear();
				//this._movie.graphics.clear();
				//_stage.removeChild(_movie);	
				_stage.removeChild(_layout);			
				_stage.removeChild(_tfBrand);	
				_stage.removeChild(_tfPrice);	
				_stage.removeChild(_tfSaleOffPrice);				
						
				_stage.removeChild(_tfTitle);
				_stage.removeChild(tfSaleEnds);
				_stage.removeChild(_btnDetail);						
			}
		}		 
		
		public function IsVisible():Boolean{
			return this._isShow;
		}
		
		public function setX(x:Number):void{
			this._xLayout = x;
		}
		
		public function setY(y:Number):void{
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
            txtFormatTitle.size = 12;
            txtFormatTitle.bold = true;
            
  			var txtFormatPrice:TextFormat = new TextFormat();
            txtFormatPrice.font = "Arial";
            txtFormatPrice.size = 12;
            txtFormatPrice.bold = true;
            
            var txtFormatDetail:TextFormat = new TextFormat();
            txtFormatDetail.color = 0xffffff;
            txtFormatDetail.font = "Arial";
            txtFormatDetail.size = 12;
            txtFormatDetail.bold = true;
            
  			
            //format Sale Ends
  			var txtFormatSaleEnd:TextFormat = new TextFormat();
            txtFormatSaleEnd.font = "Arial";
            txtFormatSaleEnd.size = 12;
            txtFormatSaleEnd.bold = true;                                  
            	    	
            _tfTitle.textColor = 0xf6f6f6;
	    	_tfTitle.text=this._sTitle.toUpperCase();
	    	_tfTitle.multiline=true;
	    	_tfTitle.wordWrap=true;
		    _tfTitle.setTextFormat(txtFormatTitle);
			_tfTitle.selectable = false;
      		_tfTitle.visible = true;
      		_tfTitle.width=(this._widthLayout+_xLayout) -15;
      		_tfTitle.x=this._xLayout + _pad ;
      		_tfTitle.y=this._yLayout +_pad;	    	
            	    	
	    	
	    	_tfBrand.textColor = 0xf6f6f6;
	    	_tfBrand.text=this._sBrand + "  |  ";  	
      		_tfBrand.autoSize = TextFieldAutoSize.LEFT;
		    _tfBrand.setTextFormat(txtFormatPrice);
			_tfBrand.selectable = false;
      		_tfBrand.visible = true;
      		_tfBrand.x=xTempTip;
      		_tfBrand.y=this._yLayout +15 + 15; 
      			
      		
	    	_tfPrice.textColor = 0x838383;
	    	_tfPrice.text = "$" + this._sPrice;
      		_tfPrice.autoSize = TextFieldAutoSize.LEFT;
		    _tfPrice.setTextFormat(txtFormatPrice);
			_tfPrice.selectable = false;
      		_tfPrice.visible = true;
      		_tfPrice.x=_tfBrand.x + _tfBrand.width + 1;
      		_tfPrice.y=_tfBrand.y; 	
      
      		
      		_tfSaleOffPrice.textColor = 0xf6f6f6;
	    	_tfSaleOffPrice.text = "$" + this._sSalePrice;
      		_tfSaleOffPrice.autoSize = TextFieldAutoSize.LEFT;
		    _tfSaleOffPrice.setTextFormat(txtFormatPrice);
			_tfSaleOffPrice.selectable = false;
      		_tfSaleOffPrice.visible = true;
      		_tfSaleOffPrice.x=_tfPrice.x + _tfPrice.width + 5;
      		_tfSaleOffPrice.y=_tfBrand.y;    	     		
      		 				
      		_btnDetail.width=_WIDTH_BUTTON
      		_btnDetail.height=_HEIGHT_TEXTFIELD;
      		_btnDetail.x=_xLayout + _widthLayout - _pad - _btnDetail.width; 
      		_btnDetail.y=_tfBrand.y;
      		_btnDetail.addEventListener(MouseEvent.CLICK,btnShopNowClick);
      		      				
			//draw SaleEnds   	    	
   	    	tfSaleEnds.textColor = 0xf6f6f6;
   	    	
	    	tfSaleEnds.text=this._sSaleEnd.toUpperCase();
			tfSaleEnds.autoSize= TextFieldAutoSize.CENTER;
			tfSaleEnds.setTextFormat(txtFormatSaleEnd);
			tfSaleEnds.selectable = false;
      		tfSaleEnds.visible = true;
      		tfSaleEnds.x=(this._xLayout + (this._widthLayout/2))-  tfSaleEnds.width/2 ;
      		tfSaleEnds.y=this._yLayout + this._heightLayout - 25;
      		
      		var hLayout:Number = _tfBrand.y - _yLayout + 50;     
      		var startLayout1:Number =  	_yLayout + hLayout + 2;      		
      		 		
      		//draw layout sale end
      		_layout.setColor(_bgColor);
      		_layout.setAnpha(_bgColorAnpha);
      		_layout.draw( _xLayout,_yLayout, _widthLayout, hLayout, _radius);//bg1/
      		_layout.draw(_xLayout,startLayout1, _widthLayout,_yLayout + this._heightLayout - startLayout1, _radius);//bg2/
      		      		      		     		
			//delete price      		      		      		     		
      		_layout.setColor(_tfPrice.textColor);
      		_layout.setAnpha(1);
      		_layout.draw(_tfPrice.x,_tfPrice.y + 10,_tfPrice.width,1,_radius);		
      		 //draw layout content	   		
      		_layout.setColor(_bgColorDetails);
      		_layout.setAnpha(_bgColorDetailsAnpha);
      		_layout.draw(_btnDetail.x -2,_btnDetail.y - 2, _btnDetail.width + 4, _btnDetail.height + 4, _radius); //bg of button/ 			
									
			
												
			_stage.addChild(_layout);			
			_stage.addChild(_tfBrand);	
			_stage.addChild(_tfPrice);	
			_stage.addChild(_tfSaleOffPrice);				
			_stage.addChild(_tfTitle);
			_stage.addChild(tfSaleEnds);
			_stage.addChild(_btnDetail);		
							
	    }	 	    
	}
}
