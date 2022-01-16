package component;

class Transform implements IComponent {
	public static final type = "Transform";

	public var x:Float;
	public var y:Float;
	public var width:Int;
	public var height:Int;

	public function new(?x:Float, ?y:Float, ?width:Int, ?height:Int) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	public function getType():String {
		return type;
	}
}
