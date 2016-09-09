/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	import wheelOFun.gameplay.model.vo.WheelSliceVO;
	import wheelOFun.gameplay.signals.ApplyResultToViewSignal;
	import wheelOFun.gameplay.signals.EnableInteractionSignal;
	import wheelOFun.gameplay.signals.GenerateResultSignal;
	
	public class WheelViewMediator extends Mediator implements IMediator
	{
		private static const MAX_SPEED_IN_DEGREES_PER_FRAME:Number = 10;
		private static const DECELERATION_IN_DEGREES_PER_FRAME:Number = .1;
		private static const ACCELERATION_IN_DEGREES_PER_FRAME:Number = .5;
		private static const DEGREES_PER_SLICE:Number = 360 / 24;
		private static const MOVEMENT_PHASE_ACCELERATION:String = "acc";
		private static const MOVEMENT_PHASE_ROTATION:String = "rot";
		private static const MOVEMENT_PHASE_DECELERATION:String = "dec";
		
		[Inject]
		public var wheelView:IWheelView;
		
		[Inject]
		public var generateResultSignal:GenerateResultSignal;
		
		[Inject]
		public var enableInteractionSignal:EnableInteractionSignal;
		
		[Inject]
		public var applyResultToViewSignal:ApplyResultToViewSignal;
		
		private var _speed:Number;
		private var _phase:String;
		private var _slicesNeededToStop:int;
		private var _result:WheelSliceVO;
		private var _currentSliceIndex;
		private var _currentRotationAngleDegrees:int;
		
		public function WheelViewMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			enableInteractionSignal.add(enableInteraction);
			applyResultToViewSignal.add(applyResult);
			
			calculateSlicesNeededToStop();
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		private function calculateSlicesNeededToStop():void
		{
			var speed:Number = MAX_SPEED_IN_DEGREES_PER_FRAME;
			var degreesNeededToStop:int = 0;
			while (speed > 0)
			{
				degreesNeededToStop += speed;
				speed -= DECELERATION_IN_DEGREES_PER_FRAME;
			}
			_slicesNeededToStop = degreesNeededToStop / DEGREES_PER_SLICE;
		}
		
		private function applyResult(wheelSliceVO:WheelSliceVO):void
		{
			_result = wheelSliceVO;
			trace("Won amount:" + _result.sliceWinAmount + " slice:" + _result.sliceIndex);
		}
		
		private function enableInteraction():void
		{
			wheelView.wheelTouchSignal.add(onTouch);
		}
		
		private function onTouch():void
		{
			generateResultSignal.dispatch();
			wheelView.wheelTouchSignal.removeAll();
			
			startRotation();
		}
		
		private function startRotation():void
		{
			_speed = 0;
			_phase = MOVEMENT_PHASE_ACCELERATION;
			DisplayObject(wheelView).addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		private function onEF(event:Event):void
		{
			if (_phase == MOVEMENT_PHASE_ACCELERATION)
			{
				_speed += ACCELERATION_IN_DEGREES_PER_FRAME;
				if (_speed >= MAX_SPEED_IN_DEGREES_PER_FRAME)
				{
					_speed = MAX_SPEED_IN_DEGREES_PER_FRAME;
					_phase = MOVEMENT_PHASE_ROTATION;
				}
			}
			else if (_phase == MOVEMENT_PHASE_DECELERATION)
			{
				if (!_result)
				{
					_speed -= DECELERATION_IN_DEGREES_PER_FRAME;
					if (_speed <= 0)
					{
						_speed = 0;
						DisplayObject(wheelView).removeEventListener(Event.ENTER_FRAME, onEF);
						enableInteraction();
					}
				}
				else if (_currentSliceIndex == (_result.sliceIndex + _slicesNeededToStop) % 24)
				{
					_result = null;
				}
			}
			else
			{
				if (_result)
				{
					_phase = MOVEMENT_PHASE_DECELERATION;
				}
			}
			wheelView.rotation += degreesToRadians(_speed);
			_currentRotationAngleDegrees = (_currentRotationAngleDegrees + _speed) % 360;
			_currentSliceIndex = 23 - Math.floor(_currentRotationAngleDegrees / DEGREES_PER_SLICE);
		}
		
		private function degreesToRadians(degree:int):Number
		{
			return degree * Math.PI / 180;
		}
		
		private function radiansToDegrees(radians:Number):int
		{
			return radians * 180 / Math.PI;
		}
	}
}
