package wheelOFun.display.starling.config
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	import starling.display.Stage;
	
	import wheelOFun.display.starling.signal.AddViewToStarlingRootClassSignal;
	
	import wheelOFun.display.starling.signal.StarlingRootClassReadySignal;
	import wheelOFun.display.starling.view.StarlingRootClass;
	import wheelOFun.display.starling.view.StarlingRootClassMediator;
	import wheelOFun.display.starling.view.StarlingStageMediator;
	
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.StarlingViewMapExtension;
	
	public class StarlingConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;

		[Inject]
		public var commandMap:ISignalCommandMap;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var context:IContext;

		public function configure():void
		{
			injector.map( StarlingRootClassReadySignal ).asSingleton();
			injector.map( AddViewToStarlingRootClassSignal ).asSingleton();

			mediatorMap.map( Stage ).toMediator( StarlingStageMediator );
			mediatorMap.map( StarlingRootClass ).toMediator( StarlingRootClassMediator );
		}
	}
}