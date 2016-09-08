package wheelOFun.display.starling.view
{
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class StarlingGameLayerView extends Sprite
	{
		public function addView(view:Object):void
		{
			addChild(view as DisplayObject);
		}
		
		public function removeView(view:Object):void
		{
			removeChild(view as DisplayObject, true);
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
		
		public function clear():void
		{
			removeChildren(0, 0x7fffffff, true);
		}
	}
}