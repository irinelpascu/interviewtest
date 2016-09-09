package wheelOFun.display.starling.view
{
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	
	public class StarlingGameLayerContainerView extends Sprite implements IStarlingGameLayerContainerView
	{
		private var _gameLayers:Dictionary;
		private var _onAddedToStageSignal:Signal;
		
		public function get onAddedToStageSignal():Signal
		{
			return _onAddedToStageSignal;
		}
		
		public function StarlingGameLayerContainerView()
		{
			_onAddedToStageSignal = new Signal();
			_gameLayers = new Dictionary();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function addViewToGameLayer(viewToLayerVO:ViewToLayerVO):void
		{
			var gameLayer:Sprite = _gameLayers[viewToLayerVO.layerName];
			gameLayer.addChild(viewToLayerVO.viewObject);
		}
		
		public function addGameLayer(gameLayerName:String):void
		{
			var gameLayer:Sprite = new Sprite();
			addChild(gameLayer);
			_gameLayers[gameLayerName] = gameLayer;
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_onAddedToStageSignal.dispatch();
			_onAddedToStageSignal.removeAll();
		}
	}
}