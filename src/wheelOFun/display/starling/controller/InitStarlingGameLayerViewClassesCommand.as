package wheelOFun.display.starling.controller
{
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.display.starling.enums.GameLayersEnum;
	import wheelOFun.display.starling.signal.AddGameLayerSignal;
	
	public class InitStarlingGameLayerViewClassesCommand extends Command implements ICommand
	{
		[Inject]
		public var addGameLayerSignal:AddGameLayerSignal;
		
		override public function execute():void
		{
			for each (var layer:GameLayersEnum in GameLayersEnum.gameLayerList)
			{
				addGameLayerSignal.dispatch(layer.name);
			}
		}
	}
}