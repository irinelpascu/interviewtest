/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assetHandling.controller
{
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	
	import flash.display.Bitmap;
	
	import flash.display.Loader;
	
	import flash.events.Event;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import starling.textures.Texture;
	
	import treefortress.sound.SoundAS;
	import treefortress.sound.SoundInstance;
	
	import wheelOFun.assetHandling.consts.AssetsConsts;
	import wheelOFun.assetHandling.enum.AssetTypeEnum;
	import wheelOFun.assetHandling.model.AssetsModel;
	import wheelOFun.assetHandling.model.vo.IPendingAsset;
	import wheelOFun.assetHandling.model.vo.ImagePendingAsset;
	import wheelOFun.assetHandling.model.vo.SoundPendingAsset;
	import wheelOFun.assetHandling.namespaces.assets_model_internal;
	
	use namespace assets_model_internal;
	
	public class LoadAssetsCommand extends AsyncCommand implements ICommand
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		private var _loader:Loader;
		private var _currentAsset:IPendingAsset;
		
		override public function execute():void
		{
			loadNext();
		}
		
		private function loadNext():void
		{
			_currentAsset = assetsModel.getNextPendingAsset();
			
			if (_currentAsset is ImagePendingAsset)
			{
				_loader = new Loader();
				_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
				_loader.load(new URLRequest(_currentAsset.getURL()));
			}
			else if (_currentAsset is SoundPendingAsset)
			{
				SoundAS.loadCompleted.add(onSoundLoaded);
				SoundAS.loadSound(_currentAsset.getURL(), _currentAsset.getID());
			}
			else if (_currentAsset == null)
			{
				dispatchComplete(true);
			}
		}
		
		private function onSoundLoaded(soundInstance:SoundInstance):void
		{
			trace("Sound with id:" + soundInstance.type + " and url:" + soundInstance.url + "was successfully loaded");
			
			loadNext();
		}
		
		private function onImageLoaded(event:Event):void
		{
			// grab the loaded bitmap
			var loadedBitmap:Bitmap = event.currentTarget.loader.content as Bitmap;
			// create a texture from the loaded bitmap
			var texture:Texture = Texture.fromBitmap ( loadedBitmap );
			
			assetsModel.addTexture(_currentAsset.getID(), texture);
			
			trace("Asset with id:" + _currentAsset.getID() + " and url:" + _currentAsset.getURL() + "was successfully loaded");
			
			loadNext();
		}
	}
}
