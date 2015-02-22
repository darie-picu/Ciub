package components 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	/**
	 * Containts 4 obstacles, it can check for collisions with the ciub
	 * @author Darie Picu & Olga Baranova
	 */
	public class Obstacles extends Sprite
	{
		private var obstacles:Vector.<Obstacle>
			
		public function Obstacles() 
		{	
			super()
			obstacles = new Vector.<Obstacle>()
			
			for (var i:int = 0; i < 4; i++)
			{
				var obstacle:Obstacle = new Obstacle()
				obstacle.x = 800 + i * 350
				addChild(obstacle)
				obstacles.push(obstacle)
			}	
		}
		
		public function isCiubSafe(ciub:Ciub):Boolean
		{
			for (var i:int = 0; i < obstacles.length; i++)
			{
				if (obstacles[i].collidesWith(ciub))
				{
					return false
				}
			}
			return true
		}		
	}
}