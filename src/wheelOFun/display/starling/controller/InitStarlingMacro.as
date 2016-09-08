package wheelOFun.display.starling.controller
{
	
	import eu.alebianco.robotlegs.utils.api.IMacro;
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	public class InitStarlingMacro extends SequenceMacro implements IMacro
	{
		override public function prepare():void
		{
			add(InitStarlingCommand);
			add(InitStarlingGameLayerContainerCommand);
			add(InitStarlingGameLayerViewClassesCommand);
		}
	}
}