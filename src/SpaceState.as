package
{
	import flash.utils.getTimer;
	import org.flixel.*;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class SpaceState extends FlxState
	{
		public var ship:Ship;
		public var playerBullets:FlxGroup;
		public var enemyBullets:FlxGroup;
		public var enemies:FlxGroup;
		public var explosions:FlxGroup;
		
		public var nesteroid:Number;
		
		override public function create():void
		{
			super.create();
			ship = new Ship(FlxG.width / 2, FlxG.height - 20, this);
			add(ship);
			enemies = new FlxGroup();
			playerBullets = new FlxGroup();
			enemyBullets = new FlxGroup();
			explosions = new FlxGroup();
			add(enemies);
			add(playerBullets);
			add(enemyBullets);
			add(explosions);
			
			nesteroid = getTimer() + Math.random()*100+100;
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(playerBullets, enemies, onBulletHit);
			FlxG.collide(ship, enemyBullets);
			FlxG.collide(ship, enemies, ship.onShipHit);
			
			if (getTimer() > nesteroid)
			{
				enemies.add(new Asteroid(Math.random() * (FlxG.width - 20) + 10, -50, this));
				nesteroid = getTimer() + Math.random()*100+100;
			}
		}
		
		public function addBullet(b:Bullet):void
		{
			playerBullets.add(b);
		}
		
		public function addExplosion(e:Explosion):void
		{
			explosions.add(e);
		}
		
		public function onBulletHit(obj1:FlxObject, obj2:FlxObject):void
		{
			if (obj1 is Bullet)
			{
				obj1.kill();
				obj2.hurt((obj1 as Bullet).damage);
			}
			else
			{
				obj2.kill();
				obj1.hurt((obj2 as Bullet).damage);
			}
		}
		
	}

}