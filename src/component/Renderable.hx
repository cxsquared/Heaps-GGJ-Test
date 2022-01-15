package component;

import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Renderable implements IComponent {
	public static final type = "Renderable";

	public var bitmap(default, null):Bitmap;

	public function new(tile:Tile, parent:Object) {
		bitmap = new Bitmap(tile, parent);
	}

	public function getType():String {
		return type;
	}
}
