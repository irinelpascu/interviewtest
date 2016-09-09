package wheelOFun.ui.hud.config
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.ui.signals.UpdateBalanceViewSignal;
	import wheelOFun.ui.signals.UpdateScoreViewSignal;
	import wheelOFun.ui.hud.huds.balance.BalanceViewMediator;
	import wheelOFun.ui.hud.huds.balance.IBalanceView;
	import wheelOFun.ui.hud.huds.score.IScoreView;
	import wheelOFun.ui.hud.huds.score.ScoreViewMediator;
	
	public class HUDConfig implements IConfig
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
			injector.map(UpdateBalanceViewSignal).asSingleton();
			injector.map(UpdateScoreViewSignal).asSingleton();
			
			mediatorMap.map(IScoreView).toMediator(ScoreViewMediator);
			mediatorMap.map(IBalanceView).toMediator(BalanceViewMediator);
		}
	}
}