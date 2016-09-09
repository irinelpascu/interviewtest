/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.gameplay.model.ResultModel;
	import wheelOFun.gameplay.model.ScoreModel;
	import wheelOFun.gameplay.model.vo.WheelSliceVO;
	import wheelOFun.gameplay.signals.ApplyResultToViewSignal;
	
	public class GenerateResultCommand extends Command implements ICommand
	{
		[Inject]
		public var resultModel:ResultModel;
		
		[Inject]
		public var scoreModel:ScoreModel;
		
		[Inject]
		public var applyResultToViewSignal:ApplyResultToViewSignal;
		
		override public function execute():void
		{
			var result:WheelSliceVO = resultModel.generateResult();
			scoreModel.setWinAmount(result.sliceWinAmount);
			applyResultToViewSignal.dispatch(result);
		}
	}
}
