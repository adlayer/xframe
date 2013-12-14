package {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Shape;
	import flash.text.TextField;
	
	import flash.net.URLRequest;
	import flash.events.*;
	import flash.external.*;
	import flash.system.*;
	
	public class Main extends Sprite {
		Security.allowDomain('*');
		public var queries:Object = root.loaderInfo.parameters;
		public var link:URLRequest = new URLRequest(queries["link"]);
		public var adUrl:URLRequest = new URLRequest(queries["src"]);
		public var loader:Loader = new Loader();
		
		public function Main() {
			loader.load(adUrl);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loaded);
			addChild(loader);
			
			//var tf:TextField = new TextField();
			//tf.text = 'skate';
			//addChild(tf);
		}
		
		public function openLink (e:MouseEvent):void{
			ExternalInterface.call('open', queries['link']);
		}
		
		public function loaded (e:Event):void{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.stageWidth = loader.contentLoaderInfo.width;
			stage.stageHeight = loader.contentLoaderInfo.height;
			
			var button:Sprite = new Sprite();
			button.graphics.beginFill(0,0);
			button.graphics.drawRect(0, 0, loader.contentLoaderInfo.width,loader.contentLoaderInfo.height); // (x spacing, y spacing, width, height)
			button.graphics.endFill();
			button.buttonMode  = true;
			button.mouseChildren = false;
			button.addEventListener(MouseEvent.CLICK, openLink);
			addChild(button);
			
			//var flashVersion:String = loader.contentLoaderInfo.swfVersion;
		
			var callback:String = this.queries['callback'];
			ExternalInterface.call(callback,this.queries['value']);
		}
	}
}