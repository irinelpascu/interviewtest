/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.display.starling.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	import wheelOFun.display.starling.signal.AddGameLayerSignal;
	import wheelOFun.display.starling.signal.AddViewToGameLayerSignal;
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	
	public class StarlingGameLayerContainerViewMediator extends Mediator implements IMediator
	{
		[Inject]
		public var starlingGameLayerContainerView:IStarlingGameLayerContainerView;
		
		[Inject]
		public var addGameLayerSignal:AddGameLayerSignal;
		
		[Inject]
		public var addViewToGameLayerSignal:AddViewToGameLayerSignal;
		
		override public function initialize():void
		{
			super.initialize();
			addGameLayerSignal.add(addGameLayer);
			addViewToGameLayerSignal.add(addViewToGameLayer);
			starlingGameLayerContainerView.onAddedToStageSignal.addOnce(onViewAddedToStage);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		private function onViewAddedToStage():void
		{
			
		}
		
		private function addViewToGameLayer(viewToLayerVO:ViewToLayerVO):void
		{
			starlingGameLayerContainerView.addViewToGameLayer(viewToLayerVO);
		}
		
		private function addGameLayer(gameLayerName:String):void
		{
			starlingGameLayerContainerView.addGameLayer(gameLayerName);
		}
	}
}
