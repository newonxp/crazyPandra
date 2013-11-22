package objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;

	public class Canvas extends Sprite
	{
		private var _width:Number 
		private var _height:Number 
		private var _color:uint
		private var _bitmapData:BitmapData
		private var _canvas:Bitmap
		private var _objects:Vector.<Object> 
		public function Canvas(width:Number=100,height:Number=100,color:uint=0xFFFFFF)
		{
			_width=width
			_height=height
			_color=color
			addEventListener(Event.ADDED_TO_STAGE,onAddedToStage)
		}
		private function onAddedToStage(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage)
			init()
		}
		private function init():void{
			_objects = new Vector.<Object>
			_bitmapData = new BitmapData(_width,_height,false,_color);
			_canvas = new Bitmap(_bitmapData);
			addChild(_canvas);
		}
		private function addObject(obj:Object):void{
			_objects.push(obj)
		}
		override public function get numChildren():int{
			return _objects.length
		}

	}
}

