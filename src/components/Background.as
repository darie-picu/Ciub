package components 
{
	import flash.display.BitmapData;
	import screens.FartingCiub;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class Background extends Sprite
	{
		
		private var sky:Sky
		
		private var hillsFront:HillsFront
		private var hillsBack:Sprite
		
		private var smallTree:Image
		private var bush:Image
		
		private var ciub:Ciub
		
		public function Background(ciub:Ciub) 
		{
			super()
			
			this.ciub = ciub
			
			sky = new Sky()
			addChild(sky)
			
			hillsBack = new HillsBack()
			addChild(hillsBack)
			
			hillsFront = new HillsFront()
			addChild(hillsFront)
			
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame)
		}
		
		private function onFrame(e:EnterFrameEvent):void 
		{
			//paralax stuff, give impression of depth by moving the hills up and down at different rates
			hillsFront.y = 650 + (600 - ciub.y) / 14 
			hillsBack.y = 160 + (600 - ciub.y) / 25
		}
	}
}