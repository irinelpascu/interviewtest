package wheelOFun.display.starling.view
{
	
	import starling.display.Stage;
	
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.impl.StarlingMediator;
	
	public class StarlingStageMediator extends StarlingMediator
	{
		[Inject]
		public var view:Stage;
		
		public function StarlingStageMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	}
}