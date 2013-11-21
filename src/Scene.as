package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	import objects.Particle;

	public class Scene extends Sprite
	{
		private var _bitmapData:BitmapData
		private var _bitmap:Bitmap
		private var _particles:Array

		public function Scene() 
		{
			trace("asdadasd")
			init()
		}
		private function init():void
		{

			_bitmapData = new BitmapData(1280,800,false,0x000000);
			_bitmap = new Bitmap(_bitmapData);
			addChild(_bitmap);

			//Create a set of random particles with a random velocity
			_particles = new Array();
			var vector:Vector.<BitmapData> = new Vector.<BitmapData>
			var rectangle:Shape = new Shape; // initializing the variable named rectangle
			rectangle.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
			rectangle.graphics.drawRect(0, 0, 10,10); // (x spacing, y spacing, width, height)
			rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
			var bmd:BitmapData = new BitmapData(rectangle.width,rectangle.height,true)
			bmd.draw(rectangle)
			vector.push(bmd)

			rectangle = new Shape; // initializing the variable named rectangle
			rectangle.graphics.beginFill(0xFFFFFF); // choosing the colour for the fill, here it is red
			rectangle.graphics.drawRect(0, 0, 10,10); // (x spacing, y spacing, width, height)
			rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill

			bmd = new BitmapData(rectangle.width,rectangle.height,true)
			bmd.draw(rectangle)
			vector.push(bmd)

			trace(vector.length)
			for(var i:int = 0; i<=4000; i++){
				_particles.push(new Particle(Math.random()*1280,Math.random()*800,Math.random()*2-1,Math.random()*2-1,vector));
			}
			//Wait to be added to stage
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		}
		private function onAddedToStage(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);

		}
		private function onEnterFrame(e:Event):void{
			//trace(stage.mouseX)
			_bitmapData.fillRect(_bitmapData.rect,0x000000);

			//Lock the bitmapdata, while we are updating it.
			_bitmapData.lock();

			//Draw particles
			var p:Particle;
			var l : int = _particles.length;
			for(var i:int = 0; i<l; i++){
				p = _particles[i];
				p.updateAndDraw(_bitmapData);
			}

			//We are done updating, unlock the bitmapdata
			_bitmapData.unlock();
		}
	}
}

