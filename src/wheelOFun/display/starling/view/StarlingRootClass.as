package wheelOFun.display.starling.view
{

	import org.osflash.signals.Signal;

	import starling.display.Sprite;
	import starling.events.Event;

	public class StarlingRootClass extends Sprite implements IStarlingRootClass
	{
		public function StarlingRootClass()
		{
			super();
			onAddedToStageSignal = new Signal();
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}

		public var onAddedToStageSignal:Signal;

		private function onAddedToStage( event:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			onAddedToStageSignal.dispatch();
			onAddedToStageSignal.removeAll();
		}
	}
}