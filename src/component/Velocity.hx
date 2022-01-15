package component;

class Velocity implements IComponent {
	public static final type = "Velocity";

	public var dx:Float;
	public var dy:Float;

	public function new() {}

	public function getType():String {
		return type;
	}
}
