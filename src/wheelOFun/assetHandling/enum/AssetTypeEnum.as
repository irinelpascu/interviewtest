/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assetHandling.enum
{
	import org.as3commons.lang.Enum;
	
	import wheelOFun.assetHandling.model.vo.ImagePendingAsset;
	
	import wheelOFun.assetHandling.model.vo.SoundPendingAsset;
	
	public class AssetTypeEnum extends Enum
	{
		public static const SOUND_ASSET:AssetTypeEnum = new AssetTypeEnum("SOUND_ASSET", "sound", SoundPendingAsset);
		public static const IMAGE_ASSET:AssetTypeEnum = new AssetTypeEnum("IMAGE_ASSET", "image", ImagePendingAsset);
		
		public static function getAll():Vector.<AssetTypeEnum>
		{
			return new <AssetTypeEnum>[SOUND_ASSET, IMAGE_ASSET];
		}
		
		public static function getEnumByType(type:String):AssetTypeEnum
		{
			var allEnums:Vector.<AssetTypeEnum> = getAll();
			for (var i:int = 0; i < allEnums.length; i++)
			{
				if (allEnums[i].type == type)
				{
					return allEnums[i];
				}
			}
			return null;
		}
		
		private var _type:String;
		private var _classDef:Class;
		
		public function get type():String
		{
			return _type;
		}
		
		public function AssetTypeEnum(name:String, type:String, classDef:Class)
		{
			super(name);
			_type = type;
			_classDef = classDef;
		}
		
		public function get classDef():Class
		{
			return _classDef;
		}
	}
}
