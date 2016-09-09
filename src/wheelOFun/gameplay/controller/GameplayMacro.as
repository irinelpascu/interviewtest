/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	import flash.utils.getTimer;
	
	import treefortress.sound.SoundAS;
	
	import wheelOFun.assetHandling.consts.SoundsIDs;
	
	import wheelOFun.gameplay.signals.EndSpinSignal;
	
	public class GameplayMacro extends SequenceMacro implements IMacro
	{
		[Inject]
		public var endSpinSignal:EndSpinSignal;
		
		private var _startTime:Number;
		
		override public function prepare():void
		{
			add(InitializeResultModelCommand);
			add(CreateWheelViewCommand);
			add(CreateBackgroundImageCommand);
			add(CreateHUDCommand);
			
			SoundAS.play(SoundsIDs.BACKGROUND_SOUND, .2);
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
				endSpinSignal.dispatch();
			}
			else
			{
				trace("GameplayMacro was not successful!");
			}
			
			super.dispatchComplete(success);
		}
	}
}
