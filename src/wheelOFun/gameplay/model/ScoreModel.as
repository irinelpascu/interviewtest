/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.model
{
	import flash.net.SharedObject;
	
	public class ScoreModel
	{
		private var _sharedObject:SharedObject;
		private var _score:int;

		public function get score():int
		{
			return _score;
		}
		
		private var _maxScore:int;
		
		public function get maxScore():int
		{
			return _maxScore;
		}
		
		public function ScoreModel()
		{
			_sharedObject = SharedObject.getLocal("maxScore");
			_score = 0;
			_maxScore = _sharedObject.data.maxScore;
		}
		
		public function setWinAmount(value:int):void
		{
			if (value == 0)
			{
				_score = 0;
			}
			else if (value != -1)
			{
				_score += value;
				if (_score > _maxScore)
				{
					_maxScore = _score;
					_sharedObject.data.maxScore = _maxScore;
					_sharedObject.flush();
				}
			}
		}
	}
}
