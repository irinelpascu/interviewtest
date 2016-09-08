//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package wheelOFun.robotlegs.bender.extensions.starlingViewMap.impl
{
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.api.IStarlingViewMap;
	
	/**
	 *
	 * StarlingViewMap Impl
	 *
	 * @author jamieowen
	 */
	public class StarlingViewMap implements IStarlingViewMap
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		[Inject]
		public var starling:Starling;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		/*============================================================================*/
		/* Constructor
		 /*============================================================================*/
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[PostConstruct]
		public function init():void
		{
			// listen for display object events
			starling.stage.addEventListener(Event.ADDED, onStarlingAdded);
			starling.stage.addEventListener(Event.REMOVED, onStarlingRemoved);
			
			// adds stage as view to allow a Starling Stage Mediator.
			starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}
		
		/*============================================================================*/
		/* Public Methods
		 /*============================================================================*/
		
		public function addStarlingView(view:DisplayObject):void
		{
			mediatorMap.mediate(view);
			
			//the event Added, it's not coming for the components that are already added into a
            // DisplayObjectContainer, before it was added to stage for performance issues, we
            // gonna check only for children that are ICompositionView if they need a mediator.
			
			if (view is DisplayObjectContainer)
			{
				var dob:DisplayObjectContainer = view as DisplayObjectContainer;
				var child:DisplayObject;
				for (var i:int = 0; i < dob.numChildren; i++)
				{
					child = dob.getChildAt(i);
					addStarlingView(child);
				}
			}
		}
		
		public function removeStarlingView(view:DisplayObject):void
		{
			//clean the sub mediators
			if (view is DisplayObjectContainer)
			{
				var dob:DisplayObjectContainer = view as DisplayObjectContainer;
				var child:DisplayObject;
				for (var i:int = 0; i < dob.numChildren; i++)
				{
					child = dob.getChildAt(i);
					removeStarlingView(child);
				}
			}
			
			mediatorMap.unmediate(view);
		}
		
		/*============================================================================*/
		/* Private Methods
		 /*============================================================================*/
		
		private function onStarlingAdded(event:Event):void
		{
			addStarlingView(event.target as DisplayObject);
		}
		
		private function onStarlingRemoved(event:Event):void
		{
			removeStarlingView(event.target as DisplayObject);
		}
		
		private function onRootCreated(event:Event):void
		{
			starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			addStarlingView(starling.stage);
		}
	}
}