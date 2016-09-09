/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.hud.huds.balance
{
	import wheelOFun.ui.uis.balance.*;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFormat;
	
	public class BalanceView extends Sprite implements IBalanceView
	{
		private var _balanceTF:TextField;
		private var _balanceLabelTF:TextField;
		
		public function BalanceView()
		{
			super();
			_balanceLabelTF = new TextField(100, 20, "Balance:", new TextFormat("Verdana", 18));
			addChild(_balanceLabelTF);
			_balanceTF = new TextField(100, 20, "0", new TextFormat("Verdana", 18));
			_balanceTF.x = 100;
			addChild(_balanceTF);
		}
		
		public function setBalance(value:int):void
		{
			_balanceTF.text = value.toString();
		}
	}
}
