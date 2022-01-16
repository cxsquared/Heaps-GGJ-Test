package component;

import h2d.col.Circle;

class Collidable implements IComponent {
	public static final type = "Collidable";

	public function new(?radius:Int = 15) {
		this.radius = radius;
		collider = new Circle(0, 0, radius);
	}

	public var colliding = false;
	public var radius = 15;
	public var debug = true;

	public var collider:Circle;

	public function getType():String {
		return type;
	}
}
