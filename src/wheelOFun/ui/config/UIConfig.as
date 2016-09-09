package wheelOFun.ui.config
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.ui.dialog.config.DialogConfig;
	
	import wheelOFun.ui.hud.config.HUDConfig;
	
	public class UIConfig implements IConfig
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
			context.configure(HUDConfig);
			context.configure(DialogConfig);
		}
	}
}