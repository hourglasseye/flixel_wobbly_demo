package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;

class PlayState extends FlxState {
	
	private var spawnInterval:Float = 1.0 / 10.0;
	private var spawnTime:Float = 0;
	
	private var velocityA:FlxPoint;
	private var velocityB:FlxPoint;
	private var velocityC:FlxPoint;
	
	override public function create():Void {
		super.create();
		
		bgColor = FlxColor.CHARCOAL;
		
		var speed = 100;
		
		var angleA = 2.33774678762164063;
		velocityA = FlxPoint.get(Math.cos(angleA) * speed, Math.sin(angleA) * speed);
		
		var angleB = -0.922261703465222;
		velocityB = FlxPoint.get(Math.cos(angleB) * speed, Math.sin(angleB) * speed);
		
		var angleC = 0.7853981633974483;
		velocityC = FlxPoint.get(Math.cos(angleC) * speed, Math.sin(angleC) * speed);
	}
	
	override public function update():Void {
		super.update();
		
		spawnTime += FlxG.elapsed;
		if (spawnTime > spawnInterval) {
			spawnTime -= spawnInterval;
			
			spawnWobbler(velocityA);
			spawnWobbler(velocityB);
			spawnWobbler(velocityC);
		}
	}
	
	override public function destroy():Void {
		super.destroy();
		
		velocityA.put();
		velocityA = null;
		
		velocityB.put();
		velocityB = null;
		
		velocityC.put();
		velocityC = null;
	}
	
	private function spawnWobbler(velocity:FlxPoint):Void {
		var wobbler:Wobbler = new Wobbler(velocity.x, velocity.y);
		add(wobbler);
	}
}