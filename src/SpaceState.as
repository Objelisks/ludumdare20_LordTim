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
		public var planets:FlxGroup;
		
		public var nesteroid:Number;
		public var nextplanet:Number;
		
		override public function create():void
		{
			super.create();
			ship = new Ship(FlxG.width / 2, FlxG.height - 20, this);
			planets = new FlxGroup();
			enemies = new FlxGroup();
			playerBullets = new FlxGroup();
			enemyBullets = new FlxGroup();
			explosions = new FlxGroup();
			
			add(planets);
			add(enemies);
			add(playerBullets);
			add(enemyBullets);
			add(explosions);
			add(ship);
			
			nesteroid = getTimer() + Math.random()*100+100;
			nextplanet = getTimer() + Math.random()*100+15000;
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(playerBullets, enemies, onBulletHit);
			FlxG.collide(ship, enemyBullets);
			FlxG.collide(ship, enemies, ship.onShipHit);
			FlxG.collide(ship, planets, ship.onShipHit);
			
			if (getTimer() > nesteroid)
			{
				enemies.add(new Asteroid(Math.random() * (FlxG.width - 20) + 10, -50, this));
				nesteroid = getTimer() + Math.random()*100+100;
			}
			if (getTimer() > nextplanet)
			{
				planets.add(new Planet(Math.random() * (FlxG.width - 200) + 100, -200));
				nextplanet = getTimer() + Math.random()*100+15000;
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