package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;

	import resource.Rasterizer;
	import resource.ResourceManager;
	import resource.ResourcePreloader;

	public class Game extends Sprite
	{
		private var _scene:Scene
		private static var _resources:ResourceManager
		private static var _resourcePreloader:ResourcePreloader
		private static var _rasterizer:Rasterizer
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,onAddedToStage)
		}
		private function onAddedToStage(e:Event):void{
			init()
		}
		private function init():void{
			_resources = new ResourceManager("ru","1")
			_resources.set_host(Config.host)
			_resourcePreloader = new ResourcePreloader(allLoaded)
			_resourcePreloader.load()
		}
		private function allLoaded():void{
			_rasterizer = new Rasterizer(rasterized)
			_rasterizer.start()
			//_scene = new Scene()
			//addChild(_scene)
		}

		private function rasterized():void{
			var bmd:BitmapData=_resources.get_img("swf/star.swf@star").data[10] as BitmapData
			var bitmap:Bitmap = new Bitmap(bmd)
			addChild(bitmap)
		}
		public static function get resources():ResourceManager
		{
			return _resources
		}

	}
}

