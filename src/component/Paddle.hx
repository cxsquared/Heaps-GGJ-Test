package component;

import h2d.Console;

class Paddle implements IComponent {
	public static final type = "Paddle";

	public var player(default, null):Int;
	public var speed = 200;
	public var accel = 25;
	public var friction = .95;
	public var minY:Int;
	public var maxY:Int;

	public function new(player:Int, minY:Int, maxY:Int) {
		this.player = player;
		this.minY = minY;
		this.maxY = maxY;
	}

	public function getType():String {
		return type;
	}

	public function log(console:Console, ?color:Null<Int>):Void {
		console.log('Player: $player', color);
		console.log('Speed: $speed', color);
	}
}
