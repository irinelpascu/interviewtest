/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.dialog.dialogs.bankrupt
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	public class BankruptDialogViewMediator extends Mediator implements IMediator
	{
		[Inject]
		public var bankruptDialogView:IBankruptDialogView;
		
		override public function initialize():void
		{
			super.initialize();
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	}
}
