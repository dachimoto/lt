package {
  import com.brightcove.api.APIModules;
  import com.brightcove.api.CustomModule;
  import com.brightcove.api.events.*;
  import com.brightcove.api.modules.ContentModule;
  import com.brightcove.api.modules.ExperienceModule;
  import com.brightcove.api.modules.VideoPlayerModule;
  import com.ini.model.*;
  import com.ini.overlay.*;
  import com.ini.ui.*;
  import com.ini.utils.*;
  
  import flash.display.Stage;
  import flash.events.Event;
  import flash.net.*;
  import flash.xml.*;
  
  import memorphic.xpath.XPathQuery;  
  
  public class OverlayPlugin extends CustomModule{
	internal var _videoPlayerModule:VideoPlayerModule = null;    
    internal var _experienceModule:ExperienceModule = null;    
    internal var _contentModule:ContentModule = null;  
      
    private var _stageControl:Stage;

    private var _sSaleEnds:String = "";
    
    //declare tip overlay
    private var _tipOvl:TipOverlay;
    
    //declare title overlay 
    private var _title:Title;
    private var _titleOvl:TitleOverlay;    
    //declare input overlay pause trigger
    private var _inputOvl:InputOverlay;
    private var _input:Input;
    //declare input overlay end trigger
    private var _inputEndOvl:InputOverlay; 
    private var _inputEnd:Input;
    //declare product overlay cuepoint    
    private var _prodOvl:ProductOverlay;
     
    private static const _bgColor:uint   		= 0x232323; // background color of layout
    private static const _bgColorDetail:uint 	= 0xff6600;     	
	private var _xLayout:Number					= 170;//value default of X draw layoutout
	private var _yLayout:Number					= 260;//value default of Y draw layoutout
	private var _widthLayout:Number				= 360;//value width of X draw layoutout(Rec) 
	private var _heightLayout:Number			= 110;//value height of X draw layoutout(Rec)
	private static const _radius:Number			= 0;// _radius Top-left ,Top-right,bottom-left,bottom-right
	private static const _iVOffset:Number 		= 50;
	private static const _iLeftOffset:Number 	= 10;	
	private var _iVideoLength:Number 			= 0;
	private var _bIsFullSreen:Boolean 			= false;	
	private var _arrOvlInfo:Array 				= null;
	
	private static const API_PATH:String 		= "/xml/player/video-overlays";
	private var _method:String 					= "https://";	
		
	public function onProgress(evt:MediaEvent):void {
		if(_inputOvl.IsVisible())_inputOvl.setVisible(false);
		if(this._inputEndOvl.IsVisible())_inputEndOvl.setVisible(false);
		var iCurCuePoint:Number = -1;
		var position:Number= evt.position;		
		if(this._arrOvlInfo==null || this._arrOvlInfo.length==0){
			return;
		}
		
		for (var i:int = 0;i<_arrOvlInfo.length;i++){		
			if (i==_arrOvlInfo.length-1){
				if (position >= _arrOvlInfo[i].cuePoint){
					iCurCuePoint = i;
					break;						
				}
			}		
			else{
				for (var j:int = i+1;j < _arrOvlInfo.length;j++){
					if (position >= _arrOvlInfo[i].cuePoint && position < _arrOvlInfo[j].cuePoint){
						iCurCuePoint = i;
						break;
					}
				}
			}
		}
				
		var start:Number = _arrOvlInfo[iCurCuePoint].cuePoint;
	    var end:Number 	 = _arrOvlInfo[iCurCuePoint].duration + start;  

		//_experienceModule.debug("Overlay type = " + arrOvlInfo[msgindex].type);
		if((position >= start) && (position <= end)){
			if (_arrOvlInfo[iCurCuePoint].type == "T"){
				if (_prodOvl.IsVisible()) _prodOvl.setVisible(false);
				if (_tipOvl.IsVisible()) _tipOvl.setVisible(false);
				_tipOvl.setTextTitle(_arrOvlInfo[iCurCuePoint].overlay.toString());			
				_tipOvl.setTextSaleEnd(_sSaleEnds);
				_tipOvl.drawItem();
				_tipOvl.setVisible(true);			
			}			    
			else if (_arrOvlInfo[iCurCuePoint].type == "P"){
				if (_tipOvl.IsVisible()) _tipOvl.setVisible(false);
				if (_prodOvl.IsVisible()) _prodOvl.setVisible(false);
				var objProdOvlInfo:Product =  _arrOvlInfo[iCurCuePoint].overlay as Product;//objOvlInfo.getOverlay()
				_prodOvl.setTexBrand(objProdOvlInfo.getBrand());
				_prodOvl.setTextTitle(objProdOvlInfo.getName());
				_prodOvl.setTextPrice(objProdOvlInfo.getPrice());
				_prodOvl.setTextSalePrice(objProdOvlInfo.getSalePrice());
				_prodOvl.setTextSaleEnd(_sSaleEnds);
				_prodOvl.setLinkForDetailsView(objProdOvlInfo.getUrl());
				_prodOvl.setLinkForDetailsView(objProdOvlInfo.getUrl());								
				_prodOvl.drawItem();
				_prodOvl.setVisible(true);
			}
	   	}			   
	   	else if(position > end){
   			if (_tipOvl.IsVisible()) _tipOvl.setVisible(false);	
   			if (_prodOvl.IsVisible()) _prodOvl.setVisible(false);	   		
	   }
 
	}
	//Media Event stop
	public function onStop(evt:MediaEvent):void {
		if(evt.position < this._iVideoLength){
			this.ShowInputOverlay();
		}else{
			this.ShowInputEndTrigger();
		}
	}
	
	public function onBegin(evt:MediaEvent):void{
		
	}
	//Media Event Play
	public function onPlay(evt:MediaEvent):void{
		_experienceModule.debug("width = " + this._stageControl.width.toString());
		_experienceModule.debug("height = " + this._stageControl.height.toString());
		_experienceModule.debug("width full= " + this._stageControl.fullScreenWidth.toString());
		_experienceModule.debug("height full= " + this._stageControl.fullScreenHeight.toString());		
		if(this._inputEndOvl.IsVisible())	_inputEndOvl.setVisible(false);
		if (_titleOvl.IsVisible()) _titleOvl.setVisible(false);
		this._iVideoLength=this._videoPlayerModule.getVideoDuration().toString();
	}
	
	//click fullscreen - set x, y layout 
	private function onFullSreen(evt:ExperienceEvent):void{
		try{
			
			_bIsFullSreen=true;
			_xLayout = this._stageControl.fullScreenWidth - _widthLayout-_iLeftOffset;
			_yLayout = this._stageControl.fullScreenHeight - _heightLayout-_radius - _iVOffset;			
			_tipOvl.setXY(_xLayout,_yLayout); 	
			if (_tipOvl.IsVisible()){ 
				_tipOvl.setVisible(false);
				_tipOvl.drawItem();				
				_tipOvl.setVisible(true);
			}
			_inputOvl.setXY(_xLayout,_yLayout); 	
			if(this._inputOvl.IsVisible()){
				_inputOvl.setVisible(false);
				_inputOvl.drawItem();				
				_inputOvl.setVisible(true);
			}
			_inputEndOvl.setXY(_xLayout,_yLayout);
			if(this._inputEndOvl.IsVisible()){
				_inputEndOvl.setVisible(false);
				_inputEndOvl.drawItem();				
				_inputEndOvl.setVisible(true);
			}
			_titleOvl.setXY(_xLayout,_yLayout); 	
			if(this._titleOvl.IsVisible()){
				_titleOvl.setVisible(false);
				_titleOvl.drawItem();				
				_titleOvl.setVisible(true);
			}
									
			_prodOvl.setX(_xLayout); 	
			_prodOvl.setY(_yLayout);			
			if(this._prodOvl.IsVisible()){
				_prodOvl.setVisible(false);
				_prodOvl.drawItem();				
				_prodOvl.setVisible(true);
			}						
		}
		catch(err:Error){
			
		}
	}
	
	// Exit fullscreen - set x, y layout
	private function onExitFullSreen(evt:ExperienceEvent):void{
		try{
			_bIsFullSreen=false;
			_xLayout = this._stageControl.stageWidth - _widthLayout-_iLeftOffset;
			_yLayout = this._stageControl.stageHeight - _heightLayout-_radius - _iVOffset;
			_tipOvl.setXY(_xLayout,_yLayout); 	
			if (_tipOvl.IsVisible()) {
				_tipOvl.setVisible(false);
				_tipOvl.drawItem();				
				_tipOvl.setVisible(true);
			}
			_inputOvl.setXY(_xLayout,_yLayout);						
			if(this._inputOvl.IsVisible()){
				_inputOvl.setVisible(false);
				_inputOvl.drawItem();				
				_inputOvl.setVisible(true);
			}			
			_inputEndOvl.setXY(_xLayout,_yLayout);
			if(this._inputEndOvl.IsVisible()){
				_inputEndOvl.setVisible(false);
				_inputEndOvl.drawItem();				
				_inputEndOvl.setVisible(true);
			}		
			_titleOvl.setXY(_xLayout,_yLayout); 	
			if(this._titleOvl.IsVisible()){
				_titleOvl.setVisible(false);
				_titleOvl.drawItem();				
				_titleOvl.setVisible(true);
			}				
			_prodOvl.setX(_xLayout); 	
			_prodOvl.setY(_yLayout);			
			if(this._prodOvl.IsVisible()){
				_prodOvl.setVisible(false);
				_prodOvl.drawItem();				
				_prodOvl.setVisible(true);
			}			
		}
		catch(err:Error){
			
		}	
	}	
	
	override protected function initialize():void{
		try{		        
		    player.loadModules();
		    _experienceModule = player.getModule(APIModules.EXPERIENCE) as ExperienceModule;
		    _videoPlayerModule = player.getModule(APIModules.VIDEO_PLAYER) as VideoPlayerModule;
		    _contentModule = player.getModule(APIModules.CONTENT) as ContentModule;
			
			var parameters:Object = _experienceModule.getStage().loaderInfo.parameters;
			
	        var sDomain:String = parameters["j_apiHostname"].toString();
	        var sVideoID:String = parameters["j_videoID"].toString();	        
	        var sURL:String ;//= sDomain + sVideoID;       
			sURL=_method + sDomain + API_PATH + "?videoId=" + sVideoID
			_experienceModule.debug("URLs = " + sURL);
			_videoPlayerModule.addEventListener(MediaEvent.BEGIN,onBegin);
		    _videoPlayerModule.addEventListener(MediaEvent.PROGRESS,onProgress);
		    _videoPlayerModule.addEventListener(MediaEvent.PLAY,onPlay);
		    _videoPlayerModule.addEventListener(MediaEvent.STOP,onStop);
		    _experienceModule.addEventListener(ExperienceEvent.ENTER_FULLSCREEN,onFullSreen);
		    _experienceModule.addEventListener(ExperienceEvent.EXIT_FULLSCREEN,onExitFullSreen);		    		    
		    
		    _stageControl = _experienceModule.getStage();
		    
		    var heightVP:Number=_stageControl.height;
		    var widthVP:Number=_stageControl.width;
		    
		    _xLayout = widthVP - _widthLayout-_iLeftOffset ;
		    _yLayout = heightVP - _heightLayout-_radius-_iVOffset; 		    	
	       	
	       	_tipOvl = new TipOverlay(_stageControl,_bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,_radius);
	       	_prodOvl = new ProductOverlay(_stageControl,_bgColor,_bgColorDetail,_xLayout,_yLayout,_widthLayout,_heightLayout,_radius);
	       	
	       	_titleOvl = new TitleOverlay(_stageControl,_bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,_radius);
	       	_title=new Title();
	       	
	       	_inputOvl = new InputOverlay(_stageControl,_bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,_radius); 
	       	_input=new Input();      		       	
	       	
	       	_inputEndOvl = new InputOverlay(_stageControl,_bgColor,_xLayout,_yLayout,_widthLayout,_heightLayout,_radius); 
	       	_inputEnd=new Input();  
	       	
	       	//read API data	       	
	       	this.readXML(sURL);
	 	}
	 	catch(err:Error){
	 		
	 	}    	
 	}
 	
 	//display Input Overlay End Trigger 
	 private function ShowInputEndTrigger():void{
//			if(_bIsFullSreen){
//		 		_xLayout = this._stageControl.fullScreenWidth - _widthLayout-_iLeftOffset;
//				_yLayout = this._stageControl.fullScreenHeight - _heightLayout-_radius - _iVOffset;
//			}else{
//				_xLayout = this._stageControl.stageWidth - _widthLayout-_iLeftOffset;
//				_yLayout = this._stageControl.stageHeight - _heightLayout-_radius - _iVOffset;				
//			}
			this._inputEndOvl.setXY(_xLayout,_yLayout); 	
			_inputEndOvl.setInputOverlayInfo(this._inputEnd); 			
	 		if (_tipOvl.IsVisible()) _tipOvl.setVisible(false);	
	 		if (_prodOvl.IsVisible()) _prodOvl.setVisible(false);
			if (_inputEndOvl.IsVisible()) _inputEndOvl.setVisible(false);
				_inputEndOvl.drawItem();
				_inputEndOvl.setVisible(true);
			
	 }
	 //display Title Overlay Preplay
	 private function ShowTitleOverlay():void{
//			if(_bIsFullSreen){
//		 		_xLayout = this._stageControl.fullScreenWidth - _widthLayout-_iLeftOffset;
//				_yLayout = this._stageControl.fullScreenHeight - _heightLayout-_radius - _iVOffset;
//			}else{
//				_xLayout = this._stageControl.stageWidth - _widthLayout-_iLeftOffset;
//				_yLayout = this._stageControl.stageHeight - _heightLayout-_radius - _iVOffset;				
//			}	 
			_experienceModule.debug("X = " + _xLayout.toString() );
			_experienceModule.debug("Y = " + _yLayout.toString() );
			this._titleOvl.setXY(_xLayout,_yLayout); 	
			_titleOvl.setTitleInfo(this._title);
	 		if (_tipOvl.IsVisible()) _tipOvl.setVisible(false);	
	 		if (_prodOvl.IsVisible()) _prodOvl.setVisible(false);
			if (_titleOvl.IsVisible()) _titleOvl.setVisible(false);
				_titleOvl.drawItem();
				_titleOvl.setVisible(true);			
	 }
	 
	 //display Input Overlay Pause Trigger	 
	 private function ShowInputOverlay():void{
//			if(_bIsFullSreen){
//		 		_xLayout = this._stageControl.fullScreenWidth - _widthLayout-_iLeftOffset;
//				_yLayout = this._stageControl.fullScreenHeight - _heightLayout-_radius - _iVOffset;
//			}else{
//				_xLayout = this._stageControl.stageWidth - _widthLayout-_iLeftOffset;
//				_yLayout = this._stageControl.stageHeight - _heightLayout-_radius - _iVOffset;				
//			}
			_inputOvl.setXY(_xLayout,_yLayout); 	
			_inputOvl.setInputOverlayInfo(this._input);			
	 		if (_tipOvl.IsVisible()) _tipOvl.setVisible(false);	
	 		if (_prodOvl.IsVisible()) _prodOvl.setVisible(false);
			if (_inputOvl.IsVisible()) _inputOvl.setVisible(false);
				_inputOvl.drawItem();
				_inputOvl.setVisible(true);
			
	 }
	 
	// Read API data 
 	private function readXML(sURL:String):void { 	
 		var loader:URLLoader = new URLLoader(new URLRequest(sURL));
  		loader.addEventListener(Event.COMPLETE, xmlLoaded);		
	}
		
	//load XML complete
	private function xmlLoaded(e:Event):void {
		try{
		  var myXML:XML = new XML(e.target.data);
		  var sExpression:String = "/video/endDateTime";
	 	  var xPath:XPathQuery = new XPathQuery(sExpression);	 
		  var sTitle:String;
		  var sHostName:String;		
		  var sEndDate:String = xPath.exec(myXML);
		  _sSaleEnds=Utils.ConverStrSaleEnd(sEndDate);	 
		  _experienceModule.debug("End date = " + _sSaleEnds );
		  
		  sTitle=myXML.title.toString();
		  sHostName=myXML.host.name.toString();
		 // get Data display title overlay
		 _title.setTitle(sTitle);
		 _title.setHostName(sHostName);
		 _title.setSaleEnd(_sSaleEnds);
		 		  		  
		 // get Data display Pause Trigger
		  sExpression = "/video/triggers/pauseTrigger";
		  xPath = new XPathQuery(sExpression);
		  var sResultOverlay:Object = xPath.exec(myXML);
		 
		  _input.title=sTitle;
		  _input.hostName=sHostName;
		  _input.saleEnd=_sSaleEnds;
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/label";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.label=sResultOverlay.toString();
		  
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/name";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.name=sResultOverlay.toString();
		  
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/value";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.value=sResultOverlay.toString();
		  
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/validatePattern";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.validatePattern=sResultOverlay.toString();		  		  		  
		  
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/errorMessage";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.errorMessage=sResultOverlay.toString();
		  
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/submitUrl";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.submitURL=sResultOverlay.toString();
		  
		  sExpression = "/video/triggers/pauseTrigger/inputOverlay/confirmMessage";
		  xPath = new XPathQuery(sExpression);
		  sResultOverlay= xPath.exec(myXML);
		  _input.confirmMessage=sResultOverlay.toString();		  
		  
   		  // get Data display End Trigger		  		  
		  sExpression = "/video/triggers/endTrigger";
		  xPath = new XPathQuery(sExpression);
		  var sResultEndTrigger:Object = xPath.exec(myXML);
		  
		  _inputEnd.title=myXML.title.toString();
		  _inputEnd.hostName=myXML.host.name.toString();		 
		 _inputEnd.saleEnd=_sSaleEnds;
		  sExpression = "/video/triggers/endTrigger/inputOverlay/label";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.label=sResultEndTrigger.toString();
		  
		  sExpression = "/video/triggers/endTrigger/inputOverlay/name";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.name=sResultEndTrigger.toString();
		  
		  sExpression = "/video/triggers/endTrigger/inputOverlay/value";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.value=sResultEndTrigger.toString();
		  
		  sExpression = "/video/triggers/endTrigger/inputOverlay/validatePattern";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.validatePattern=sResultEndTrigger.toString();		  		  		  
		  
		  sExpression = "/video/triggers/endTrigger/inputOverlay/errorMessage";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.errorMessage=sResultEndTrigger.toString();
		  
		  sExpression = "/video/triggers/endTrigger/inputOverlay/submitUrl";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.submitURL=sResultEndTrigger.toString();
		  
		  sExpression = "/video/triggers/endTrigger/inputOverlay/confirmMessage";
		  xPath = new XPathQuery(sExpression);
		  sResultEndTrigger= xPath.exec(myXML);
		  _inputEnd.confirmMessage=sResultEndTrigger.toString();		
		  
		  // get cuePoint
		 sExpression = "count(/video/triggers/cuePointTrigger)";
		 xPath = new XPathQuery(sExpression);
		 var sResult:Object = xPath.exec(myXML);	 
		 _experienceModule.debug("Length = " + sResult.toString());	  
		  
		 var j:int = Number(sResult);
		 _arrOvlInfo = new Array();	 		 
		 var arrType:Array=new Array("");		 
		 for (var i:int = 0; i<j;i++){
		 	var objOvlInfo:OverlayInfo = new OverlayInfo();
		 	sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/cuePoint";
		 	xPath = new XPathQuery(sExpression);	 	
		 	sResult = xPath.exec(myXML);
		 	var iCuePoint:int = Utils.convertTime(sResult.toString());
		 	
		 	sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/duration";
		 	xPath = new XPathQuery(sExpression);	 	
		 	sResult = xPath.exec(myXML);
		 	var iDuration:int = Utils.convertDuration(sResult.toString());
	
		 	sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/tipOverlay/tip/text";
		 	xPath = new XPathQuery(sExpression);	 	
		 	sResult = xPath.exec(myXML);		
		 	if (sResult.toString().length > 0){//Tip overlay
		 		_arrOvlInfo.push({type:"T",cuePoint:iCuePoint,duration:iDuration,overlay:sResult});
		 	}
		 	else{//Product overlay		 		 
		 		var objPrd:Product = new Product();	 						
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/id";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setId(sResult.toString());
				
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/name";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setName(sResult.toString());
				
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/brand";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setBrand(sResult.toString());
				
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/currency";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setCurrency(sResult.toString());
				
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/price";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setPrice(sResult.toString());
				
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/salePrice";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setSalePrice(sResult.toString());
				
				sExpression = "/video/triggers/cuePointTrigger[" + (i+1).toString() + "]/productOverlay/product/url";
				xPath = new XPathQuery(sExpression); 
				sResult = xPath.exec(myXML);
				objPrd.setUrl(sResult.toString());	
				
				objOvlInfo.setOverlay(objPrd);	 		
				
				_arrOvlInfo.push({type:"P",cuePoint:iCuePoint,duration:iDuration,overlay:objPrd});
		 	}//Product Overlay
		 	//arrOvlInfo[i] = objOvlInfo;
		 }//end of for
		 _arrOvlInfo.sortOn("cuePoint",Array.NUMERIC);
		 
		 this.ShowTitleOverlay();
		 }catch(err:Error){
			_experienceModule.debug("Error reading XML: " + err.message);
		}		 	
	   }
	}
}