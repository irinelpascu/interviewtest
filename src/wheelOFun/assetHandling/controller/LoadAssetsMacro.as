/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assetHandling.controller
{
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	import flash.utils.getTimer;
	
	public class LoadAssetsMacro extends SequenceMacro implements IMacro
	{
		private var _startTime:Number;
		
		override public function prepare():void
		{
			add(LoadAndParseAssetsDefinitionCommand);
			add(LoadAssetsCommand);
		}
		
		override public function execute():void
		{
			_startTime = getTimer();
			trace("STARTUP WheelOFunMacro start");
			super.execute();
		}
		
		override protected function dispatchComplete(success:Boolean):void
		{
			if (success)
			{
				trace("STARTUP WheelOFunMacro was successful! (" + ( getTimer() - _startTime) + "ms)");
			}
			else
			{
				trace("STARTUP WheelOFunMacro was not successful!");
			}
			
			super.dispatchComplete(success);
		}
	}
}
