/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.view
{
	import wheelOFun.gameplay.signals.WheelTouchSignal;
	
	public interface IWheelView
	{
		function get wheelTouchSignal():WheelTouchSignal;
		function set rotation(rotation:Number):void;
		function get rotation():Number;
	}
}
