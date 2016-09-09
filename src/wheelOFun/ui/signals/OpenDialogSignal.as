/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.signals
{
	import org.osflash.signals.Signal;
	
	import wheelOFun.ui.signals.vo.OpenDialogVO;
	
	public class OpenDialogSignal extends Signal
	{
		public function OpenDialogSignal()
		{
			super(OpenDialogVO);
		}
	}
}
