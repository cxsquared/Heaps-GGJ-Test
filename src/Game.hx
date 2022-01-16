import hxd.Timer;
import hxd.Math;
import h2d.Text;
import system.*;
import component.*;

class Game extends hxd.App {
	var world:World;
	var tf:Text;

	public function new() {
		super();
	}

	override function init() {
		world = new World();

		for (i in 0...200) {
			var width = Math.floor(15 + Math.random(15));
			var height = Math.floor(15 + Math.random(15));
			var color = Math.round(0xFFFFFF * Math.random());

			var entity = world.newEntity()
				.add(new Transform(Math.random(s2d.width), Math.random(s2d.height), width, height))
				.add(new Velocity())
				.add(new Renderable(h2d.Tile.fromColor(color, width, height), s2d));

			if (i % 2 == 0)
				entity.add(new Collidable(15, Math.colorLerp(color, 0xFF0000, .5)));
		}

		world.addSystem(new RandomMove());
		world.addSystem(new Collision());
		world.addSystem(new FlashCollision());
		world.addSystem(new Renderer());
		#if debug
		world.addSystem(new CollisionDebug(s2d));
		#end

		tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		tf.text = "Hello, World!";
	}

	override function update(dt:Float) {
		tf.text = "FPS: " + Timer.fps();

		world.update(dt);
	}
}
