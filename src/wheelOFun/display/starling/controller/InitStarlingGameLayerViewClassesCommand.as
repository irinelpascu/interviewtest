package wheelOFun.display.starling.controller
{
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.display.starling.enums.GameLayersEnum;
	import wheelOFun.display.starling.signal.AddGameLayerSignal;
	
	public class InitStarlingGameLayerViewClassesCommand implements ICommand
	{
		[Inject]
		public var addGameLayerSignal:AddGameLayerSignal;
		
		public function execute():void
		{
			for each (var layer:GameLayersEnum in GameLayersEnum.gameLayerList)
			{
				addGameLayerSignal.dispatch(layer.name);
			}
		}
	}
}