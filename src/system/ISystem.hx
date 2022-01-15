package system;

interface ISystem {
	var forComponents:Array<String>;
	function update(entity:Entity, dt:Float):Void;
}
