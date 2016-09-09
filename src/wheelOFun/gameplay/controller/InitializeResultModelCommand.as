/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.gameplay.model.ResultModel;
	import wheelOFun.gameplay.model.WheelModel;
	
	public class InitializeResultModelCommand extends Command implements ICommand
	{
		[Inject]
		public var wheelModel:WheelModel;
		
		[Inject]
		public var resultModel:ResultModel;
		
		override public function execute():void
		{
			resultModel.init(wheelModel.wheelSlices);
		}
	}
}
