package scenes;

import hxd.res.DefaultFont;
import h2d.Console;
import hxd.Key;
import h2d.Tile;
import component.Collidable.CollisionShape;
import h2d.Scene;
import hxd.Timer;
import h2d.Text;
import system.*;
import component.*;

class Pong extends GameScene {
	var world:World;
	var tf:Text;
	var score:Entity;
	var console:Console;

	public function new(scene:Scene) {
		super(scene);
	}

	public override function init() {
		var s2d = getScene();
		var paddleHeight = s2d.height / 5;
		var paddleWidth = s2d.width / 20;
		var ballRadius = 15;

		world = new World();

		world.newEntity()
			.add(new Transform(s2d.width / 2 - 2.5, 0, 5, s2d.height))
			.add(new Renderable(Tile.fromColor(0xFFFFFF, 5, s2d.height), this)); // Paddle Left

		world.newEntity()
			.add(new Paddle(1, 0, Std.int(s2d.height - paddleHeight)))
			.add(new Transform(15, s2d.height / 2 - paddleHeight / 2, paddleWidth, paddleHeight))
			.add(new Velocity())
			.add(new Collidable(CollisionShape.BOUNDS, 0, paddleWidth, paddleHeight))
			.add(new Renderable(Tile.fromColor(0xFFFFFF, Std.int(paddleWidth), Std.int(paddleHeight)), this));

		// Paddle Right
		world.newEntity()
			.add(new Paddle(2, 0, Std.int(s2d.height - paddleHeight)))
			.add(new Transform(s2d.width - 15 - paddleWidth, s2d.height / 2 - paddleHeight / 2, paddleWidth, paddleHeight))
			.add(new Velocity())
			.add(new Collidable(CollisionShape.BOUNDS, 0, paddleWidth, paddleHeight))
			.add(new Renderable(Tile.fromColor(0xFFFFFF, Std.int(paddleWidth), Std.int(paddleHeight)), this));

		// Paddle Ball
		var ball = world.newEntity()
			.add(new Ball(0, s2d.height - ballRadius * 2, -ballRadius, s2d.width - ballRadius))
			.add(new Transform(s2d.width / 2 - ballRadius, s2d.height / 2 - ballRadius, ballRadius * 2, ballRadius * 2))
			.add(new Velocity())
			.add(new Collidable(CollisionShape.CIRCLE, ballRadius))
			.add(new Renderable(Tile.fromColor(0xFFFFFF, ballRadius * 2, ballRadius * 2), this));

		score = world.newEntity().add(new Score());

		world.addSystem(new BallController(onScore, onBallBounce));
		world.addSystem(new PaddleController());
		world.addSystem(new Collision());
		world.addSystem(new ScoreDisplay(this));
		world.addSystem(new Renderer());
		#if debug
		world.addSystem(new CollisionDebug(this));
		#end

		tf = new h2d.Text(hxd.res.DefaultFont.get(), this);
		tf.text = "Hello, World!";

		console = new Console(DefaultFont.get(), this);
		console.addCommand("debug", "", [], function() {
			world.debugLog(console);
		});
	}

	function onBallBounce() {
		hxd.Res.text01.play();
	}

	function onScore(x:Float) {
		var score:Score = cast score.get(Score.type);

		if (x < this.getScene().width / 2) {
			score.player1++;
		} else {
			score.player2++;
		}
	}

	public override function update(dt:Float) {
		tf.text = "FPS: " + Timer.fps();

		world.update(dt);
	}
}
