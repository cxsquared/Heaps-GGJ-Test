package component;

import h2d.col.Bounds;
import h2d.col.Circle;

class Collidable implements IComponent {
	public static final type = "Collidable";

	public var colliding = false;
	public var event:CollisionEvent;
	public var debug = false;
	public var debugColor:Int;

	public var circle:Circle;
	public var bounds:Bounds;
	public var shape:CollisionShape;

	public function new(?shape:CollisionShape = CIRCLE, ?radius:Int = 15, ?width:Float, ?height:Float, ?debugColor:Int = 0xFF0000) {
		this.shape = shape;
		switch (shape) {
			case CIRCLE:
				this.circle = new Circle(0, 0, radius);
			case BOUNDS:
				this.bounds = new Bounds();
				this.bounds.set(0, 0, width, height);
		}
		this.debugColor = debugColor;
	}

	public function getType():String {
		return type;
	}
}

enum CollisionShape {
	CIRCLE;
	BOUNDS;
}
