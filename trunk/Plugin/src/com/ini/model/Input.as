// ActionScript file
package com.ini.model
{
	public class Input{
		private var _sLabel:String="";
		private var _sName:String="";
		private var _sValue:String="";
		private var _sValidatePattern:String="";
		private var _sErrorMessage:String="";
		private var _sSubmitURL:String="";
		private var _sConfirmMessage:String="";
		private var _sSaleEnd:String="";
		private var _sTitle:String="";
		private var _sHostName:String="";
		public function InputOverlay():void{
			_sLabel="";
			_sTitle=""
			_sHostName=""
			_sName="";
			_sValue="";
			_sValidatePattern="";
			_sErrorMessage="";
			_sSubmitURL="";
			_sConfirmMessage="";
			_sSaleEnd="";
		}
		public function set label(str:String):void{
			this._sLabel=str;
		}
		public function get label():String{
			return this._sLabel;
		}		
		public function set saleEnd(str:String):void{
			this._sSaleEnd=str;
		}
		public function get saleEnd():String{
			return this._sSaleEnd;
		}						
		public function set title(str:String):void{
			this._sTitle=str;
		}
		public function get title():String{
			return this._sTitle;
		}
		
		public function get hostName():String{
			return this._sHostName;
		}						
		public function set hostName(str:String):void{
			this._sHostName=str;
		}				
		
		public function get name():String{
			return this._sName;
		}						
		public function set name(str:String):void{
			this._sName=str;
		}
		public function set value(str:String):void{
			this._sValue=str;
		}		
		public function get value():String{
			return this._sValue;
		}							
		public function set validatePattern(str:String):void{
			this._sValidatePattern=str;
		}
		public function get validatePattern():String{
			return this._sValidatePattern;
		}								
		public function set errorMessage(str:String):void{
			this._sErrorMessage=str;
		}
		public function get errorMessage():String{
			return this._sErrorMessage;
		}											
		public function set submitURL(str:String):void{
			this._sSubmitURL=str;
		}
		public function get submitURL():String{
			return this._sSubmitURL;
		}							
		public function set confirmMessage(str:String):void{
			this._sConfirmMessage=str;
		}
		public function get confirmMessage():String{
			return this._sConfirmMessage;
		}										
	}
}