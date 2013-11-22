package resource
{
	import resource.Resource;
	import resource.ResourcePack;


	public class ResourcePreloader
	{
		private var _resourcesLoading:int=0
		private var _resourcesLoaded:int=0
		private var _callback:Function

		public function ResourcePreloader(callback:Function=null)
		{
			_callback=callback
		}

		public function load():void
		{

			Game.resources.load_locale_config(Config.config_locale, localeXmlLoaded)
		}

		private function localeXmlLoaded():void
		{
			Game.resources.load_xml(Config.config_preload, preloadXmlLoaded)
		}

		private function preloadXmlLoaded(res:Resource):void
		{
			var xml:XML=res.data
			var pack:ResourcePack=new ResourcePack()
			for each (var i:XML in xml.children())
			{
				_resourcesLoading++
				if (i.name() == "xml"){
					Game.resources.load_resource(Resource.type_xml, i.@id, resourceLoaded)
				}
				else if (i.name() == "img"){
					Game.resources.load_resource(Resource.type_img, i.@id, resourceLoaded)
				}
				else if (i.name() == "snd"){
					Game.resources.load_resource(Resource.type_snd, i.@id, resourceLoaded)
				}
			}
		}

		private function resourceLoaded(res:Resource):void
		{
			_resourcesLoaded++
			if (_resourcesLoaded == _resourcesLoading)
			{
				if (_callback != null)
				{
					_callback()
				}
			}
		}
	}
}

