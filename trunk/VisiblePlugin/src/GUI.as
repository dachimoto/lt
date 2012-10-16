package {
    import flash.display.Sprite;
    import flash.display.GradientType;
    import flash.display.Graphics;
    import flash.display.SpreadMethod;
    import flash.geom.Matrix;
    import flash.display.SimpleButton;
    import flash.text.*;
    import flash.text.TextFieldType;
    import flash.text.TextFieldAutoSize;
    import flash.display.MovieClip;
    
    public class GUI extends Sprite {
        private var txt:String;

        private var gType:String;

        private var gColors:Array;

        private var gAlphas:Array;

        private var gRatio:Array;

        private var gMatrix:Matrix = new Matrix();

        private var gSpread:String;

        public var padding:Number = 10;

        public var rad:Number = 10;

        public var color:Array = [0xCECECE, 0xEBEBEB]
//        public function Gui() {
//
//        }
        public function GuiButton( _t:String ):SimpleButton {
            this.txt = _t;
            var btn:SimpleButton = new SimpleButton();
            btn.upState = GuiButtonUp();
            btn.overState = GuiButtonOver();
            btn.downState = btn.upState
            btn.hitTestState = btn.upState;
            return btn;
        }

        private function GuiButtonUp():Sprite {
            var btnLabel:TextField = GuiButtonText(this.txt);
            var btnUp:Sprite = GuiButtonGraphics(btnLabel);
            btnLabel.x = (btnUp.width - btnLabel.width) / 2;
            btnLabel.y = (btnUp.height - btnLabel.height) / 2;
            btnUp.addChild(btnLabel);
            return btnUp;
        }
        /*
        private function GuiButtonDown():Sprite {
        }*/
        private function GuiButtonOver():Sprite {
            color = [color[1], color[0]]
            var btnLabel:TextField = GuiButtonText(this.txt);
            var btnDown:Sprite = GuiButtonGraphics(btnLabel);
            btnLabel.x = (btnDown.width - btnLabel.width) / 2;
            btnLabel.y = (btnDown.height - btnLabel.height) / 2;
            btnDown.addChild(btnLabel);
            return btnDown;
        }

        /*
        private function GuiButtonHit():Sprite {

        }*/

        private function GuiButtonText( _txt:String ):TextField {
            var txtFormat:TextFormat = new TextFormat();
            txtFormat.color = 0xffffff;
            txtFormat.font = "Arial";
            txtFormat.size = 12;
            txtFormat.bold=true;
            txtFormat.align = "center";
            
            var txtField:TextField = new TextField();
            txtField.htmlText = _txt;
            txtField.x = 0;
            txtField.y = 0;
            txtField.autoSize = TextFieldAutoSize.LEFT;
            txtField.antiAliasType = AntiAliasType.ADVANCED;
            txtField.selectable = false;
            txtField.setTextFormat( txtFormat );
            return txtField;
        }

        private function GuiButtonGraphics(btnLabel:TextField):Sprite {
            var _graphics:Sprite = new Sprite();
            gType = GradientType.LINEAR;
            gColors = color;
            gAlphas = [1, 1];
            gRatio = [0,255];
            gMatrix.createGradientBox(btnLabel.width+padding, btnLabel.height+padding, 55, 0, 0);
            gSpread = SpreadMethod.PAD;
            _graphics.graphics.beginGradientFill(gType, gColors, gAlphas, gRatio, gMatrix, gSpread);
            _graphics.graphics.drawRoundRect(0, 0, btnLabel.width+padding, btnLabel.height+padding, rad, rad);
            _graphics.graphics.endFill();

            return _graphics;

        }

    }
}
