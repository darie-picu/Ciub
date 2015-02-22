package components 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.clearInterval;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	import screens.FartingCiub;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * This simulates the physics of the ciub
	 * @author Darie Picu & Olga Baranova
	 */
	public class CiubPhysics 
	{
		private const GRAVITY_ACCELERATION:Number = 0.0004
		private const BOOST_VELOCITY:Number = 0
		
		private var _stage:Sprite
		private var _ciub:Ciub
		private var obstacles:Obstacles
		
		private var _timer:int
		private var _dt:int 
	
		//location and velocity of the Ciub
		private var _position:Point
		private var _velocity:Point
		private var _nextVelocity:Point
		private var _acceleration:Point = new Point(0,GRAVITY_ACCELERATION) //equivalent to the gravitational constant, but length is measured in pixels, time in milliseconds
		
		private var _currentTouch:Touch
		private var _currentPoint:Point
		
		private var farting:Boolean
		
		public function CiubPhysics(stage:Sprite, ciub:Ciub, obstacles:Obstacles)
		{
			_stage = stage
			_ciub = ciub
			this.obstacles = obstacles
			_ciub.x = 400
			_ciub.y = 100
			_stage.addEventListener(TouchEvent.TOUCH, onTouch)
			_ciub.addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame)
			_timer = getTimer()
			
			_position = new Point(_ciub.x, _ciub.y)
			_velocity = new Point(0,0) //start with 0 velocity
			
			_currentPoint = new Point(_position.x, _position.y)
		}
		
		//This will take the touch as a parameter and fart in the direction of the touch
		private function fartTowards(direction:Point):void 
		{
			//d is vector between direction and ciubs
			var blowDirection:Point = new Point(direction.x - _ciub.x, direction.y - _ciub.y)
			var blowAngle:Number = Math.atan2(blowDirection.y, blowDirection.x) - Math.PI/2
			_ciub.blowDirection = blowDirection
			_ciub.updateEyesAndHair(blowAngle)

			//compute new acceleration
			var a:Point = new Point(blowDirection.x, blowDirection.y)//new Point(Math.cos(_ciub.rotation), Math.sin(_ciub.rotation))
			var distance:Number = a.length
			var rejectionStrength:Number
			if (distance < 20)
			{
				rejectionStrength = -5
			}
			else
			{
				rejectionStrength = -(distance * ( -5 / 400) + 5)
				if (rejectionStrength > 0) rejectionStrength = 0
				//if (Math.abs(rejectionStrength) > 5) rejectionStrength = -5 
			}
			a.normalize(rejectionStrength)
			_acceleration.x = a.x * GRAVITY_ACCELERATION
			_acceleration.y = (a.y + 1) * GRAVITY_ACCELERATION	
		}
		
		private function stopFarting():void
		{
			_acceleration.x = 0
			_acceleration.y = GRAVITY_ACCELERATION
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			if (e.getTouch(_stage))
			{
				_currentTouch = e.getTouch(_stage)
				_currentPoint.x = _currentTouch.globalX
				_currentPoint.y = _currentTouch.globalY
				if ( _currentTouch.phase == TouchPhase.BEGAN)
				{
					farting = true
					_ciub.startFarting()
				}
				else if ( _currentTouch.phase == TouchPhase.ENDED)
				{
					farting = false
					_ciub.stopFarting()
					stopFarting()
				}
			}
		}
		
		private function onFrame(e:EnterFrameEvent):void 
		{
			
			if (farting)
			{
				fartTowards(_currentPoint)
			}
			//position = velocity * time + 1/2 * g * time ^ 2
			
			//compute time since last frame
			_dt = getTimer() - _timer
			_timer = getTimer()
						
			_velocity.x += _acceleration.x * _dt	
			_velocity.y += _acceleration.y * _dt
			
			_position.x += 0.5 * _velocity.x * _dt 
			_position.y += 0.5 * _velocity.y * _dt
			
				
			//rotate ciub to be in the direction of _nextVelocity
			_ciub.rotate(Math.atan2(_velocity.y, _velocity.x) + Math.PI / 2)
			
			if (GameConstants.SCREEN_RECTANGLE.contains(_ciub.x, _ciub.y) && obstacles.isCiubSafe(_ciub))
			{
				_ciub.x = _position.x
				_ciub.y = _position.y
			}
			else 
			{
				_ciub.die()
				obstacles.dispose()
				_stage.removeEventListener(TouchEvent.TOUCH, onTouch)
				_ciub.removeEventListener(EnterFrameEvent.ENTER_FRAME, onFrame)
				
			}
		}
	}
}