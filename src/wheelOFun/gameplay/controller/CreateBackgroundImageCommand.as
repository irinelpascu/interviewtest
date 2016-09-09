/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import flash.geom.Point;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import starling.core.Starling;
	
	import starling.display.Image;
	
	import wheelOFun.assetHandling.consts.AssetsIDs;
	
	import wheelOFun.assetHandling.model.AssetsModel;
	
	import wheelOFun.display.starling.enums.GameLayersEnum;
	
	import wheelOFun.display.starling.signal.AddViewToGameLayerSignal;
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	
	public class CreateBackgroundImageCommand extends Command implements ICommand
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var addViewToGameLayerSignal:AddViewToGameLayerSignal;
		
		override public function execute():void
		{
			var bgImage:Image = new Image(assetsModel.getTexture(AssetsIDs.BACKGROUND_IMAGE));
			bgImage.textureRepeat = true;
			bgImage.width = Starling.current.stage.stageWidth;
			bgImage.height = Starling.current.stage.stageHeight;
			addViewToGameLayerSignal.dispatch(new ViewToLayerVO(GameLayersEnum.LAYER_BACKGROUND.name, bgImage, new Point(0, 0)));
		}
	}
}
