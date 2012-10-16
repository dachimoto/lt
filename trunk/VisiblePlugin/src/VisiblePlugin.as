package {
	import com.brightcove.api.APIModules;
	import com.brightcove.api.CustomModule;
	import com.brightcove.api.events.MediaEvent;
	import com.brightcove.api.modules.ContentModule;
	import com.brightcove.api.modules.ExperienceModule;
	import com.brightcove.api.modules.VideoPlayerModule;
	
	import flash.display.SimpleButton;
	import flash.display.Stage;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.xml.*;
	
	import memorphic.xpath.XPathQuery;
  
	public class VisiblePlugin extends CustomModule   
	{
		internal var _videoPlayerModule:VideoPlayerModule = null;
        internal var _experienceModule:ExperienceModule = null;
    
    	internal var _contentModule:ContentModule = null;
    	internal var strTmp:String="";
    	internal var homeBtnText:String = "VIEW DETAILS";
    	internal var videoId:Number;
    	internal var widthVideo:Number;
    	internal var heightVideo:Number;
    	internal var widthOverlay:Number;
    	internal var heightOverlay:Number;    
    	//internal var movie:MovieClip=new MovieClip();
    	internal var loader:URLLoader;
    	internal var myXML:XML;    	  
    	  	
    	internal var videoList:XMLList;
    	
 
	 	public function btnClick(event:MouseEvent):void{
			var url:String = "https://www.joyus.com/?videoId="+ videoId.toString();
		    var request:URLRequest = new URLRequest(url);
		    try {
		        navigateToURL(request, '_blank');
		    } catch (e:Error) {
		        _experienceModule.debug("Error occurred!");
		    }
	   	}

  		private function readXML():void {
	  		_experienceModule.debug("Try to load XML file");
	  		//https://api.projectjstaging.com/xml/player/video-overlays?externalId=10101
		  	loader = new URLLoader(new URLRequest("http://projj.infonam.com/Ads.xml"));
	  		loader.addEventListener(Event.COMPLETE, xmlLoaded);
  		}
 
     	private function xmlLoaded(e:Event):void {     	
	     	strTmp=loader.bytesTotal.toString();
	     	_experienceModule.debug("str value:" + strTmp);
		 	myXML= new XML(e.target.data);
		 	
		 	_experienceModule.debug("XML data:" + myXML.toString());
		 	_experienceModule.debug("Reading node: /OverlayStructure/Video[@id=1038076836001]/Overlay/Content");
		 	var sExpression:String = "/OverlayStructure/Video[@id=1038076836001]/Overlay/Content";
		 	var xPath:XPathQuery = new XPathQuery(sExpression);
		 	var sResult:Object = xPath.exec(myXML);
		 	_experienceModule.debug("XPath query result:" + sResult.toString());
		 	DrawOverlay();
 	    }
 	    
		override protected function initialize():void
	    {
		   //Security.allowDomain("http://projj.infonam.com/");       
		   //Security.allowDomain("https://api.projectjstaging.com/xml/player/");
		 		
		   player.loadModules();
		  _experienceModule = player.getModule(APIModules.EXPERIENCE) as ExperienceModule;
		  _videoPlayerModule = player.getModule(APIModules.VIDEO_PLAYER) as VideoPlayerModule;
		  _contentModule = player.getModule(APIModules.CONTENT) as ContentModule;
		  _experienceModule.debug("Start to read XML file");
		  //ExternalInterface.call("alert","test");
		  readXML();   	  	
		     // get video information   
		  var video:Object = _videoPlayerModule.getCurrentVideo();
		  videoId = video.id;
		  widthVideo=_videoPlayerModule.getDisplayWidth();
		  heightVideo=_videoPlayerModule.getDisplayHeight();      
		  _videoPlayerModule.addEventListener(MediaEvent.BEGIN, videoOnBegin);
		  _videoPlayerModule.addEventListener(MediaEvent.PLAY, videoOnPlay);
		  _videoPlayerModule.addEventListener(MediaEvent.STOP, videoOnStop);
		  _videoPlayerModule.addEventListener(MediaEvent.PROGRESS, videoOnProgress);
		  
	    }  		
	    
	    protected function videoOnBegin(evt:MediaEvent):void{
	    	_experienceModule.debug("Thao test: Video started");
	    }
	    
	    protected function videoOnPlay(evt:MediaEvent):void{
	    	_experienceModule.debug("Thao test: Video is playing");
	    }
	    
	    protected function videoOnStop(evt:MediaEvent):void{
	    	_experienceModule.debug("Thao test: Video stopped");
	    }
	    
	    protected function videoOnProgress(evt:MediaEvent):void{
	    	_experienceModule.debug("Thao test: Video is in progress");
	    }
	    
	    private function DrawOverlay():void
	    {
			var stage:Stage = _experienceModule.getStage();      
			var bgColor:uint   = 0x000000;
			var layout:LayoutContainer=new LayoutContainer(bgColor,170,260,300,80,5);
	      
			var textLabel:TextField = new TextField();
			var textLabel2:TextField = new TextField();
			var textLabel3:TextField = new TextField();
	
	      
	      //create button view detail//////////////
			var myGUI:GUI = new GUI();
			myGUI.rad=5;
			myGUI.padding=5;
			
			myGUI.color=[0xff6600, 0xff6600];
			var btnView:SimpleButton= myGUI.GuiButton("VIEW DETAILS");
			btnView.x=370;
			btnView.y=290;
			btnView.addEventListener(MouseEvent.CLICK,btnClick);      
	       
			var format:TextFormat = new TextFormat();
		        format.font = "Arial";
		        format.size = 12;
			var format1:TextFormat = new TextFormat();
		        format1.font = "Arial";
		        format1.size = 14;
		        format1.bold=true;            
		        
		              
			textLabel.text  = "CLEMENT EN AUGUST - Lightweight Toggle Dress" ;
			strTmp = "$69.00  |   Earn 65 Joyus Point " +strTmp ;
			_experienceModule.debug(strTmp);
			textLabel2.text = strTmp;
			textLabel3.text = "SALE ENDS JULY 15, 09:00AM ";
		 
		  
			textLabel.textColor = 0xf6f6f6;
			textLabel.autoSize = TextFieldAutoSize.LEFT;
			textLabel.x = 175;
			textLabel.y = 265;
		  
		  
			textLabel2.textColor = 0xf6f6f6;
			textLabel2.autoSize = TextFieldAutoSize.LEFT;
			textLabel2.x = 175;
			textLabel2.y = 285;
		  
			textLabel3.textColor = 0xf6f6f6;
			textLabel3.autoSize = TextFieldAutoSize.CENTER;
			textLabel3.x = 220;
			textLabel3.y = 320;
		  
		     
			textLabel.selectable = false;
			textLabel.visible = true;
			textLabel2.selectable = false;
			textLabel2.visible = true;
			textLabel3.selectable = false;
			textLabel3.visible = true;
		  
			textLabel.setTextFormat(format);
			textLabel2.setTextFormat(format);
			textLabel3.setTextFormat(format1);      
		
			stage.addChild(layout);
			stage.addChild(textLabel);
			stage.addChild(textLabel2);
			stage.addChild(textLabel3);		
	    }
	}
}

