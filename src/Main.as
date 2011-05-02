package
{
	import org.flixel.*;
	
	[SWF(width="512", height="512", backgroundColor="#000000")]
	
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void
		{
			super(256, 256, MenuState, 2);
			forceDebugger = true;
		}
	}
}