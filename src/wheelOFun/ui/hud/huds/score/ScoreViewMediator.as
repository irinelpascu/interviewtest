/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.hud.huds.score
{
	import wheelOFun.ui.uis.score.*;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	import wheelOFun.ui.signals.UpdateScoreViewSignal;
	
	public class ScoreViewMediator extends Mediator implements IMediator
	{
		[Inject]
		public var scoreView:IScoreView;
		
		[Inject]
		public var updateScoreViewSignal:UpdateScoreViewSignal;
		
		override public function initialize():void
		{
			super.initialize();
			updateScoreViewSignal.add(onScoreUpdated);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		private function onScoreUpdated(value:int):void
		{
			scoreView.setScore(value);
		}
	}
}
