/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import flash.geom.Point;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.assetHandling.consts.AssetsIDs;
	import wheelOFun.assetHandling.model.AssetsModel;
	import wheelOFun.display.starling.enums.GameLayersEnum;
	import wheelOFun.display.starling.signal.AddViewToGameLayerSignal;
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	import wheelOFun.gameplay.model.WheelModel;
	import wheelOFun.gameplay.view.WheelView;
	
	public class CreateWheelViewCommand extends Command implements ICommand
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var wheelModel:WheelModel;
		
		[Inject]
		public var addViewToGameLayerSignal:AddViewToGameLayerSignal;
		
		override public function execute():void
		{
			var random:int = Math.round(Math.random() * 23);
			var value:Number = WheelModel.WHEEL_VALUES_IN_CIRCULAR_ORDER[random];
			var wheelImage:WheelView = new WheelView(assetsModel.getTexture(AssetsIDs.WHEEL));
			addViewToGameLayerSignal.dispatch(new ViewToLayerVO(GameLayersEnum.LAYER_GAMEPLAY.name, wheelImage, new Point(wheelImage.width / 2 + 50, wheelImage.height / 2 + 50)));
			wheelImage.rotation = wheelModel.getRotationAngle(value);
		}
	}
}
