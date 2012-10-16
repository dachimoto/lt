package com.ini.model
{
	public class Product
	{	
		private var _sId:String="";
		private var _sName:String="";
		private var _sBrand:String="";
		private var _sCurrency:String="";
		private var _sPrice:String="";
		private var _sSalePrice:String="";
		private var _sUrl:String="";
		private var _sSaleEnd:String="";

		public function Product()
		{
		}
		
		public function setId(sId:String):void{
			_sId = sId;		
		}
		
		public function getId():String{
			return _sId;
		}
		
		public function setName(sName:String):void{
			_sName = sName;
		}
		
		public function getName():String{
			return _sName;
		}
		
		public function setBrand(sBrand:String):void{
			_sBrand = sBrand;
		}
		
		public function getBrand():String{
			return _sBrand;
		}
		
		public function setCurrency(sCurrency:String):void{
			_sCurrency = sCurrency;
		}
		
		public function getCurrency():String{
			return _sCurrency; 
		}
		
		public function setPrice(sPrice:String):void{
			_sPrice = sPrice;
		}
		
		public function getPrice():String{
			return _sPrice;
		}
		
		public function setSalePrice(sSalePrice:String):void{
			_sSalePrice = sSalePrice;
		}
		
		public function getSalePrice():String{
			return _sSalePrice;
		}
		
		public function setUrl(sUrl:String):void{
			_sUrl = sUrl;
		}
		
		public function getUrl():String{
			return _sUrl;
		}
		
		public function setSaleEnd(sSaleEnd:String):void{
			_sSaleEnd = sSaleEnd;
		}
		
		public function getSaleEnd():String{
			return _sSaleEnd;
		}
		

	}
}
