// Thanh
package com.ini.overlay
{
	import com.ini.model.*;
	import com.ini.ui.*;
	import com.ini.utils.*;
	
	import flash.display.*;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.*;
	import flash.text.*;
	
	public class InputOverlay extends Shape {
		private var _bgColor:uint;
		//declare control for Overlay
		private var tfLabel:TextField;
		private var tfEmail:TextField;
		private var tfSaleEnds:TextField;
		private var tfTitle:TextField;
		private var tfHostName:TextField;		
		//draw layout overlay
		private var _xLayout:Number;
		private var _yLayout:Number;
		private var _widthLayout:Number;
		private var _heightLayout:Number;
		private var _radius:Number;
		
		//private var movie:MovieClip ;
		private var isShow:Boolean						= false;
		private var hintText:String						= "";

		private var _layout:LayoutContainer;						// layout of overlay
		private var _stage:Stage;
		private var _input:Input;					// Input overlay data
		private static const _HEIGHT_OFFSET:Number		= 5;  // height offset
		private static const _HEIGHT_TEXTFIELD:Number	= 20;  // height of textfield
		private static const _WIDTH_BUTTON:Number		= 80;  // height of button "SUBMIT"
		private static const  _BG_COLOR_BUTTON:uint		= 0xff6600; // background color button
		private static const  _TEXT_COLOR:uint			= 0xf6f6f6; // text color
		
		private var txtFormatContent:TextFormat;
		// create button SUBMIT
		private var myGUI:GUI; 										
		private var btnSubmit:SimpleButton;		
		private var isSubmitSuccess:Boolean				= false;
		
				
		public function InputOverlay(stage:Stage,bgColor:uint ,x:Number,y:Number,width:Number,height:Number,radius:Number) {
			//movie= new MovieClip();
			this._stage=stage;
			
	        this._bgColor = bgColor;
	        this._xLayout=x;
	        this._yLayout=y;
	        this._widthLayout=width;
	        this._heightLayout=height;
	        this._radius=radius;
	        _layout=new LayoutContainer(this._bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,_radius);
	        _input=new Input();
	        tfLabel=new TextField();
	        tfEmail=new TextField();
	        tfSaleEnds=new TextField();
	        tfTitle=new TextField();
	        tfHostName=new TextField();	        
	        btnSubmit=new SimpleButton();
	        txtFormatContent = new TextFormat();
	        myGUI=new GUI();
	        myGUI.setRadius(0);
	        myGUI.setPadding(0);
			myGUI.setColorGradient([_BG_COLOR_BUTTON , _BG_COLOR_BUTTON]);
			
			this.btnSubmit = myGUI.GuiButton("SUBMIT");
	    }
		public function setInputOverlayInfo(input:Input):void{
			this._input				= input;
			_input.label			= input.label;
			_input.name				= input.name;
			_input.title			= input.title;
			_input.hostName			= input.hostName;
			_input.value			= input.value;
			_input.confirmMessage	= input.confirmMessage;
			_input.errorMessage		= input.errorMessage;
			_input.saleEnd			= input.saleEnd;
			_input.validatePattern	= input.validatePattern;
			_input.submitURL		= input.submitURL;
		}
								
		public function setVisible(bVisible:Boolean):void{
			this.isShow = bVisible;
			if (bVisible){
				//_stage.addChild(movie);
			_stage.addChild(_layout);
			_stage.addChild(tfTitle);
			_stage.addChild(tfHostName);
			_stage.addChild(tfSaleEnds);	
			_stage.addChild(tfLabel);
			_stage.addChild(tfEmail);
			_stage.addChild(btnSubmit);			
							
			}
			else{
				this._layout.clear();
				//this.movie.graphics.clear();
				//_stage.removeChild(movie);
				_stage.removeChild(_layout);
				_stage.removeChild(tfTitle);
				_stage.removeChild(tfHostName);
				_stage.removeChild(tfSaleEnds);	
				_stage.removeChild(tfLabel);
				_stage.removeChild(tfEmail);
				_stage.removeChild(btnSubmit);	
				
			}
		}			 
		public function IsVisible():Boolean{
			return this.isShow;
		}
		
		public function setXY(x:Number,y:Number):void{
			this._xLayout = x;
			this._yLayout = y;
		}
		private function textFieldForcusIn(evt:FocusEvent):void{
			if (evt.target.text == hintText){  
			  this.tfEmail.textColor = 0x989797;
			  tfEmail.setTextFormat(this.txtFormatContent);
			  this.tfEmail.text = "";
			  
			}
		}
		private function textFieldEnter(evt:KeyboardEvent):void{
			if(evt.keyCode==13){
				this.checkEmail();
			}else if(evt.keyCode==27){
				this.tfEmail.text="";
				
			}
		}
		private function textFieldForcusOut(evt:FocusEvent):void{
			if (evt.target.text == "")  
			{
				this.tfEmail.textColor = 0x989797;
				this.tfEmail.text = hintText;
				tfEmail.setTextFormat(this.txtFormatContent);
				
			}
		}	
		private function checkEmail():void
		{
			try {
		      	if(this.tfEmail.text=="" || !isValidEmail(this.tfEmail.text)){
		      		isSubmitSuccess=false;
		      		showAlert(this._input.errorMessage);
		      		return ;
		      	}else{
		      		isSubmitSuccess=true;
		      		showAlert(this._input.confirmMessage);
		     	}
	      	} catch (e:Error) {
	          trace("Error occurred!");
	      	}
		}
		private function isValidEmail(email:String):Boolean {
    		var emailExpression:RegExp =/([a-z0-9._-]+?)@([a-z0-9.-]+)\.([a-z]{2,4})/;// this._inputOverlayInfo.validatePattern;
    		return emailExpression.test(email);
		}		
		private function showAlert(str:String):void
		{
				Alert.init(this._stage);
				Alert.getWidthLayout()
				var p:Point;
				if(str.length>50)
					p=new Point(this._xLayout - 100,this._yLayout);
				else
					p=new Point(this._xLayout,this._yLayout);
					
				Alert.show(str, {buttons:["OK"], callback:handleResponse , background:"none" ,promptAlpha:1 , colour:0x8b9faa,textColour:0xFFFFFF ,position:p});
					
		}
		private function handleResponse(response:String):void {
			if (response == "OK" && isSubmitSuccess ) {
				var url:String = this._input.submitURL;
	      		var request:URLRequest = new URLRequest(url);
				 navigateToURL(request, '_blank');
				 this.tfEmail.text=this.hintText;
			}
		}	
		private function btnSubmitClick(event:MouseEvent):void{
	      	this.checkEmail();
	    }
	    public function drawItem():void {
	    	try{
	    	//////////////////////////////////////
	    	//		SALE ENDS							//
	    	//	Subcribe to receive updates ob feature sales//
	    	//		  |							//
	    	//									//
	    	//////////////////////////////////////
	    	var yLayoutTemp:Number;
			var xTempTip:Number=this._xLayout +10;
			var padding:Number=15;
			var yOffsetTop:Number=10;
			
            txtFormatContent.font = "Arial";
            txtFormatContent.size = 12;
            
            //format Sale Ends
  			var txtFormatSaleEnd:TextFormat = new TextFormat();
            txtFormatSaleEnd.font = "Arial";
            txtFormatSaleEnd.size = 12;
            txtFormatSaleEnd.bold = true;
            //format title
  			var txtFormatTitle:TextFormat = new TextFormat();
            txtFormatTitle.font = "Arial";
            txtFormatTitle.size = 12;
            txtFormatTitle.align=TextFormatAlign.CENTER;
            txtFormatTitle.bold = true;                                                            
      		////////////////////// draw layout display content////////////////////
            //draw SaleEnds
   	    	tfSaleEnds.textColor = _TEXT_COLOR;
	    	tfSaleEnds.text=this._input.saleEnd.toUpperCase();
			tfSaleEnds.autoSize= TextFieldAutoSize.CENTER;
			tfSaleEnds.setTextFormat(txtFormatSaleEnd);
			tfSaleEnds.selectable = false;
      		tfSaleEnds.visible = true;
      		tfSaleEnds.x=(this._xLayout + (this._widthLayout/2))-  tfSaleEnds.width/2 ;
      		//tfSaleEnds.y=this._yLayout +yOffsetTop;
      		
			// label
	    	tfLabel.textColor = 0x989797;
	    	tfLabel.text=this._input.label;
      		tfLabel.autoSize = TextFieldAutoSize.CENTER;
		    tfLabel.setTextFormat(txtFormatContent);
			tfLabel.selectable = false;
      		tfLabel.visible = true;
      		tfLabel.x=xTempTip;
      		//tfLabel.y=this._yLayout + yOffsetTop*3;		    
      		
      		
      		tfEmail.textColor = 0x989797;
      		tfEmail.background=true;
      		tfEmail.backgroundColor = 0xffffff;
      		tfEmail.name=this._input.name;
      		hintText=this._input.value;
	    	tfEmail.text=hintText;
	    	
	    	tfEmail.type=TextFieldType.INPUT;
		    tfEmail.setTextFormat(txtFormatContent);
		    tfEmail.border=true;
		    tfEmail.borderColor=0xffffff;
		    tfEmail.height=20;
		    tfEmail.width=this._widthLayout -(_WIDTH_BUTTON +_WIDTH_BUTTON/2) ;
      		tfEmail.x=xTempTip ;
      		//tfEmail.y=this._yLayout + yOffsetTop*6 -_HEIGHT_OFFSET;
      		tfEmail.selectable=true;
      		tfEmail.addEventListener(FocusEvent.FOCUS_IN,textFieldForcusIn);
      		tfEmail.addEventListener(FocusEvent.FOCUS_OUT,textFieldForcusOut);
      		tfEmail.addEventListener(KeyboardEvent.KEY_UP,textFieldEnter);
      		
      		
      		this.btnSubmit.width=_WIDTH_BUTTON
      		this.btnSubmit.height=_HEIGHT_TEXTFIELD;
			this.btnSubmit.x=xTempTip + tfEmail.width+20 ;
			//this.btnSubmit.y=this._yLayout + yOffsetTop*6 - _HEIGHT_OFFSET;
			this.btnSubmit.addEventListener(MouseEvent.CLICK,btnSubmitClick);      		
      		// layout display content
      		
      		var hLayoutTemp:Number=this.btnSubmit.height + yOffsetTop*2 + tfLabel.height +tfSaleEnds.height + _HEIGHT_OFFSET*2
      		yLayoutTemp=_yLayout + _heightLayout - hLayoutTemp;
			// Set Y for Control
			tfSaleEnds.y	 = yLayoutTemp +yOffsetTop; 
      		tfLabel.y		 = yLayoutTemp + yOffsetTop + tfSaleEnds.height + _HEIGHT_OFFSET;
      		tfEmail.y		 = yLayoutTemp + yOffsetTop + tfSaleEnds.height +tfLabel.height +_HEIGHT_OFFSET*2;
      		this.btnSubmit.y = yLayoutTemp + yOffsetTop + tfSaleEnds.height +tfLabel.height +_HEIGHT_OFFSET*2;
      		      		
      		_layout.draw(_xLayout,yLayoutTemp, _widthLayout, hLayoutTemp , _radius);     
      		
			// Title
      		var heightlayout_Title:Number; 
      		var heightSpace:Number=2;
      					
			// Host name
	    	tfHostName.textColor = _TEXT_COLOR;
	    	tfHostName.text="HOSTED BY " + this._input.hostName.toUpperCase();
		    tfHostName.setTextFormat(txtFormatTitle);
			tfHostName.selectable = false;
      		tfHostName.visible = true;
      		tfHostName.height=_HEIGHT_TEXTFIELD;
      		tfHostName.width=_widthLayout-20;
      		tfHostName.x=xTempTip;
      		tfHostName.y=_yLayout - yOffsetTop - _HEIGHT_TEXTFIELD ;
			
	    	tfTitle.textColor = _TEXT_COLOR;
	    	tfTitle.text=this._input.title.toUpperCase();
      		tfTitle.autoSize=TextFieldAutoSize.CENTER;
      		tfTitle.multiline=true;
      		tfTitle.wordWrap=true;
		    tfTitle.setTextFormat(txtFormatTitle);
			tfTitle.selectable = false;
      		tfTitle.visible = true;
      		tfTitle.width=_widthLayout-20;
      		tfTitle.x=xTempTip;
      		tfTitle.y=_yLayout - yOffsetTop - _HEIGHT_TEXTFIELD -_HEIGHT_OFFSET- tfTitle.height;
			
			heightlayout_Title= yOffsetTop *2 + tfTitle.height +tfHostName.height+_HEIGHT_OFFSET
			yLayoutTemp= yLayoutTemp -heightlayout_Title-2;   		
			// layout display title + hosted by      		
			//reset position Y control 
			tfTitle.y=yLayoutTemp +yOffsetTop;
			tfHostName.y=yLayoutTemp +yOffsetTop + tfTitle.height;	      		      		
      		_layout.draw(_xLayout,yLayoutTemp, _widthLayout, heightlayout_Title, _radius);
      		
			_stage.addChild(_layout);
			_stage.addChild(tfTitle);
			_stage.addChild(tfHostName);
			_stage.addChild(tfSaleEnds);	
			_stage.addChild(tfLabel);
			_stage.addChild(tfEmail);
			_stage.addChild(btnSubmit);				      		
	      }catch(err:Error){
	      	
	      }
	 }	 	    
	}
}