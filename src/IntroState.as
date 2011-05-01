package
{
	import org.flixel.*;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class IntroState extends FlxState
	{
		public var introTxt:FlxText;
		
		public var curTxt:uint;
		
		public const introLines:Array =
		[
		"The year is 2XYZ\n   War is over",
		"The human race is on the verge of extinction, and you must journey into the vast reaches of space to find a new settlement to live on",
		"It is dangerous to go alone, so you have taken an excellent crew to assist you in your mission.",
		"Take this starship, and strike the new earth!"
		];
		
		public override function create():void
		{
			super.create();
			
			introTxt = new FlxText(48, 48, FlxG.width - 96, introLines[0]);
			add(introTxt);
			curTxt = 0;
			
			add(new FlxText(FlxG.width - 80, FlxG.height - 24, 48, "CLICK OR PRESS X"));
		}
		
		public function switchText():void
		{
			curTxt++;
			if (curTxt == introLines.length)
			{
				FlxG.switchState(new SpaceState());
			}
			else
			{
				introTxt.text = introLines[curTxt];
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("X") || FlxG.mouse.justPressed())
			{
				switchText();
			}
		}
	}

}