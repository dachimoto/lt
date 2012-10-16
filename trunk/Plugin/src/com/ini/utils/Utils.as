package com.ini.utils
{
	public final class Utils
	{
		public const TIP_OVERLAY:int = 0;
		public const PRODUCT_OVERLAY:int = 1;
		private static var _monthLabels:Array = ["January",
													"February",
													"March",
													"April",
													"May",
													"June",
													"July",
													"August",
													"September",
													"October",
													"November",
													"December"];
		
		private static var _dayLabels:Array = ["Monday",
												"Tuesday",
												"Wednesday",
												"Thursday",
												"Friday",
												"Saturday",
												"Sunday"];
		private static function getMonthString (pD:Date, pUseUTC:Boolean = false) : String
		{
			return (pUseUTC ? _monthLabels[pD.monthUTC] : _monthLabels[pD.month]);	
		}
		
		
		private static function getDayString (pD:Date, pUseUTC:Boolean = false) : String
		{	
			return (pUseUTC ? _monthLabels[pD.dayUTC - 1] : _monthLabels[pD.day - 1]);
		}
		
		
		private static function getNonMilitaryHour (pD:Date, pUseUTC:Boolean = false) : Number
		{
			var hrs:int = (pUseUTC ? pD.hoursUTC : pD.hours);
			return (hrs < 12 ? hrs : hrs % 12);
		}
		private static function compare (pD1:Date, pD2:Date) : Number
		{
			var date1Time : Number = pD1.getTime ();
			var date2Time : Number = pD2.getTime ();
			
			var result : Number = -1;
			
			if (date1Time == date2Time)
			{
				result = 0;
			}
			else if (date1Time > date2Time)
			{
				result = 1;
			}
			
			return result;
		} 														 
		public static function convertTime(str:String):Number {
	        /*00:00:02*/
	        if(str == null)  return -1;        
	        if(str.length != 8) return -1;
	        var array:Array = str.split(":");
	        if((array == null) || (array.length != 3)) return -1;
	        return (Number(array[0]*60*60) + Number(array[1]*60) + Number(array[2]));
	    }
	    
	 	public static function convertDuration(str:String):Number {
	 		var second:Number=0;
	 		 second = Number(str.substring(2,str.length-1));
	      return second;
	    }
	    // convert string date to date UTC
		private static function parseDateUTC (sDate:String) : Date
		{
			sDate = sDate.substring(0, sDate.length - 1);
			var parts:Array = sDate.split("T");			
			var dateNums:Array = parts[0].split("-");
			var timeNums:Array = parts[1].split(":");

			var date:Date = new Date();
			date.setUTCFullYear(Number(dateNums[0]), Number(dateNums[1] - 1), Number(dateNums[2]));
			date.setUTCHours(Number(timeNums[0]), Number(timeNums[1]), Number(timeNums[2]), 0);
			
			return date;
		}	       
	 	public static function ConverStrSaleEnd(strDatetime:String):String{
		 	//datetime: 2011-06-30T08:30:49Z
			var sContent:String;
		
			var endDate:Date =parseDateUTC(strDatetime);

			var now:Date = new Date();
			var isOver:Boolean = (compare(now, endDate) > -1);
			var sFirst:String = (isOver ? "SALE ENDED " : "SALE ENDS ");
			
			// Convert time to PST
			var tzOffset:int = -7;	// Timezone offset (-7 is the # of hours the PST timezone is offset from GMT)
			var offsetMilliseconds:Number = tzOffset * 60 * 60 * 1000;	// conver to milliseconds 
			endDate.setTime(endDate.getTime() + offsetMilliseconds);
			
			var month:String = getMonthString(endDate, true);
			var hr:Number = getNonMilitaryHour(endDate, true);
			var mins:Number = endDate.minutesUTC;
			var ampm:String = endDate.hoursUTC < 12 ? "AM" : "PM";
						
		 	sContent= sFirst + month + " " + endDate.date + ", " + hr + ":" + (mins > 9 ? mins : "0" + mins) + " " + ampm;
		 	
		 	return sContent;
		 }     
	}
}