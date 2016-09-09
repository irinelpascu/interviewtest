package wheelOFun.display.starling.enums
{
	
	import org.as3commons.lang.Enum;
	
	public class GameLayersEnum extends Enum
	{
		public static const LAYER_BACKGROUND = new GameLayersEnum("LAYER_BACKGROUND");
		public static const LAYER_GAMEPLAY = new GameLayersEnum("LAYER_GAMEPLAY");
		public static const LAYER_UI = new GameLayersEnum("LAYER_UI");
		public static const LAYER_DIALOGS = new GameLayersEnum("LAYER_DIALOGS");
		public static const LAYER_LOADER = new GameLayersEnum("LAYER_LOADER");
		
		public function GameLayersEnum(name:String = "")
		{
			super(name);
		}
		
		public static function get gameLayerList():Vector.<GameLayersEnum>
		{
			var list:Vector.<GameLayersEnum> = new Vector.<GameLayersEnum>();
			list.push(LAYER_BACKGROUND, LAYER_GAMEPLAY, LAYER_UI, LAYER_DIALOGS, LAYER_LOADER);
			return list;
		}
	}
}