package components 
{
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import starling.animation.Juggler;
	import starling.display.Sprite;
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class CiubHair extends Sprite
	{
		private var hair1:Image
		private var hair2:Image
		
		public function CiubHair() 
		{
			super() 
			
			hair1 = new Image(FartingCiub.textureAtlas.getTexture("Hair"))
			
			hair2 = new Image(FartingCiub.textureAtlas.getTexture("Hair"))
			hair2.scaleX = -1
			hair2.x += 46
			
			addChild(hair1)
			//addChild(hair2)
			
			alignPivot(HAlign.CENTER, VAlign.BOTTOM) 
			
			animate()
			
		}
		
		public function rotate(angle:Number):void
		{
			rotation = angle
		}
		
		private function animate():void
		{
			if (hair1.parent)
			{
				hair1.removeFromParent()
			}
			else 
			{
				addChild(hair1)
			}
			
			if (hair2.parent)
			{
				hair2.removeFromParent()
			}
			else 
			{
				addChild(hair2)
			}
			
			setTimeout(animate, 40)
			
		}	
	}
}