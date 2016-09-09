/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.model.vo
{
	public class WheelSliceVO
	{
		private var _sliceIndex:int;
		private var _sliceWinAmount:int;
		private var _sliceRotationAngle:Number;
		
		public function WheelSliceVO(sliceIndex:int, sliceWinAmount:int, sliceRotationAngle:Number)
		{
			_sliceIndex = sliceIndex;
			_sliceWinAmount = sliceWinAmount;
			_sliceRotationAngle = sliceRotationAngle;
		}
		
		public function get sliceIndex():int
		{
			return _sliceIndex;
		}
		
		public function get sliceWinAmount():int
		{
			return _sliceWinAmount;
		}
		
		public function get sliceRotationAngle():Number
		{
			return _sliceRotationAngle;
		}
	}
}
