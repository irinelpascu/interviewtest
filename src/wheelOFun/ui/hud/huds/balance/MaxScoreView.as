/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.hud.huds.balance
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFormat;
	
	public class MaxScoreView extends Sprite implements IMaxScoreView
	{
		private var _maxScoreTF:TextField;
		private var _maxScoreLabelTF:TextField;
		
		public function MaxScoreView()
		{
			super();
			_maxScoreLabelTF = new TextField(100, 20, "Max Score:", new TextFormat("Verdana", 16));
			addChild(_maxScoreLabelTF);
			_maxScoreTF = new TextField(100, 20, "0", new TextFormat("Verdana", 16));
			_maxScoreTF.x = 100;
			addChild(_maxScoreTF);
		}
		
		public function setBalance(value:int):void
		{
			_maxScoreTF.text = value.toString();
		}
	}
}
