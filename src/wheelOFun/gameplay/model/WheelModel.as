/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.model
{
	public class WheelModel
	{
		public static const WHEEL_VALUES_IN_CIRCULAR_ORDER:Vector.<int> = new <int>[5000, 600, 500,
		                                                                            300, 500, 800,
		                                                                            550, 400, 300,
		                                                                            900, 500, 300,
		                                                                            900, 0, 600,
		                                                                            400, 300, -1,
		                                                                            800,
		                                                                            350, 450, 700,
		                                                                            300, 600];
		private var _wheelRotationAngleFromValues:Vector.<Number>;
		
		public function WheelModel()
		{
			var length:int = WHEEL_VALUES_IN_CIRCULAR_ORDER.length;
			_wheelRotationAngleFromValues = new Vector.<Number>();
			
			for (var i:int = 0; i < length; i++)
			{
				_wheelRotationAngleFromValues.push(360 / length * i * Math.PI / 180);
			}
		}
		
		public function getRotationAngle(winAmount:int):Number
		{
			return _wheelRotationAngleFromValues[WHEEL_VALUES_IN_CIRCULAR_ORDER.indexOf(winAmount)];
		}
	}
}
