/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.hud.huds.balance
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	import wheelOFun.ui.signals.UpdateMaxScoreViewSignal;
	
	public class MaxScoreViewMediator extends Mediator implements IMediator
	{
		[Inject]
		public var balanceView:IMaxScoreView;
		
		[Inject]
		public var updateBalanceViewSignal:UpdateMaxScoreViewSignal;
		
		override public function initialize():void
		{
			super.initialize();
			updateBalanceViewSignal.add(onBalanceUpdated);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		private function onBalanceUpdated(value:int):void
		{
			balanceView.setBalance(value);
		}
	}
}
