package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	import objects.BmdMovieClip;

	import resource.Rasterizer;
	import resource.Resource;
	import resource.ResourceManager;
	import resource.ResourcePreloader;

	public class Game extends Sprite
	{
		private var _scene:Scene
		private static var _resources:ResourceManager
		private static var _resourcePreloader:ResourcePreloader
		private static var _rasterizer:Rasterizer
		private var _state:int=0
		private var _bitmap:Bitmap

		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
		}

		private function onAddedToStage(e:Event):void
		{
			init()
		}

		private function init():void
		{
			_resources=new ResourceManager("ru", "1")
			_resources.set_host(Config.host)
			_resourcePreloader=new ResourcePreloader(allLoaded)
			_resourcePreloader.load()
		}

		private function allLoaded():void
		{
			/*			var mc:flash.display.MovieClip=_resources.get_img("swf/star.swf@star").data as flash.display.MovieClip
						mc.x=10
						mc.y=10
						addChild(mc)*/
			_rasterizer=new Rasterizer(rasterized)
			_rasterizer.start()
		}

		private function rasterized():void
		{
			//_scene.add
			//	addEventListener(Event.ENTER_FRAME,test)
			_scene=new Scene()
			addChild(_scene)
		}

		private function test(e:Event):void
		{
			if (_bitmap)
			{
				removeChild(_bitmap)
			}
			var res:Resource=_resources.get_img("swf/star.swf@star")
			var bmd:BitmapData=res.data[_state] as BitmapData
			_bitmap=new Bitmap(bmd)
			_bitmap.x=100
			_bitmap.y=100
			addChild(_bitmap)
			_state++
			if (_state >= res.data.length)
			{
				_state=0
			}
		}

		public static function get resources():ResourceManager
		{
			return _resources
		}

	}
}

