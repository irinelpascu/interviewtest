/**
 * Created by Irinel on 07.09.2016.
 */
package wheelOFun.application.config
{
	import flash.display.Stage;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.application.controller.GameStartupCompleteCommand;
	import wheelOFun.application.controller.startup.WheelOFunMacro;
	import wheelOFun.application.signals.ContextInitializedSignal;
	import wheelOFun.application.signals.GameStartupCompleteSignal;
	import wheelOFun.display.starling.config.StarlingConfig;
	
	public class WheelOfFunConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:ISignalCommandMap;
		
		[Inject]
		public var context:IContext;
		
		[Inject]
		public var contextView:ContextView;
		
		public function configure():void
		{
			context.afterInitializing(afterInitializingContext);
			
			commandMap.map(ContextInitializedSignal).toCommand(WheelOFunMacro).once();
			commandMap.map(GameStartupCompleteSignal).toCommand(GameStartupCompleteCommand).once();
			
			context.configure( StarlingConfig );
		}
		
		private function afterInitializingContext():void
		{
			// Init mediator for already existing Display Stage
			var stage:Stage = contextView.view.stage;
			mediatorMap.mediate(stage);
			
			var contextInitializedSignal:ContextInitializedSignal = injector.getInstance(
							ContextInitializedSignal) as ContextInitializedSignal;
			contextInitializedSignal.dispatch();
		}
	}
}
