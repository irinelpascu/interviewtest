/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.gameplay.model.ScoreModel;
	import wheelOFun.gameplay.signals.EnableInteractionSignal;
	
	import wheelOFun.ui.signals.UpdateMaxScoreViewSignal;
	import wheelOFun.ui.signals.UpdateScoreViewSignal;
	
	public class EndSpinCommand extends Command implements ICommand
	{
		[Inject]
		public var scoreModel:ScoreModel;
		
		[Inject]
		public var updateMaxScoreViewSignal:UpdateMaxScoreViewSignal;
		
		[Inject]
		public var updateScoreViewSignal:UpdateScoreViewSignal;
		
		[Inject]
		public var enableInteractionSignal:EnableInteractionSignal;
		
		override public function execute():void
		{
			updateMaxScoreViewSignal.dispatch(scoreModel.maxScore);
			updateScoreViewSignal.dispatch(scoreModel.score);
			enableInteractionSignal.dispatch();
		}
	}
}
