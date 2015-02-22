package components {
	import flash.geom.PerspectiveProjection;
	import flash.geom.Point;
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class CiubEyes extends Sprite
	{
		private var leftEye:Image
		private var rightEye:Image
		
		//offsetting rotation of eyes because they do not look down by default (check the spritesheet)
		private var angleOffset:Number = -Math.PI/4 
		
		public function CiubEyes() 
		{
			leftEye = new Image(FartingCiub.textureAtlas.getTexture("Eye"))
			leftEye.rotation = Math.random() * Math.PI
			leftEye.alignPivot()
			addChild(leftEye)
			
			rightEye = new Image(FartingCiub.textureAtlas.getTexture("Eye"))
			rightEye.rotation = Math.random() * Math.PI
			rightEye.x = leftEye.x + leftEye.width
			rightEye.alignPivot()
			addChild(rightEye)
			
			alignPivot()
		}
		
		public function rotate(angle:Number):void
		{
			leftEye.rotation = angle + angleOffset
			rightEye.rotation = angle + angleOffset
		}
	}

}