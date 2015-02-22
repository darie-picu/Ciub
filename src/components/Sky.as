package components 
{
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class Sky extends Sprite
	{
		private var sky:Image
		private var clowd1:Image
		private var sun:Image
		
		public function Sky() 
		{
			sky = new Image(FartingCiub.textureAtlas.getTexture("Sky"))
			addChild(sky)
			
			sun = new Image(FartingCiub.textureAtlas.getTexture("Sun"))
			sun.x = 650 
			sun.y = 50
			sun.scaleX = 0.5
			sun.scaleY = 0.5
			addChild(sun)
			
			clowd1 = new Image(FartingCiub.textureAtlas.getTexture("Clowd1"))
			clowd1.scaleX = 0.2
			clowd1.scaleY = 0.2
			clowd1.x = 20
			clowd1.y = 60
			addChild(clowd1)
		}
		
	}

}