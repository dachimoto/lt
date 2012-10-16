package com.ini.model
{
	public class Title
	{	
		private var _sTitle:String="";
		private var _sHostName:String="";
		private var _sSaleEnd:String="";
		
		public function Title()
		{
		}
		
		public function setTitle(sTitle:String):void{
			_sTitle = sTitle;		
		}
		
		public function getTitle():String{
			return _sTitle;
		}
		
		public function setHostName(sHostName:String):void{
			_sHostName = sHostName;
		}
		
		public function getHostName():String{
			return _sHostName;
		}
		
		public function setSaleEnd(sSaleEnd:String):void{
			_sSaleEnd = sSaleEnd;
		}
		
		public function getSaleEnd():String{
			return _sSaleEnd;
		}
	}
}
