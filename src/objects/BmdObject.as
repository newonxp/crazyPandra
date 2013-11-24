package objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;

	public class BmdObject
	{
		private var _x:Number=0
		private var _y:Number=0
		private var _width:Number=0
		private var _height:Number=0
		private var _canvas:BitmapData
		private var _bmd:BitmapData
		private var _outline:Boolean

		public function BmdObject()
		{

		}

		public function setBitmapData(canvas:BitmapData):void
		{
			_canvas=canvas
		}

		public function onMouseOver():void
		{
		}

		public function onMouseOut():void
		{
		}

		public function updateAndDraw():void
		{
			_width=_bmd.width
			_height=_bmd.height
			var m:Matrix=new Matrix();
			//m.rotate(rotation);
			m.translate(_x, _y);
			if (_outline == true)
			{
				_bmd=addOutline(_bmd)
			}
			_canvas.draw(_bmd, m)
		}

		public function addOutline(_bmd:BitmapData):BitmapData
		{
			var canvas:BitmapData=new BitmapData(_bmd.width + 10, _bmd.height + 10, true, 0x00ffffff);
			var outline:BitmapData=new BitmapData(_bmd.width, _bmd.height, true, 0xFFFF00FF);
			var p:Point=new Point(0, 0);
			for (var i:int=1; i <= 3; i++)
			{
				canvas.copyPixels(outline, outline.rect, new Point(p.x - i, p.y), _bmd, null, true);
				canvas.copyPixels(outline, outline.rect, new Point(p.x + i, p.y), _bmd, null, true);
				canvas.copyPixels(outline, outline.rect, new Point(p.x, p.y + i), _bmd, null, true);
				canvas.copyPixels(outline, outline.rect, new Point(p.x, p.y - i), _bmd, null, true);
			}
			canvas.copyPixels(_bmd, _bmd.rect, p, null, null, true);
			return canvas
		}

		public function removeOutline(_bmd:BitmapData):void
		{

		}

		public function set outline(val:Boolean):void
		{
			_outline=val
		}

		public function set bmd(val:BitmapData):void
		{
			_bmd=val
		}

		public function get bmd():BitmapData
		{
			return _bmd
		}

		public function set x(val:Number):void
		{
			_x=val
		}

		public function set y(val:Number):void
		{
			_y=val
		}

		public function get outline():Boolean
		{
			return _outline
		}

		public function get x():Number
		{
			return _x
		}

		public function get y():Number
		{
			return _y
		}

		public function set width(val:Number):void
		{
			_width=val
		}

		public function set height(val:Number):void
		{
			_height=val
		}

		public function get width():Number
		{
			return _width
		}

		public function get height():Number
		{
			return _height
		}


	}
}
