/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import eu.alebianco.robotlegs.utils.api.IAsyncCommand;
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	
	import flash.geom.Point;
	
	import starling.display.Image;
	
	import starling.events.Event;
	
	import wheelOFun.assetHandling.consts.AssetsIDs;
	import wheelOFun.assetHandling.model.AssetsModel;
	import wheelOFun.display.starling.enums.GameLayersEnum;
	import wheelOFun.display.starling.signal.AddViewToGameLayerSignal;
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	import wheelOFun.gameplay.model.WheelModel;
	import wheelOFun.gameplay.view.WheelView;
	
	public class CreateWheelViewCommand extends AsyncCommand implements IAsyncCommand
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var wheelModel:WheelModel;
		
		[Inject]
		public var addViewToGameLayerSignal:AddViewToGameLayerSignal;
		
		override public function execute():void
		{
			var wheelImage:WheelView = new WheelView(assetsModel.getTexture(AssetsIDs.WHEEL));
			wheelImage.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addViewToGameLayerSignal.dispatch(new ViewToLayerVO(GameLayersEnum.LAYER_GAMEPLAY.name, wheelImage, new Point(wheelImage.width / 2 + 250, wheelImage.height / 2 + 50)));
			var arrow:Image = new Image(assetsModel.getTexture(AssetsIDs.ARROW));
			arrow.pivotX = arrow.width / 2;
			addViewToGameLayerSignal.dispatch(new ViewToLayerVO(GameLayersEnum.LAYER_GAMEPLAY.name, arrow, new Point(wheelImage.x, 10)));
		}
		
		private function onAddedToStage(event:Event):void
		{
			dispatchComplete(true);
		}
	}
}
