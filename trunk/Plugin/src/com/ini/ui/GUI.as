package com.ini.ui
{
    import flash.display.GradientType;
    import flash.display.SimpleButton;
    import flash.display.SpreadMethod;
    import flash.display.Sprite;
    import flash.geom.Matrix;
    import flash.text.*;
    
    public class GUI extends Sprite {
        private var _txt:String;
        private var _gType:String;
        private var _gColors:Array;
        private var _gAlphas:Array;
        private var _gRatio:Array;
        private var _gMatrix:Matrix 		= new Matrix();
        private var _gSpread:String;
        private var _padding:Number 		= 10;
        private var _rad:Number 			= 10;

        private var color:Array = [0xCECECE, 0xEBEBEB]
//        public function Gui() {
//
//        }
		public function setColorGradient(cArray:Array):void{
			this.color=cArray;
		}
		public function setPadding(pad:Number):void{
			_padding=pad;
		}
		public function setRadius(rad:Number):void{
			_rad=rad;
		}		
        public function GuiButton( _t:String ):SimpleButton {
            _txt = _t;
            var btn:SimpleButton = new SimpleButton();
            btn.upState = GuiButtonUp();
            btn.overState = GuiButtonOver();
            btn.downState = btn.upState
            btn.hitTestState = btn.upState;
            return btn;
        }

        private function GuiButtonUp():Sprite {
            var btnLabel:TextField = GuiButtonText(this._txt);
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
            var btnLabel:TextField = GuiButtonText(this._txt);
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
            txtField.autoSize = TextFieldAutoSize.CENTER;
            txtField.antiAliasType = AntiAliasType.ADVANCED;
            txtField.selectable = false;
            txtField.setTextFormat( txtFormat );
            return txtField;
        }

        private function GuiButtonGraphics(btnLabel:TextField):Sprite {
            var _graphics:Sprite = new Sprite();
            _gType = GradientType.LINEAR;
            _gColors = color;
            _gAlphas = [1, 1];
            _gRatio = [0,255];
            _gMatrix.createGradientBox(btnLabel.width+_padding, btnLabel.height+_padding, 55, 0, 0);
            _gSpread = SpreadMethod.PAD;
            _graphics.graphics.beginGradientFill(_gType, _gColors, _gAlphas, _gRatio, _gMatrix, _gSpread);
            _graphics.graphics.drawRoundRect(0, 0, btnLabel.width+_padding, btnLabel.height+_padding, _rad, _rad);
            _graphics.graphics.endFill();

            return _graphics;

        }

    }
}
