package wheelOFun.display.starling.view
{
	
	import org.osflash.signals.Signal;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class StarlingGameLayerContainerView extends Sprite
	{
		public function StarlingGameLayerContainerView()
		{
			_onAddedToStageSignal = new Signal();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private var _onAddedToStageSignal:Signal;
		
		public function get onAddedToStageSignal():Signal
		{
			return _onAddedToStageSignal;
		}
		
		public function addLayer(view:Object):void
		{
			addChild(view as DisplayObject);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_onAddedToStageSignal.dispatch();
			_onAddedToStageSignal.removeAll();
		}
	}
}