package component;

class Collidable implements IComponent {
	public static final type = "Collidable";

	public function new() {}

	public var colliding = false;
	public var radius = 15;

	public function getType():String {
		return type;
	}
}
