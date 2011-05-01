package
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class MenuState extends FlxState
	{
		public var title1:FlxText;
		public var title2:FlxText;
		public var title3:FlxText;
		
		public var goBtn:FlxButton;
		
		public override function create():void
		{
			super.create();
			FlxG.mouse.show();
			
			title1 = new FlxText( -40, 10, 200, "ADVENTURES OF");
			title1.velocity.x = 100;
			title2 = new FlxText(-40, 30, 200, "SPACE FRONTIERSMAN");
			title2.velocity.x = 50;
			title3 = new FlxText(-40, 50, 200, "IN SPACE");
			title3.velocity.x = 30;
			add(title1);
			add(title2);
			add(title3);
			
			goBtn = new FlxButton(FlxG.width - 100, FlxG.height - 32, "GO INTO SPACE", function():void
			{
				FlxG.switchState(new IntroState());
			});
			add(goBtn);
		}
		
		public override function update():void
		{
			super.update();
			if (title1.x > 100)
			{
				title1.velocity.x = 0;
			}
			if (title2.x > 60)
			{
				title2.velocity.x = 0;
			}
			if (title3.x > 30)
			{
				title3.velocity.x = 0;
			}
		}
	}
}