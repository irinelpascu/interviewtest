/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.signals
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import wheelOFun.gameplay.model.vo.WheelSliceVO;
	
	public class ApplyResultToViewSignal extends Signal implements ISignal
	{
		public function ApplyResultToViewSignal()
		{
			super(WheelSliceVO);
		}
	}
}
