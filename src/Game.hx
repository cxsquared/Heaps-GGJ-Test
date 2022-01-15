import hxd.Rand;
import hxd.fmt.grd.Data.Color;
import hxd.Timer;
import hxd.Math;
import h2d.Text;
import system.Renderer;
import system.RandomMove;
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
		for (i in 0...1000) {
			world.newEntity()
				.add(new Transform(Math.random(s2d.width), Math.random(s2d.height)))
				.add(new Velocity())
				.add(new Renderable(h2d.Tile.fromColor(Math.round(0xFFFFFF * Math.random()), Math.floor(15 + Math.random(15)),
					Math.floor(15 + Math.random(15))), s2d));
		}

		tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		tf.text = "Hello, World!";
	}

	override function update(dt:Float) {
		tf.text = "FPS: " + Timer.fps();

		world.update(dt);
	}
}
