package objects
{
	import flash.display.BitmapData;

	public class BmdMovieClip extends BmdObject
	{
		private var _sequence:Vector.<BitmapData>
		private var _currentFrame:int

		public function BmdMovieClip(sequence:Vector.<BitmapData>)
		{
			_sequence=sequence
			_currentFrame=0
		}

		override public function updateAndDraw():void
		{
			_currentFrame++
			if (_currentFrame >= _sequence.length)
			{
				_currentFrame=0
			}
			bmd=_sequence[_currentFrame]
			super.updateAndDraw()
		}
	}
}
