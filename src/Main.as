package
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Security;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.bender.framework.impl.Context;
	
	import wheelOFun.application.config.WheelOfFunConfig;
	import wheelOFun.robotlegs.bender.bundles.WheelOFunMVCSBundle;
	
	[SWF(backgroundColor="0x000000", frameRate="60", width="800", height="600")]
	public class Main extends Sprite
	{
		public function Main()
		{
			if (this.stage)
			{
				construct();
			} else
			{
				this.addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, int.MAX_VALUE,
				                      true);
			}
		}
		private var _context:Context;
		
		private function construct():void
		{
			Security.allowDomain("*");
			init();
		}
		
		private function init():void
		{
			_context = new Context();
			_context.install(WheelOFunMVCSBundle);
			_context.logLevel = LogLevel.ERROR;
			_context.configure(WheelOfFunConfig);
			_context.configure(new ContextView(this));
		}
		
		private function addedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			construct();
		}
	}
}
