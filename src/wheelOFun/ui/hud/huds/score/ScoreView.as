/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.ui.hud.huds.score
{
	import wheelOFun.ui.uis.score.*;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFormat;
	
	public class ScoreView extends Sprite implements IScoreView
	{
		private var _scoreTF:TextField;
		private var _scoreLabelTF:TextField;
		
		public function ScoreView()
		{
			super();
			_scoreLabelTF = new TextField(100, 20, "Score:", new TextFormat("Verdana", 18));
			addChild(_scoreLabelTF);
			_scoreTF = new TextField(100, 20, "0", new TextFormat("Verdana", 18));
			_scoreTF.x = 100;
			addChild(_scoreTF);
		}
		
		public function setScore(value:int):void
		{
			_scoreTF.text = value.toString();
		}
	}
}
