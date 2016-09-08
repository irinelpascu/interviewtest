//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package wheelOFun.robotlegs.bender.extensions.starlingViewMap
{
	
	import robotlegs.bender.extensions.matching.instanceOfType;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;
	
	import starling.core.Starling;
	
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.api.IStarlingViewMap;
	import wheelOFun.robotlegs.bender.extensions.starlingViewMap.impl.StarlingViewMap;
	
	/**
	 * Basic StarlingView Extension.
	 *
	 * @author jamieowen
	 */
	public class StarlingViewMapExtension implements IExtension
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		private var _uid:String = UID.create(StarlingViewMapExtension);
		private var _context:IContext;
		
		public function extend(context:IContext):void
		{
			_context = context;
			_context.addConfigHandler(instanceOfType(Starling), handleStarling);
			_context.injector.map(IStarlingViewMap).toSingleton(StarlingViewMap);
		}
		
		private function handleStarling(starling:Starling):void
		{
			_context.injector.map(Starling).toValue(starling);
			// init the IStarlingViewMap now we have the reference to Starling
			_context.injector.getInstance(IStarlingViewMap);
		}
	}
}