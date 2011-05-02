package
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Dude extends FlxSprite
	{
		public var target:FlxPoint;
		public var useAbility:Boolean;
		public var map:FlxTilemap;
		public var selected:Boolean;
		public var selectedIcon:FlxSprite;
		
		public function Dude(X:Number=0, Y:Number=0, Img:Class=null, Map:FlxTilemap=null)
		{
			super(X, Y, Img);
			map = Map;
			target = null
			useAbility = false;
			drag.x = 200;
			maxVelocity.x = 50;
			acceleration.y = 150;
			
			selectedIcon = new FlxSprite(0, 0, Assets.select);
		}
		
		override public function draw():void
		{
			super.draw();
			if (selected)
			{
				selectedIcon.x = x-1;
				selectedIcon.y = y-5;
				selectedIcon.draw();
			}
		}
		
		override public function update():void
		{
			if (path == null && target != null)
			{
				var tPath:FlxPath = map.findPath(new FlxPoint(x, y), target);
				if (tPath != null)
					followPath(tPath, 20, PATH_FORWARD | PATH_HORIZONTAL_ONLY);
			}
			
			if (path != null && justTouched(LEFT | RIGHT))
			{
				jump();
			}
			super.update();
		}
		
		public function moveLeft():void
		{
			velocity.x += -500*FlxG.elapsed;
		}
		
		public function moveRight():void
		{
			velocity.x += 500*FlxG.elapsed;
		}
		
		public function jump():void
		{
			if(isTouching(FLOOR))
				velocity.y -= 50;
		}
		
	}

}