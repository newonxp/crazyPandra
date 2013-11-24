package objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	public class Particle
	{
		public var x:Number;
		public var y:Number;
		public var rotation:Number
		public var velX:Number;
		public var velY:Number;
		private var rectangle:Shape
		private var bmd:BitmapData
		private var _bmds:Vector.<BitmapData>
		private var _frame:int=0
		private var _rect:Rectangle

		public function Particle(x:Number, y:Number, velX:Number, velY:Number, bmds:Vector.<BitmapData>)
		{
			_bmds=bmds
			this.x=x;
			this.y=y;
			this.rotation=0
			this.velX=velX;
			this.velY=velY;
			_rect=new Rectangle(this.x, this.y, _bmds[0].width, bmds[0].height)
		}


		public function updateAndDraw(toBitmapData:BitmapData):void
		{
			//_frame++
			if (_frame == 2)
			{
				_frame=0
			}
			this.x+=velX;
			this.y+=velY;
			this.rotation+=0.01
			_rect.x=this.x
			_rect.y=this.y
			//toBitmapData.setPixel(this.x,this.y,0xFFFFFF);
			var m:Matrix=new Matrix();
			m.rotate(rotation);
			m.translate(this.x, this.y);
			toBitmapData.draw(_bmds[_frame], m)
		}

	}

}


