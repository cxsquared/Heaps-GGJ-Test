package component;

class Ball implements IComponent {
	public static final type = "Ball";

	public var startingAcceleration = 175;
	public var hitSpeedUp = 35;
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
}
