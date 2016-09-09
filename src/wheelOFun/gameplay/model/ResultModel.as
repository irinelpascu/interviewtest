/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.model
{
	import wheelOFun.gameplay.model.vo.WheelSliceVO;
	
	public class ResultModel
	{
		private static const LOSE_WEIGHT:int = 20;
		private static const NORMAL_WEIGHT:int = 50;
		private static const JACKPOT_WEIGHT:int = 5;
		private static const TOTAL_WEIGHT:int = LOSE_WEIGHT + NORMAL_WEIGHT + JACKPOT_WEIGHT;
		// The amounts will be divided into 3 priorities. 0 - loses, 1 - jackpot, 2 - normal
		private var _priorityWins:Vector.<PriorityWin>;
		
		public function init(wheelValues:Vector.<WheelSliceVO>):void
		{
			var priority:int;
			
			_priorityWins = new <PriorityWin>[new PriorityWin(LOSE_WEIGHT), new PriorityWin(JACKPOT_WEIGHT), new PriorityWin(NORMAL_WEIGHT)];
			
			for (var i:int = 0; i < wheelValues.length; i++)
			{
				if (wheelValues[i].sliceWinAmount <= 0)
				{
					priority = 0;
				}
				else if (wheelValues[i].sliceWinAmount > 1000)
				{
					priority = 1;
				}
				else
				{
					priority = 2;
				}
				_priorityWins[priority].addWheelSlice(wheelValues[i]);
			}
		}
		
		public function generateResult():WheelSliceVO
		{
			var randomWeight:Number = Math.random() * TOTAL_WEIGHT;
			if (randomWeight < LOSE_WEIGHT)
			{
				return _priorityWins[0].getRandomWheelSlice();
			}
			else if (randomWeight < LOSE_WEIGHT + NORMAL_WEIGHT)
			{
				return _priorityWins[2].getRandomWheelSlice();
			}
			else
			{
				return _priorityWins[1].getRandomWheelSlice();
			}
		}
	}
}

import wheelOFun.gameplay.model.vo.WheelSliceVO;

class PriorityWin
{
	private var _wins:Vector.<WheelSliceVO>;
	private var _weight:int;
	
	public function PriorityWin(weight:int)
	{
		_weight = weight;
		_wins = new Vector.<WheelSliceVO>();
	}
	
	public function addWheelSlice(value:WheelSliceVO):void
	{
		_wins.push(value);
	}
	
	public function getRandomWheelSlice():WheelSliceVO
	{
		var index:int = Math.round(Math.random() * (_wins.length - 1));
		return _wins[index];
	}
}