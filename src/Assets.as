package
{
	/**
	 * ...
	 * @author Lord Tim
	 */
	public class Assets
	{
		
		[Embed(source = 'art/bludude.png')]public static var captainImg:Class;
		
		[Embed(source = 'art/ship.png')]public static var shipImg:Class;
		
		[Embed(source = 'art/bullet0.png')]public static var bullet_0:Class;
		
		[Embed(source = 'art/asteroid.png')]public static var asteroidImg:Class;
		
		[Embed(source = 'art/splodyparticles.png')]public static var splosions:Class;
		[Embed(source = 'art/explosionsnd.mp3')]public static var explosion_snd:Class;
		
		[Embed(source = 'art/targetimg.png')]public static var target:Class;
		[Embed(source='art/selectimg.png')]public static var select:Class;
		
		[Embed(source='art/emptymap.txt', mimeType='application/octet-stream')]public static var emptyMap:Class;
		[Embed(source='art/red1.txt', mimeType='application/octet-stream')]public static var red1:Class;
		[Embed(source = 'art/redplanet.png')]public static var redPlanetImg:Class;
		[Embed(source='art/redplanetspace.png')]public static var redPlanetSpace:Class;
	}

}