package
{
	import dudes.Navigator;
	import flash.net.FileReference;
	import org.flixel.*;
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class PlanetState extends FlxState
	{
		public var planetMap:FlxTilemap;
		public var makmap:Boolean;
		public var dudeList:FlxGroup;
		public var selectedDude:Dude;
		public var targetIcon:FlxSprite;
		
		override public function create():void
		{
			super.create();
			FlxG.camera.zoom = 4;
			planetMap = new FlxTilemap();
			planetMap.loadMap(new Assets.red1(), Assets.redPlanetImg, 8, 8, FlxTilemap.AUTO);
			FlxG.worldBounds = planetMap.getBounds();
			add(planetMap);
			FlxG.watch(this, "makmap");
			
			selectedDude = null;
			
			dudeList = new FlxGroup();
			var d1:Dude = new Navigator(20, 20, planetMap);
			selectedDude = d1;
			d1.selected = true;
			dudeList.add(d1);
			add(dudeList);
			
			//FlxG.camera.follow(selectedDude);
			//FlxG.camera.deadzone = new FlxRect( FlxG.width/2-50, -500, FlxG.width/2+50, 5000);
			
			targetIcon = new FlxSprite( -10, -10, Assets.target);
			add(targetIcon);
			
			FlxG.watch(FlxG.camera.scroll, "x");
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(dudeList, planetMap);
			FlxG.camera.scroll.x = selectedDude.x - (FlxG.width)/(FlxG.camera.zoom)
				
			if (FlxG.keys.justPressed("F9"))
			{
				makmap = !makmap;
			}
			
			if (makmap)
			{
				if (FlxG.mouse.pressed())
				{
					var p:FlxPoint = FlxG.mouse.getWorldPosition();
					planetMap.setTile(p.x / 8, p.y / 8, FlxG.keys.SHIFT?0:1);
				}
				if (FlxG.keys.pressed("LEFT") && FlxG.camera.scroll.x > 0)
				{
					FlxG.camera.scroll.x -= 1;
				}
				if (FlxG.keys.pressed("RIGHT") && FlxG.camera.scroll.x < (planetMap.width - FlxG.camera.width/2))
				{
					FlxG.camera.scroll.x += 1;
				}
				if (FlxG.keys.justPressed("F8"))
				{
					var file:FileReference = new FileReference();
					file.save(FlxTilemap.arrayToCSV(planetMap.getData(true), planetMap.widthInTiles), "newmap.txt");
				}
				return;
			}
			
			if (FlxG.mouse.justPressed() && selectedDude != null)
			{
				selectedDude.target = FlxG.mouse.getWorldPosition();
				selectedDude.path = null;
				targetIcon.x = selectedDude.target.x-targetIcon.origin.x;
				targetIcon.y = selectedDude.target.y-targetIcon.origin.y;
			}
		}
	}

}