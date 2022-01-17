package component;

class Score implements IComponent {
	public static final type = "Score";

	public var player1 = 0;
	public var player2 = 0;

	public function new() {}

	public function getType():String {
		return type;
	}
}
