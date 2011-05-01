package
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Asteroid extends FlxSprite
	{
		public var world:SpaceState;
		
		public function Asteroid(X:Number=0, Y:Number=0, World:SpaceState=null)
		{
			super(X, Y);
			world = World;
			health = 10;
			loadGraphic(Assets.asteroidImg, true, false, 16, 11);
			frame = Math.floor(Math.random() * frames);
			angularVelocity = 100-Math.random() * 200;
			velocity.y = 20 + Math.random()*50;
		}
		
		override public function kill():void
		{
			super.kill();
			var explosion:Explosion = new Explosion(x, y, 1);
			world.addExplosion(explosion);
		}
		
		override public function update():void
		{
			super.update();
			if (y > FlxG.height)
			{
				super.kill();
			}
		}
		
	}

}