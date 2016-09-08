/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assets.config
{
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import wheelOFun.assets.model.AssetsModel;
	
	public class AssetsConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var commandMap:ISignalCommandMap;
		
		public function configure():void
		{
			injector.map(AssetsModel).asSingleton();
			
		}
	}
}
