/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.config
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.gameplay.controller.GenerateResultCommand;
	import wheelOFun.gameplay.model.ResultModel;
	
	import wheelOFun.gameplay.model.ResultModel;
	
	import wheelOFun.gameplay.model.WheelModel;
	import wheelOFun.gameplay.signals.ApplyResultToViewSignal;
	import wheelOFun.gameplay.signals.EnableInteractionSignal;
	import wheelOFun.gameplay.signals.GenerateResultSignal;
	
	import wheelOFun.gameplay.view.IWheelView;
	
	import wheelOFun.gameplay.view.WheelViewMediator;
	
	public class GameplayConfig implements IConfig
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
			injector.map(WheelModel).asSingleton();
			injector.map(ResultModel).asSingleton();
			
			injector.map(EnableInteractionSignal).asSingleton();
			injector.map(ApplyResultToViewSignal).asSingleton();
			
			commandMap.map(GenerateResultSignal).toCommand(GenerateResultCommand);
			
			mediatorMap.map(IWheelView).toMediator(WheelViewMediator);
		}
	}
}
