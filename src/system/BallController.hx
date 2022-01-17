package system;

import component.Collidable;
import hxd.Math;
import h2d.col.Point;
import component.Transform;
import component.Velocity;
import component.Ball;

class BallController implements IPerEntitySystem {
	public function new() {}

	public var forComponents:Array<String> = [Ball.type, Velocity.type, Transform.type, Collidable.type];

	public function update(entity:Entity, dt:Float) {
		var b:Ball = cast entity.get(Ball.type);
		var v:Velocity = cast entity.get(Velocity.type);
		var t:Transform = cast entity.get(Transform.type);
		var c:Collidable = cast entity.get(Collidable.type);

		// start moving
		if (v.dx == 0 && v.dy == 0) {
			var dir = Math.random() > 0.5 ? 1 : -1;
			var p = new Point(dir, Math.srand());
			p = p.normalized();
			p = p.multiply(b.speed);
			v.dx = p.x;
			v.dy = p.y;
		}

		// Hiting a paddle
		if (c.colliding) {
			var targetC:Collidable = cast c.event.target.get(Collidable.type);
			var targetBounds = targetC.bounds;

			if (t.y - c.circle.ray >= targetBounds.y && t.y + c.circle.ray <= targetBounds.y + targetBounds.height) {
				v.dx = -v.dx;
				var p = new Point(v.dx, v.dy);
				p = p.normalized();
				p = p.multiply(b.speed);
				v.dx = p.x;
				v.dy = p.y;
			}
		}

		// Hiting the top/bottom
		if (t.y < b.minY || t.y > b.maxY) {
			v.dy = -v.dy;
		}

		// Hiting the left/right resets
		if (t.x < b.minX || t.x > b.maxX) {
			b.speed = b.startingAcceleration;
			v.dx = 0;
			v.dy = 0;
			t.x = b.maxX / 2;
			t.y = b.maxY / 2;
		}

		t.x += v.dx * dt;
		t.y += v.dy * dt;
	}

	function isAbove(a:Transform, b:Transform) {
		return a.y - a.height < b.y;
	}

	function isBelow(a:Transform, b:Transform) {
		return a.y > b.y + b.height;
	}
}
