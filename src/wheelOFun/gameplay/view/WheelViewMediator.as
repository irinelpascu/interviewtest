/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	
	import starling.display.DisplayObject;
	
	import starling.events.Event;
	
	import wheelOFun.gameplay.signals.EnableInteractionSignal;
	import wheelOFun.gameplay.signals.GenerateResultSignal;
	
	public class WheelViewMediator extends Mediator implements IMediator
	{
		private static const MAX_SPEED_IN_DEGREES_PER_FRAME:int = 10;
		private static const DECELERATION_IN_DEGREES_PER_FRAME:Number = .01;
		private static const ACCELERATION_IN_DEGREES_PER_FRAME:Number = .1;
		private static const MOVEMENT_PHASE_ACCELERATION:String = "acc";
		private static const MOVEMENT_PHASE_ROTATION:String = "rot";
		private static const MOVEMENT_PHASE_DECELERATION:String = "dec";
		
		[Inject]
		public var wheelView:IWheelView;
		
		[Inject]
		public var generateResultSignal:GenerateResultSignal;
		
		[Inject]
		public var enableInteractionSignal:EnableInteractionSignal;
		
		private var _speed:Number;
		private var _phase:String;
		
		public function WheelViewMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			enableInteractionSignal.add(enableInteraction);
		}
		
		override public function destroy():void
		{
			super.destroy();
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
				_speed -= DECELERATION_IN_DEGREES_PER_FRAME;
			}
			wheelView.rotation += _speed * Math.PI / 180;
		}
	}
}
