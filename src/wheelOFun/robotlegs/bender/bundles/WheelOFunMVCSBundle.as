package wheelOFun.robotlegs.bender.bundles
{
	import robotlegs.bender.extensions.contextView.ContextViewExtension;
	import robotlegs.bender.extensions.contextView.ContextViewListenerConfig;
	import robotlegs.bender.extensions.contextView.StageSyncExtension;
	import robotlegs.bender.extensions.directCommandMap.DirectCommandMapExtension;
	import robotlegs.bender.extensions.enhancedLogging.InjectableLoggerExtension;
	import robotlegs.bender.extensions.enhancedLogging.TraceLoggingExtension;
	import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
	import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;
	import robotlegs.bender.extensions.localEventMap.LocalEventMapExtension;
	import robotlegs.bender.extensions.mediatorMap.MediatorMapExtension;
	import robotlegs.bender.extensions.modularity.ModularityExtension;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.extensions.viewManager.StageCrawlerExtension;
	import robotlegs.bender.extensions.viewManager.StageObserverExtension;
	import robotlegs.bender.extensions.viewManager.ViewManagerExtension;
	import robotlegs.bender.extensions.viewProcessorMap.ViewProcessorMapExtension;
	import robotlegs.bender.extensions.vigilance.VigilanceExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.StarlingViewMapExtension;
	
	public class WheelOFunMVCSBundle implements IBundle
	{
		public function extend(context:IContext):void
		{
			context.logLevel = LogLevel.DEBUG;
			
			context.install(
					TraceLoggingExtension,
					VigilanceExtension,
					InjectableLoggerExtension,
					ContextViewExtension,
					EventDispatcherExtension,
					ModularityExtension,
					DirectCommandMapExtension,
					EventCommandMapExtension,
					LocalEventMapExtension,
					ViewManagerExtension,
					StageObserverExtension,
					MediatorMapExtension,
					ViewProcessorMapExtension,
					StageCrawlerExtension,
					StageSyncExtension,
					// Added on top of the default class
			        SignalCommandMapExtension,
			        StarlingViewMapExtension
			);
			
			context.configure(ContextViewListenerConfig);
		}
	}
}