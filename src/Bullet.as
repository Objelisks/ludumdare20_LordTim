package
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Bullet extends FlxSprite
	{
		public static const T_smallfast:uint = 0;
		public static const T_largeslow:uint = 0;
		public static const T_homing:uint = 0;
		public static const T_split:uint = 0;
		public static const T_laser:uint = 0;
		public static const T_bomb:uint = 0;
		
		public var damage:uint;
		
		public function Bullet(X:Number=0, Y:Number=0, Type:uint=0)
		{
			super(X, Y);
			
			switch(Type)
			{
				case T_smallfast:
					loadGraphic(Assets.bullet_0);
					damage = 10;
					break;
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (!onScreen())
			{
				kill();
			}
		}
		
	}

}