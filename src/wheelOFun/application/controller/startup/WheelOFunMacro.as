package wheelOFun.application.controller.startup
{
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	import flash.utils.getTimer;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	
	import wheelOFun.application.signals.GameStartupCompleteSignal;
	
	public class WheelOFunMacro extends SequenceMacro implements IMacro
	{
		[Inject]
		public var contextView:ContextView;
		
		[Inject]
		public var startupCompleteSignal:GameStartupCompleteSignal;
		
		private var startTime:Number;
		
		override public function prepare():void
		{
			//add(InitStarlingMacro);
			
			//add( WheelOFunStartupGameMacro );
		}
		
		override public function execute():void
		{
			startTime = getTimer();
			trace("STARTUP WheelOFunMacro start");
			super.execute();
		}
		
		override protected function dispatchComplete(success:Boolean):void
		{
			if (success)
			{
				trace("STARTUP WheelOFunMacro was successful! (" + ( getTimer() - startTime)
				      + "ms)");
				startupCompleteSignal.dispatch();
			}
			else
			{
				trace("STARTUP WheelOFunMacro was not successful!");
			}
			
			super.dispatchComplete(success);
		}
	}
}