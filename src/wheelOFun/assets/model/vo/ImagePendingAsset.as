/**
 * Created by Irinel on 08.09.2016.
 */
package wheelOFun.assets.model.vo
{
	public class ImagePendingAsset implements IPendingAsset
	{
		private var _id:String;
		private var _url:String;
		
		public function ImagePendingAsset(id:String, url:String)
		{
			_id = id;
			_url = url;
			
		}
		
		public function getURL():String
		{
			return _url;
		}
		
		public function getID():String
		{
			return _id;
		}
	}
}
