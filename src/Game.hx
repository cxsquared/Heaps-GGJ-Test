import hxd.Timer;
import hxd.Math;
import h2d.Text;
import system.Renderer;
import system.RandomMove;
import system.Collision;
import system.FlashCollision;
import component.*;

class Game extends hxd.App {
	var world:World;
	var tf:Text;

	public function new() {
		super();
	}

	override function init() {
		world = new World();
		world.addSystem(new Renderer());
		world.addSystem(new RandomMove());
		world.addSystem(new Collision());
		world.addSystem(new FlashCollision());

		for (i in 0...200) {
			var entity = world.newEntity()
				.add(new Transform(Math.random(s2d.width), Math.random(s2d.height)))
				.add(new Velocity())
				.add(new Renderable(h2d.Tile.fromColor(Math.round(0xFFFFFF * Math.random()), Math.floor(15 + Math.random(15)),
					Math.floor(15 + Math.random(15))), s2d));

			if (entity.id % 2 == 0)
				entity.add(new Collidable());
		}

		tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		tf.text = "Hello, World!";
	}

	override function update(dt:Float) {
		tf.text = "FPS: " + Timer.fps();

		world.update(dt);
	}
}
