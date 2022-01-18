package component;

import h2d.Console;

class Ball implements IComponent {
	public static final type = "Ball";

	public var startingAcceleration = 175;
	public var hitSpeedUp = 75;
	public var speed:Int;
	public var minY = 0;
	public var maxY = 0;
	public var minX = 0;
	public var maxX = 0;

	public function new(minY:Int, maxY:Int, minX:Int, maxX:Int) {
		this.speed = startingAcceleration;
		this.minY = minY;
		this.maxY = maxY;
		this.minX = minX;
		this.maxX = maxX;
	}

	public function getType():String {
		return type;
	}

	public function log(console:Console, ?color:Null<Int>):Void {
		console.log('Speed: $speed', color);
		console.log('HitSpeedUp: $hitSpeedUp', color);
		console.log('StaringAcceleration: $startingAcceleration', color);
		console.log('MinY: $minY', color);
		console.log('MaxY: $maxY', color);
		console.log('MinX: $minX', color);
		console.log('MaxX: $maxX', color);
	}
}
