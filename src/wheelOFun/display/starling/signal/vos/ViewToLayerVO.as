package wheelOFun.display.starling.signal.vos
{
	import starling.display.DisplayObject;
	
	public class ViewToLayerVO
	{
		public var layerName:String;
		public var viewObject:DisplayObject;

		public function ViewToLayerVO(layerName:String, viewObject:DisplayObject )
		{
			this.layerName = layerName;
			this.viewObject = viewObject;
		}
	}
}