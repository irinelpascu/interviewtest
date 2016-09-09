/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.view
{
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	import wheelOFun.gameplay.signals.WheelTouchSignal;
	
	public class WheelView extends Image implements IWheelView
	{
		private var _wheelTouchSignal:WheelTouchSignal;
		
		public function WheelView(texture:Texture)
		{
			super(texture);
			this.pivotX = this.width / 2;
			this.pivotY = this.height / 2;
			
			_wheelTouchSignal = new WheelTouchSignal();
			
			this.addEventListener(TouchEvent.TOUCH, onTouchEvent);
		}
		
		private function onTouchEvent(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.BEGAN))
			{
				_wheelTouchSignal.dispatch();
			}
		}
		
		public function get wheelTouchSignal():WheelTouchSignal
		{
			return _wheelTouchSignal;
		}
	}
}
