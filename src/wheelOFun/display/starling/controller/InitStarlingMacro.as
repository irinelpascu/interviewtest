package wheelOFun.display.starling.controller
{
	
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	import flash.utils.getTimer;
	
	public class InitStarlingMacro extends SequenceMacro implements IMacro
	{
		private var _startTime:Number;
		
		override public function prepare():void
		{
			add(InitStarlingCommand);
			add(InitStarlingGameLayerContainerCommand);
			add(InitStarlingGameLayerViewClassesCommand);
		}
		
		override public function execute():void
		{
			_startTime = getTimer();
			trace("InitStarlingMacro start");
			super.execute();
		}
		
		override protected function dispatchComplete(success:Boolean):void
		{
			if (success)
			{
				trace("InitStarlingMacro was successful! (" + ( getTimer() - _startTime) + "ms)");
			}
			else
			{
				trace("InitStarlingMacro was not successful!");
			}
			
			super.dispatchComplete(success);
		}
	}
}