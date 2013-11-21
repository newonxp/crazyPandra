package
{
	import flash.display.Sprite;

	[SWF(width="1200", height="800", frameRate="60", backgroundColor="#053557")]
	public class objectsTest extends Sprite
	{
		private var _game:Game 
		public function objectsTest()
		{
			_game = new Game()
			addChild(_game)
		}
	}
}

