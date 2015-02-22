package screens {
	import components.Background;
	import components.Ciub;
	import components.CiubPhysics;
	import components.Obstacles;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class FartingCiub extends Sprite
	{
		private var ciub:Ciub
		private var ciubPhysics:CiubPhysics
		private var background:Background
		private var obstacles:Obstacles
		
		private var gameLayer:Sprite
		private var uiLayer:Sprite //tutorial, score and anything else in the UI go in the uiLayer
		
		private var spriteTexture:Texture
		private var spriteXML:XML
		
		public static var textureAtlas:TextureAtlas
		
		//TODO:Will probably want to use AssetManager for the spritesheet(s)
		[Embed(source = "../assets/spritesheets/Ciub.xml", mimeType = "application/octet-stream")]
		private var CiubData:Class
		[Embed(source = "../assets/spritesheets/Ciub.png")]
		private var CiubTexture:Class
		
		public function FartingCiub() 
		{
			super()
			this.addEventListener(Event.ADDED_TO_STAGE, initialize)
		}
		
		private function initialize(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
			
			spriteTexture = Texture.fromBitmap(new CiubTexture())
			spriteXML = XML(new CiubData())
			
			textureAtlas = new TextureAtlas(spriteTexture, spriteXML)

			startGame()
		}
		
		public function startGame(e:Event = null):void
		{
			gameLayer = new Sprite()
			uiLayer = new Sprite()
			addChild(gameLayer)
			addChild(uiLayer)
			
			
			
			ciub = new Ciub()
			background = new Background(ciub)
			ciub.addEventListener(Ciub.GAME_OVER, startGame)
			
			obstacles = new Obstacles()
			
			ciubPhysics = new CiubPhysics(gameLayer, ciub, obstacles)
			gameLayer.addChild(background)
			gameLayer.addChild(obstacles)
			gameLayer.addChild(ciub)
		}
		
	}

}