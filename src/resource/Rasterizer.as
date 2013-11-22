package resource
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	public class Rasterizer extends Sprite
	{
		private var _xml:XML
		private var _objects:Vector.<Object>
		private var _callback:Function
		private var _currentResId:String
		private var _frameBuffer:Vector.<BitmapData>
		private var _resNo:int
		public function Rasterizer(callback:Function)
		{
			_xml = Game.resources.get_xml(Config.config_rasterize).data
			_objects = new Vector.<Object>
			_callback = callback
			_resNo=0
		}
		public function start():void{
			for(var i:int=0;i<_xml.mc.length();i++){ 
				var obj:Object = new Object()
				obj.data = Game.resources.get_img(_xml.mc[i].@id)
				obj.id=_xml.mc[i].@id
				_objects.push(obj)
			}
			nextRes()
		}
		private function nextRes():void{
			if(_resNo <_objects.length){
				rasterizeRes(_objects[_resNo].id,_objects[_resNo].data)
				_resNo++
			}else{
				_callback()
			}
		}
		public function rasterizeRes(id:String,res:Resource):void{
			_currentResId = id
			_frameBuffer = new Vector.<BitmapData>
			var _mc:MovieClip = addChild(res.data as MovieClip) as MovieClip
			_mc.addEventListener(Event.ENTER_FRAME,onEnterFrame)
		}
		private function onEnterFrame(e:Event):void{
			var a:BitmapData = new BitmapData(e.target.width,e.target.height,true);
			a.draw(e.target as MovieClip)
			_frameBuffer.push(a)
			if(e.target.currentFrame==e.target.totalFrames){
				e.target.stop()
				mcRasterized(e.target as MovieClip)
			}
		}
		private function mcRasterized(mc:MovieClip):void{
			Game.resources.set_img(_currentResId,_frameBuffer)
			mc.removeEventListener(Event.ENTER_FRAME,onEnterFrame)
			removeChild(mc)
			nextRes()
		}
	}
}

