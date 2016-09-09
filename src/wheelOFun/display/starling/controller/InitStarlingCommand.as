package wheelOFun.display.starling.controller
{
	
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	
	import flash.display.Stage;
	import flash.display3D.Context3DProfile;
	import flash.geom.Rectangle;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	import starling.core.Starling;
	import starling.utils.Align;
	
	import wheelOFun.display.starling.signal.StarlingRootClassReadySignal;
	import wheelOFun.display.starling.view.StarlingRootClass;
	
	public class InitStarlingCommand extends AsyncCommand implements ICommand
	{
		[Inject]
		public var contextView:ContextView;
		
		[Inject]
		public var starlingRootClassReadySignal:StarlingRootClassReadySignal;
		
		override public function execute():void
		{
			super.execute();
			starlingRootClassReadySignal.addOnce(starling_onRootClassReady);
			
			Starling.multitouchEnabled = false;
			
			initStarling();
		}
		
		private function initStarling():void
		{
			var stage:Stage = contextView.view.stage;
			var starling:Starling = new Starling(StarlingRootClass, stage, null, null, "auto", [Context3DProfile.BASELINE_EXTENDED,
			                                                                                    Context3DProfile.BASELINE]);
			
			starling.viewPort = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
			starling.stage.stageWidth = stage.stageWidth;
			starling.stage.stageHeight = stage.stageHeight;
			starling.showStatsAt(Align.RIGHT);
			starling.stage.color = 0x336699;
			starling.start();
			
			context.configure(starling);
		}
		
		private function starling_onRootClassReady():void
		{
			dispatchComplete(true);
		}
	}
}