/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.dialog.dialogs.bankrupt
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFormat;
	
	public class BankruptDialogView extends Sprite implements IBankruptDialogView
	{
		private var _messageTF:TextField;
		private var _titleTF:TextField;
		
		public function BankruptDialogView()
		{
			super();
			_titleTF = new TextField(200, 40, "OH NOOOOOOOO", new TextFormat("Verdana", 36));
			addChild(_titleTF);
			_messageTF = new TextField(400, 200, "The spirits took your money", new TextFormat("Verdana", 16));
			_messageTF.x = 100;
			addChild(_messageTF);
		}
	}
}
