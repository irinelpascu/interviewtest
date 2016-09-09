package wheelOFun.ui.dialog.config
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.ui.dialog.dialogs.bankrupt.BankruptDialogViewMediator;
	import wheelOFun.ui.dialog.dialogs.bankrupt.IBankruptDialogView;
	
	public class DialogConfig implements IConfig
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
			mediatorMap.map(IBankruptDialogView).toMediator(BankruptDialogViewMediator);
		}
	}
}