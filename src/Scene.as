package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	import objects.BmdImage;
	import objects.BmdMovieClip;
	import objects.Canvas;
	import objects.Particle;

	public class Scene extends Sprite
	{
		private var _bitmapData:BitmapData
		private var _bitmap:Bitmap
		private var _particles:Array

		private var _canvas:Canvas

		public function Scene()
		{
			init()
		}

		private function init():void
		{
			_canvas=new Canvas(1280, 800, 0xFFFFFF)
			addChild(_canvas)
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			var bg:BmdImage=new BmdImage(Game.resources.get_img("img/pic.jpg").data.bitmapData)
			_canvas.addObject(bg)
			for (var i:int=0; i <= 4000; i++)
			{
				var mc:Snowflake=new Snowflake(Game.resources.get_img("swf/star.swf@star").data)
				_canvas.addObject(mc)
				mc.x=Math.random() * 1280
				mc.y=Math.random() * 800
			}

		}

	}
}

