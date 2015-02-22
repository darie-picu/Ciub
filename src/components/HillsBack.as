package components 
{
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class HillsBack extends Sprite
	{
		private var hillsBack:Image
		private var bigTree:Image
		
		public function HillsBack() 
		{
			hillsBack = new Image(FartingCiub.textureAtlas.getTexture("Hills1"))
			hillsBack.y = 0
			hillsBack.color = 0x666666
			addChild(hillsBack)
			
			bigTree = new Image(FartingCiub.textureAtlas.getTexture("BigTree"))
			bigTree.alignPivot()
			bigTree.x = 400
			bigTree.y = 0
			addChild(bigTree)
			
		}
		
	}

}