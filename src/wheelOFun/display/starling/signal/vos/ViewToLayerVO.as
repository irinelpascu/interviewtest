package wheelOFun.display.starling.signal.vos
{
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	
	public class ViewToLayerVO
	{
		public var layerName:String;
		public var viewObject:DisplayObject;
		public var coordinates:Point;
		
		public function ViewToLayerVO(layerName:String, viewObject:DisplayObject, coordinates:Point)
		{
			this.layerName = layerName;
			this.viewObject = viewObject;
			this.coordinates = coordinates;
		}
	}
}