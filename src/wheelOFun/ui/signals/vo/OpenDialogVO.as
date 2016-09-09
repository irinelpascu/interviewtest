/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.signals.vo
{
	import wheelOFun.ui.dialog.interfaces.IDialogPropertiesVO;
	
	public class OpenDialogVO
	{
		private var _dialogID:String;
		private var _dialogProperties:IDialogPropertiesVO;
		
		public function OpenDialogVO(dialogID:String, dialogProperties:IDialogPropertiesVO)
		{
			_dialogID = dialogID;
			_dialogProperties = dialogProperties;
		}
	}
}
