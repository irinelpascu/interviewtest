package wheelOFun.display.starling.signal
{
	
	import org.osflash.signals.Signal;
	
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	
	public class AddViewToGameLayerSignal extends Signal
	{
		public function AddViewToGameLayerSignal()
		{
			super(ViewToLayerVO);
		}
	}
}