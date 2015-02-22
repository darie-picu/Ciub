package components 
{
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class HillsFront extends Sprite
	{
		
		private var background:Image
		
		private var hillsFront:Image
		private var hillsBack:Image
		
		private var trees:Vector.<Image>
		private var bushes:Vector.<Image>
		
		public function HillsFront() 
		{
			super()
			background = new Image(FartingCiub.textureAtlas.getTexture("Hills2"))
			addChild(background)
			
			trees = new Vector.<Image>()
			bushes = new Vector.<Image>()
			
			//tree bushes
			for (var i:int = 0; i < 3; i++)
			{
				var bush:Image = new Image(FartingCiub.textureAtlas.getTexture("Bush"))
				bush.x = 100 + i * (Math.random() * 150 + 100)
				bush.y = 140 + Math.random() * 60
				addChild(bush)
				bushes.push(tree)
			}
			
			for (i = 0; i < 2; i++)
			{
				var tree:Image  = new Image(FartingCiub.textureAtlas.getTexture("SmallTree"))
				tree.x = 100 + i * (Math.random()*200 + 300)
				tree.y = Math.random() * 30
				addChild(tree)
				trees.push(tree)
			}
			
			x = 0
			alignPivot(HAlign.LEFT,VAlign.BOTTOM)
		}
	}
}