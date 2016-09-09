/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.model
{
	import wheelOFun.gameplay.model.vo.WheelSliceVO;
	
	public class WheelModel
	{
		private static const WHEEL_VALUES_IN_CIRCULAR_ORDER:Vector.<int> = new <int>[5000, 600, 500,
		                                                                            300, 500, 800,
		                                                                            550, 400, 300,
		                                                                            900, 500, 300,
		                                                                            900, 0, 600,
		                                                                            400, 300, -1,
		                                                                            800,
		                                                                            350, 450, 700,
		                                                                            300, 600];
		private var _wheelSlices:Vector.<WheelSliceVO>;
		
		public function WheelModel()
		{
			var length:int = WHEEL_VALUES_IN_CIRCULAR_ORDER.length;
			var wheelSlice:WheelSliceVO;
			_wheelSlices = new Vector.<WheelSliceVO>();
			
			for (var i:int = 0; i < length; i++)
			{
				wheelSlice = new WheelSliceVO(i, WHEEL_VALUES_IN_CIRCULAR_ORDER[i], 360 / length * i);
				_wheelSlices.push(wheelSlice);
			}
		}
		
		public function get wheelSlices():Vector.<WheelSliceVO>
		{
			return _wheelSlices;
		}
	}
}
