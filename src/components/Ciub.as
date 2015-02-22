package components {
	import flash.geom.Point;
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * This just deals with loading the assets for the ciub and with the fart animation
	 * @author Darie Picu & Olga Baranova
	 */
	public class Ciub extends Sprite
	{
		private var ciubSmile:Image
		private var ciubFart:Image
		private var ciubDead:Image
		
		private var eyes:CiubEyes
		private var hair:CiubHair
		
		public var blowDirection:Point
				
		public static const GAME_OVER:String = "CIUB_DEAD"
						
		public function Ciub() 
		{
			super()	
			
			ciubSmile = new Image(FartingCiub.textureAtlas.getTexture("CiubSmile"))
			ciubSmile.alignPivot()
			ciubSmile.alpha = 1
			//addChild(ciubSmile)
			
			
			ciubFart = new Image(FartingCiub.textureAtlas.getTexture("CiubFart"))
			ciubFart.alignPivot()
			ciubFart.alpha = 0
			//addChild(ciubFart)
			
			ciubDead = new Image(FartingCiub.textureAtlas.getTexture("CiubDead"))
			ciubDead.alignPivot()
			ciubDead.alpha = 0
			//addChild(ciubDead)
			
			eyes = new CiubEyes()
			eyes.y = 30
			addChild(eyes)
			
			hair = new CiubHair()
			addChild(hair)
		}
		
		public function startFarting():void
		{	
			ciubFart.alpha = 1
			ciubSmile.alpha = 0
			ciubDead.alpha = 0 
			
		}
		
		public function stopFarting():void
		{
			ciubSmile.alpha = 1
			ciubFart.alpha = 0
			ciubDead.alpha = 0
		}
		
		public function die():void
		{
			ciubDead.alpha = 1
			ciubSmile.alpha = 0
			ciubFart.alpha = 0
			dispatchEventWith(GAME_OVER)
		}
		
		public function updateEyesAndHair(angle:Number):void
		{
			eyes.rotate(angle)
			hair.rotate(angle)
		}
		
				
		public function rotate(angle:Number):void
		{
			ciubSmile.rotation = angle
			ciubFart.rotation = angle
			ciubDead.rotation = angle
		}
	}
}