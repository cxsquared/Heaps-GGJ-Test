package component;

import h2d.Console;

class Score implements IComponent {
	public static final type = "Score";

	public var player1 = 0;
	public var player2 = 0;

	public function new() {}

	public function getType():String {
		return type;
	}

	public function log(console:Console, ?color:Null<Int>):Void {
		console.log('player 1: $player1', color);
		console.log('player 2: $player2', color);
	}
}
