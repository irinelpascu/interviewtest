package wheelOFun.display.starling.view
{
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	import wheelOFun.display.starling.signal.AddViewToStarlingRootClassSignal;
	import wheelOFun.display.starling.signal.StarlingRootClassReadySignal;
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.impl.StarlingMediator;
	
	public class StarlingRootClassMediator extends StarlingMediator implements IMediator
	{
		[Inject]
		public var view:StarlingRootClass;
		
		[Inject]
		public var starlingRootClassReadySignal:StarlingRootClassReadySignal;
		
		[Inject]
		public var addViewToStarlingRootClassSignal:AddViewToStarlingRootClassSignal;
		
		override public function initialize():void
		{
			super.initialize();
			addViewToStarlingRootClassSignal.add(addView);
			view.onAddedToStageSignal.addOnce(view_onAddedToStage);
		}
		
		override public function destroy():void
		{
			addViewToStarlingRootClassSignal.remove(addView);
			view.onAddedToStageSignal.remove(view_onAddedToStage);
			super.destroy();
		}
		
		private function addView(viewClass:Class):void
		{
			view.addChild(new viewClass());
		}
		
		private function view_onAddedToStage():void
		{
			starlingRootClassReadySignal.dispatch();
		}
	}
}