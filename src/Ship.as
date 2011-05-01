package
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Ship extends FlxSprite
	{
		public var world:SpaceState;
		public var speed:Number;
		
		public function Ship(X:Number=0, Y:Number=0, World:SpaceState=null)
		{
			super(X, Y, Assets.shipImg);
			world = World;
			speed = 100;
		}
		
		override public function update():void
		{
			super.update();
			
			this.velocity.make(0, 0);
			if (FlxG.keys.pressed("LEFT"))
			{
				this.velocity.x -= speed;
			}
			if (FlxG.keys.pressed("RIGHT"))
			{
				this.velocity.x += speed;
			}
			if (FlxG.keys.pressed("UP"))
			{
				this.velocity.y -= speed;
			}
			if (FlxG.keys.pressed("DOWN"))
			{
				this.velocity.y += speed;
			}
			if (FlxG.keys.justPressed("X"))
			{
				fire();
			}
		}
		
		public function fire():void
		{
			var bullet:Bullet = new Bullet(x+origin.x, y, 0);
			bullet.velocity.y = -50;
			world.addBullet(bullet);
		}
		
		public function onShipHit(obj1:Object, obj2:Object):void
		{
			this.flicker(0.2);
			if (obj1 is Ship)
			{
				obj2.kill();
			}
			else
			{
				obj1.kill();
			}
		}
		
	}

}