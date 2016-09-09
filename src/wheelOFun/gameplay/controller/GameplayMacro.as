/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	import flash.utils.getTimer;
	
	import wheelOFun.gameplay.signals.EnableInteractionSignal;
	
	public class GameplayMacro extends SequenceMacro implements IMacro
	{
		[Inject]
		public var enableInteractionSignal:EnableInteractionSignal;
		
		private var _startTime:Number;
		
		override public function prepare():void
		{
			add(CreateWheelViewCommand);
			
			
		}
		
		override public function execute():void
		{
			_startTime = getTimer();
			trace("GameplayMacro start");
			super.execute();
		}
		
		override protected function dispatchComplete(success:Boolean):void
		{
			if (success)
			{
				trace("GameplayMacro was successful! (" + ( getTimer() - _startTime) + "ms)");
				enableInteractionSignal.dispatch();
			}
			else
			{
				trace("GameplayMacro was not successful!");
			}
			
			super.dispatchComplete(success);
		}
	}
}
