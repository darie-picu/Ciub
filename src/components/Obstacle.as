package components 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	/**
	 * Two rocks that leave a gap between them, they get recicled(repositioned) as soon as they get outside the screen
	 * @author Darie Picu & Olga Baranova
	 */
	public class Obstacle extends Sprite
	{
		public var topRock:Image
		public var bottomRock:Image
				
		private var gap:int //space between the rocks, random now, but should decrease with difficulty 
		
		public function Obstacle() 
		{
			gap = generateGap()
			
			topRock = new Image(FartingCiub.textureAtlas.getTexture("Rock"))
			addChild(topRock)
			
			
			bottomRock = new Image(FartingCiub.textureAtlas.getTexture("Rock"))
			bottomRock.y = topRock.y + topRock.height + gap
			addChild(bottomRock)
			
			//alignPivot()
			y = 600 * Math.random()
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame)
		}
		
		private function onFrame(e:EnterFrameEvent):void 
		{
			x -= 4
			if (x + width < 0) //reposition the Obstacle on the right of the screen whenever it leaves the screen through the left
			{
				x += 1400
				gap = generateGap()
				bottomRock.y = topRock.y + topRock.height + gap
				y = 600 * Math.random()
			}
		}
	
		public function collidesWith(ciub:Ciub):Boolean
		{
			var ciubPoint:Point = new Point(ciub.x, ciub.y)
			if (topRock.bounds.containsPoint(globalToLocal(ciubPoint)))
			{
				return true
			}
			
			if (bottomRock.bounds.containsPoint(globalToLocal(ciubPoint)))
			{
				return true
			}
			return false
		}
		
		private function generateGap():int
		{
			return 150 + Math.random() * 250
		}
		
	}

}