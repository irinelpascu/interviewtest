/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.display.starling.view
{
	import wheelOFun.display.starling.signal.vos.ViewToLayerVO;
	
	public interface IStarlingGameLayerContainerView
	{
		function addViewToGameLayer(viewToLayerVO:ViewToLayerVO):void;
		
		function addGameLayer(gameLayerName:String):void;
	}
}
