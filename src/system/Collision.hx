package system;

import system.IAllEntitySystem.IAllEntitySystems;
import component.Collidable;
import component.Transform;

class Collision implements IAllEntitySystems {
	public var forComponents:Array<String> = [Collidable.type, Transform.type];

	public function new() {}

	public function updateAll(entities:Array<Entity>, dt:Float) {
		for (a in entities) {
			var ac:Collidable = cast a.get(Collidable.type);
			var at:Transform = cast a.get(Transform.type);
			ac.colliding = false;

			for (b in entities) {
				if (a.id == b.id)
					continue;

				var bt:Transform = cast b.get(Transform.type);
				var bc:Collidable = cast b.get(Collidable.type);

				if (overlaps(at, ac.radius, bt, bc.radius)) {
					ac.colliding = true;
					break;
				}
			}
		}
	}

	public inline function overlaps(at:Transform, aRadius:Float, bt:Transform, bRadius:Float):Bool {
		var maxDist = aRadius + bRadius;
		// classic distance formula
		var distSqr = (at.xx - bt.xx) * (at.xx - bt.xx) + (at.yy - bt.yy) * (at.yy - bt.yy);
		return distSqr <= maxDist * maxDist;
		// note: square root is not required this comparison.
	}
}
