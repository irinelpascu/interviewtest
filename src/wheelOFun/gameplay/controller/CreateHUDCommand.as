/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.controller
{
	import flash.geom.Point;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	import wheelOFun.display.starling.enums.GameLayersEnum;
	
	import wheelOFun.display.starling.signal.AddViewToGameLayerSignal;
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	import wheelOFun.ui.hud.huds.balance.MaxScoreView;
	import wheelOFun.ui.hud.huds.score.ScoreView;
	
	public class CreateHUDCommand extends Command implements ICommand
	{
		[Inject]
		public var addViewToGameLayerSignal:AddViewToGameLayerSignal;
		
		override public function execute():void
		{
			var scoreView:ScoreView = new ScoreView();
			addViewToGameLayerSignal.dispatch(new ViewToLayerVO(GameLayersEnum.LAYER_UI.name, scoreView, new Point(10, 10)));
			var balanceView:MaxScoreView = new MaxScoreView();
			addViewToGameLayerSignal.dispatch(new ViewToLayerVO(GameLayersEnum.LAYER_UI.name, balanceView, new Point(10, 30)));
		}
	}
}
