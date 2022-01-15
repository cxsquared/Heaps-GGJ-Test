package component;

class Transform implements IComponent {
	public static final type = "Transform";

	public var xx:Float;
	public var yy:Float;
	public var cx:Int;
	public var cy:Int;
	public var xr:Float;
	public var yr:Int;

	public function new(?x:Float, ?y:Float) {
		xx = x;
		yy = y;
	}

	public function getType():String {
		return type;
	}
}
