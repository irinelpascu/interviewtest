/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assetHandling.controller
{
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.assetHandling.consts.AssetsConsts;
	import wheelOFun.assetHandling.enum.AssetTypeEnum;
	import wheelOFun.assetHandling.model.AssetsModel;
	import wheelOFun.assetHandling.model.vo.IPendingAsset;
	import wheelOFun.assetHandling.namespaces.assets_model_internal;
	
	use namespace assets_model_internal;
	
	public class LoadAndParseAssetsDefinitionCommand extends AsyncCommand implements ICommand
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		private var _loader:URLLoader;
		
		override public function execute():void
		{
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, onAssetLoaded);
			_loader.load(new URLRequest(AssetsConsts.ASSETS_DEFINITION_URL));
		}
		
		private function onAssetLoaded(event:Event):void
		{
			var pendingAsset:IPendingAsset;
			var assetClass:Class;
			var assetsDefinitionsXML:XML = new XML(event.target.data);
			
			for each(var asset:XML in assetsDefinitionsXML.assets.asset)
			{
				assetClass = AssetTypeEnum.getEnumByType(asset.@type).classDef;
				if (assetClass)
				{
					pendingAsset = new assetClass(asset.@id, asset.@url);
					assetsModel.addPendingAsset(pendingAsset);
				}
			}
			dispatchComplete(true);
		}
	}
}
