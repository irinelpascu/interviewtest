/**
 * Created by Irinel on 09.09.2016.
 */
package wheelOFun.gameplay.view
{
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class WheelView extends Image implements IWheelView
	{
		public function WheelView(texture:Texture)
		{
			super(texture);
			this.pivotX = this.width / 2;
			this.pivotY = this.height / 2;
		}
	}
}
