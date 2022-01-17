package scenes;

import h2d.Scene;
import hxd.Timer;
import hxd.Math;
import h2d.Text;
import system.*;
import component.*;

class CollisionTest extends GameScene {
	var world:World;
	var tf:Text;

	public function new(scene:Scene) {
		super(scene);
	}

	public override function init() {
		world = new World();

		for (i in 0...200) {
			var width = Math.floor(15 + Math.random(15));
			var height = Math.floor(15 + Math.random(15));
			var color = Math.round(0xFFFFFF * Math.random());

			var entity = world.newEntity()
				.add(new Transform(Math.random(getScene().width), Math.random(getScene().height), width, height))
				.add(new Velocity())
				.add(new Renderable(h2d.Tile.fromColor(color, width, height), this));

			if (i % 2 == 0)
				entity.add(new Collidable(15, Math.colorLerp(color, 0xFF0000, .5)));
		}

		world.addSystem(new RandomMove());
		world.addSystem(new Collision());
		world.addSystem(new FlashCollision());
		world.addSystem(new Renderer());
		#if debug
		world.addSystem(new CollisionDebug(this));
		#end

		tf = new h2d.Text(hxd.res.DefaultFont.get(), this);
		tf.text = "Hello, World!";
	}

	public override function update(dt:Float) {
		tf.text = "FPS: " + Timer.fps();

		world.update(dt);
	}
}
