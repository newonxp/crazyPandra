package
{
	import flash.display.Sprite;

	public class Game extends Sprite
	{
		private var _scene:Scene
		public function Game()
		{
			super();
			_scene = new Scene()
			addChild(_scene)
		}
	}
}

