// By use of this code snippet, I agree to the Brightcove Publisher T&C 
// found at http://corp.brightcove.com/legal/terms_publisher.cfm. 

/*
* To use this class to load your Brightcove player instance, save this code into the root directory
* of your project as BrightcovePlayer.as. Then, within your application, you can instantiate this player
* using the following syntax:
*
*    var player:BrightcovePlayer = new BrightcovePlayer();
*    addChild(player); /// must be added to a display object container, such as a Sprite instance
*
*
* NOTE: The only change to this snippet from that generated from the Publishing Module is the addition of playerID and publisherID
*        as arguments in the constructor.
*/
package {

    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.system.SecurityDomain;
    import flash.system.Security;

    public class BrightcovePlayer extends Sprite {

        private var bcPlayer:Object;

        public function BrightcovePlayer(pPlayerID:Number, pPublisherID:Number) {
            init(pPlayerID, pPublisherID);
        }
        
        private function init(pPlayerID:Number, pPublisherID:Number):void {
            var config:Object = new Object();

            // change the playerID to load a different player
            config["playerID"] = pPlayerID;
            config["publisherID"] = pPublisherID;
            config["width"] = 486;
            config["height"] = 412;
            // added to turn off initial warning message in player since no video appears on load
            config["suppressNoContentMessage"] = true;
        
            Security.allowDomain("http://admin.brightcove.com");
            createPlayer(config);
        }

        private function onPlayerLoadInit(pEvent:Event):void {
            var pLoaderInfo:LoaderInfo = pEvent.target as LoaderInfo;
            var pLoader:Loader = pLoaderInfo.loader;
            var pPlayer:Sprite = pLoaderInfo.content as Sprite;
            if (bcPlayer && pPlayer != bcPlayer) {
                if (bcPlayer.parent) {
                    bcPlayer.parent.removeChild(bcPlayer);
                }
            }
            bcPlayer = pPlayer;
            addChild(bcPlayer as Sprite);
            if (contains(pLoader)) removeChild(pLoader);
        }
    
        private function onPlayerLoadProgress(pEvent:ProgressEvent):void {
            // place preload feedback here for shell movie
        }

        private function createPlayer(config:Object):void {
            var cacheServerServices:String = "http://c.brightcove.com/services";
            var cdnURL:String = "http://admin.brightcove.com";
            
            var configItems:String = "";
            for (var i:String in config) {
               if (i == "flashID" || i == "width" || i == "height") continue;
               configItems += "&" + i + "=" + escape(config[i]);
            }
        
            var file:String = cacheServerServices + "/viewer/federated_f9/" +
                config["playerID"] + "?isVid=1" +
                "&flashID="+escape(config["flashID"])+
                "&playerWidth="+escape(config["width"])+
                "&playerHeight="+escape(config["height"])+
                configItems;
                            
            var player:Loader = new Loader();
            addChild(player);
            player.contentLoaderInfo.addEventListener(Event.INIT, onPlayerLoadInit);
            player.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onPlayerLoadProgress);
            var context:LoaderContext = new LoaderContext();
            context.applicationDomain = ApplicationDomain.currentDomain;
            player.load(new URLRequest(file), context);
        }

        public function onTemplateLoaded():void {
            dispatchEvent(new Event("templateLoaded"));
        }

        public function getModule(pModule:String):Object {
            return Object(bcPlayer).getModule(pModule);
        }

    }

}