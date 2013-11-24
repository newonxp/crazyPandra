package
{
	import flash.display.BitmapData;

	import objects.BmdMovieClip;

	public class Snowflake extends BmdMovieClip
	{
		private var _shiftX:Number
		private var _shiftY:Number
		private var _overed:Boolean

		public function Snowflake(sequence:Vector.<BitmapData>)
		{
			_shiftX=2 + 2 * Math.random()
			_shiftY=2 + 2 * Math.random()
			super(sequence);
		}

		override public function onMouseOver():void
		{
			//trace("onMouseOver")
			outline=true
			_overed=true
		}

		override public function onMouseOut():void
		{
			outline=false
			_overed=false
		}

		override public function updateAndDraw():void
		{
			if (!_overed)
			{
				x+=_shiftX
				y+=_shiftY
			}
			if (x > 1280)
			{
				x=-this.width
			}
			if (y > 800)
			{
				y=-this.height
			}
			super.updateAndDraw()
		}
	}
}
