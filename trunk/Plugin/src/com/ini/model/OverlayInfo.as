package com.ini.model
{
	public class OverlayInfo
	{
		private var _type:String; //T: Tip, P: Product
		private var _duration:int = 0;
		private var _cuePoint:int = 0;
		private var _overlay:Object = null;
		
		public function OverlayInfo(){
			this._type = "";
			this._duration = -1;
			this._cuePoint = -1;
			this._overlay = null;			
		}

		public function getType():String{
			return this._type;
		}
		
		public function setType(sType:String):void{
			this._type = sType;
		}		
		
		public function getDuration():int{
			return this._duration;
		}
		
		public function setDuration(iDuration:int):void{
			this._duration = iDuration;
		}		
		
		public function getCuePoint():int{
			return this._cuePoint;
		}
		
		public function setCuePoint(iCuePoint:int):void{
			this._cuePoint = iCuePoint;
		}				
		
		public function getOverlay():Object{
			return this._overlay;
		}
		
		public function setOverlay(objOverlay:Object):void{
			this._overlay = objOverlay;
		}		
	}
}