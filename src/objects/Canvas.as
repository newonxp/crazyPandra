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
		private var _objects:Vector.<BmdObject>
		private var _overedObject:BmdObject

		public function Canvas(width:Number=100, height:Number=100, color:uint=0xFFFFFF)
		{
			_width=width
			_height=height
			_color=color
			_objects=new Vector.<BmdObject>
			_bitmapData=new BitmapData(_width, _height, false, _color);
			_canvas=new Bitmap(_bitmapData);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
		}

		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
			init()
		}

		private function init():void
		{
			addChild(_canvas);
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
		}

		private function onEnterFrame(e:Event):void
		{
			_bitmapData.fillRect(_bitmapData.rect, 0x000000);
			_bitmapData.lock();
			var obj:BmdObject;
			var obj_top:BmdObject
			var allObjects:int=_objects.length;
			var mOver:Boolean=false
			for (var i:int=0; i < allObjects; i++)
			{
				obj=_objects[i];
				obj_top=_objects[allObjects - i - 1];
				if (checkMouseOver(obj_top) && mOver == false)
				{
					if (_overedObject != null && _overedObject != obj_top)
					{
						_overedObject.onMouseOut()
					}
					_overedObject=obj_top
					obj_top.onMouseOver()
					mOver=true
				}
				obj.updateAndDraw();

			}
			_bitmapData.unlock();
		}

		public function addObject(obj:BmdObject):void
		{
			obj.setBitmapData(_bitmapData)
			_objects.push(obj)
		}

		private function checkMouseOver(obj:BmdObject):Boolean
		{
			if (stage.mouseX > obj.x && stage.mouseX < obj.x + obj.width && stage.mouseY > obj.y && stage.mouseY < obj.y + obj.height)
			{
				return true
			}
			return false
		}

		override public function get numChildren():int
		{
			return _objects.length
		}

	}
}

