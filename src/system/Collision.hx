package system;

import system.IAllEntitySystem.IAllEntitySystems;
import component.Collidable;
import component.Transform;

class Collision implements IAllEntitySystems {
	public var forComponents:Array<String> = [Collidable.type, Transform.type];

	public function new() {}

	public function updateAll(entities:Array<Entity>, dt:Float) {
		// Update all positions
		for (e in entities) {
			var ec:Collidable = cast e.get(Collidable.type);
			var et:Transform = cast e.get(Transform.type);
			ec.collider.x = et.xx;
			ec.collider.y = et.yy;
			ec.colliding = false;
		}

		// check for collisions
		for (a in entities) {
			var ac:Collidable = cast a.get(Collidable.type);

			for (b in entities) {
				if (a.id == b.id)
					continue;

				var bc:Collidable = cast b.get(Collidable.type);

				if (ac.collider.collideCircle(bc.collider)) {
					ac.colliding = true;
					break;
				}
			}
		}
	}
}
