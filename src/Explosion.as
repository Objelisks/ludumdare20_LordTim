package
{
	import org.flixel.FlxEmitter;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Explosion extends FlxEmitter
	{
		
		public function Explosion(X:Number = 0, Y:Number = 0, Size:Number=1)
		{
			super(X, Y, Size * 100);
			this.makeParticles(Assets.splosions, 50, 16, true, 0.6);
			this.minParticleSpeed.make(-50, -50);
			this.maxParticleSpeed.make(50, 50);
			this.start(true, 2);
		}
		
	}

}