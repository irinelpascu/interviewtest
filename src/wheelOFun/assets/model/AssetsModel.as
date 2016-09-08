/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assets.model
{
	import flash.utils.Dictionary;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	import wheelOFun.assets.model.vo.IPendingAsset;
	import wheelOFun.assets.namespaces.assets_model_internal;
	
	use namespace assets_model_internal;

	public class AssetsModel
	{
		private var _textures:Dictionary;
		private var _pendingAssets:Vector.<IPendingAsset>;
		
		public function AssetsModel()
		{
			_textures = new Dictionary();
			_pendingAssets = new Vector.<IPendingAsset>;
		}
		
		public function addTexture(assetID:String, texture:Texture):void
		{
			_textures[assetID] = texture;
		}
		
		assets_model_internal function addPendingAsset(pendingAsset:IPendingAsset):void
		{
			_pendingAssets.push(pendingAsset);
		}
		
		assets_model_internal function getNextPendingAsset():IPendingAsset
		{
			if (_pendingAssets.length)
			{
				return _pendingAssets.shift();
			}
			return null;
		}
	}
}
