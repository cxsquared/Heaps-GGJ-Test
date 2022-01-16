package system;

import h2d.Object;
import system.IAllEntitySystem.IAllEntitySystems;
import component.Collidable;
import h2d.Graphics;

class CollisionDebug implements IAllEntitySystems {
	public var forComponents:Array<String> = [Collidable.type];

	var graphics = new Graphics();

	public function new(?parent:Object) {
		graphics = new Graphics(parent);
	}

	public function update(entity:Entity, dt:Float) {}

	public function updateAll(entities:Array<Entity>, dt:Float) {
		graphics.clear();
		graphics.beginFill(0xFF0000, .5);

		for (e in entities) {
			var collidable:Collidable = cast e.get(Collidable.type);
			if (collidable.debug) {
				var circle = collidable.collider;
				graphics.drawCircle(circle.x, circle.y, circle.ray);
			}
		}

		graphics.endFill();
	}
}
