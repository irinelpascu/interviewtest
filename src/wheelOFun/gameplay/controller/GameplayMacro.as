/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	public class GameplayMacro extends SequenceMacro implements IMacro
	{
		override public function execute():void
		{
			super.execute();
		}
		
		override public function prepare():void
		{
			add(CreateWheelViewCommand);
		}
	}
}
