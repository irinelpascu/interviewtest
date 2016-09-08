package wheelOFun.display.starling.controller
{
	
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.display.starling.signal.AddGameLayerSignal;
	import wheelOFun.display.starling.signal.AddViewToGameLayerSignal;
	import wheelOFun.display.starling.signal.AddViewToStarlingRootClassSignal;
	import wheelOFun.display.starling.view.StarlingGameLayerContainerView;
	
	public class InitStarlingGameLayerContainerCommand extends AsyncCommand implements ICommand
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var commandMap:ISignalCommandMap;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var addViewToStarlingRootClassSignal:AddViewToStarlingRootClassSignal;
		
		override public function execute():void
		{
			super.execute();
			// TODO: map to actual commands
			injector.map(AddGameLayerSignal).asSingleton();
			injector.map(AddViewToGameLayerSignal).asSingleton();
			
			addViewToStarlingRootClassSignal.dispatch(StarlingGameLayerContainerView);
			dispatchComplete(true);
		}
	}
}