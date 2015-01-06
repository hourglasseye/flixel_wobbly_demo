package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Justin Richard S. Mata
 */
class Wobbler extends FlxSprite {
	
	private var timeAlive:Float = 0;
	private var colors:Array<Int> = [FlxColor.AQUAMARINE, FlxColor.AZURE, FlxColor.BEIGE, FlxColor.BROWN, FlxColor.CHARTREUSE, FlxColor.CORAL, FlxColor.CRIMSON, FlxColor.GOLDEN, FlxColor.LAVENDER];
	
	public function new(velocityX:Float, velocityY:Float) {
		super(FlxG.width * 0.5, FlxG.height * 0.5);
		
		antialiasing = true;
		
		makeGraphic(10, 10, colors[Std.int(Math.random() * colors.length)]);
		
		velocity.x = velocityX;
		velocity.y = velocityY;
	}
	
	override public function update():Void {
		super.update();
		
		timeAlive += FlxG.elapsed;
		if (timeAlive > 5) {
			destroy();
		}
	}
}