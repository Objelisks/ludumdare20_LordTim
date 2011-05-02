package
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Planet extends FlxSprite
	{
		
		public function Planet(X:Number=0, Y:Number=0)
		{
			super(X, Y, Assets.redPlanetSpace);
			velocity.y = 20;
		}
		
		override public function hurt(Damage:Number):void
		{
			//super.hurt(Damage);
		}
		
	}

}