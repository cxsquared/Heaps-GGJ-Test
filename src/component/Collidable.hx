package component;

import h2d.col.Circle;

class Collidable implements IComponent {
	public static final type = "Collidable";

	public function new(?radius:Int = 15, ?debugColor:Int = 0xFF0000) {
		this.radius = radius;
		this.debugColor = debugColor;
		collider = new Circle(0, 0, radius);
	}

	public var colliding = false;
	public var radius:Int;
	public var debug = false;
	public var debugColor:Int;

	public var collider:Circle;

	public function getType():String {
		return type;
	}
}
