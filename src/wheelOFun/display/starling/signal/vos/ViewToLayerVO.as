package wheelOFun.display.starling.signal.vos
{

	public class ViewToLayerVO
	{
		public var layerName:String;
		public var viewObject:Object;

		public function ViewToLayerVO(layerName:String, viewObject:Object )
		{
			this.layerName = layerName;
			this.viewObject = viewObject;
		}
	}
}