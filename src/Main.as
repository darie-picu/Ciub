package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import screens.FartingCiub;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Darie Picu & Olga Baranova
	 */
	public class Main extends Sprite 
	{
		private var _starling:Starling
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_starling = new Starling(FartingCiub, stage)
			_starling.start()
		}
		
	}
	
}