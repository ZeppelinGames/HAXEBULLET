import hxd.Rand;

class MainGame extends GameScene {
	public static var instance(get, null):MainGame;

	public static function get_instance() {
		if (instance == null) {
			instance = new MainGame();
		}
		return instance;
	}

	public var player(get, null):PlayerEntity;

	public function get_player() {
		if (player == null) {
			player = new PlayerEntity(this);
		}
		return player;
	}

	private var enemies:Array<BasicEnemy> = new Array<BasicEnemy>();
	var r:Rand = Rand.create();

	override function init() {
		player.MoveTo(Game.WINDOW_WIDTH / 2, Game.WINDOW_HEIGHT / 2);


		for (i in 0...10) {
			var e = new BasicEnemy(this);
			e.MoveTo(r.rand() * Game.WINDOW_WIDTH, r.rand() * Game.WINDOW_HEIGHT);
			enemies.push(e);
		}

		super.init();
	}

	override function update(dt:Float) {
		player.update(dt);

		for (e in enemies) {
			var dX = (player.posx - e.posx);
			var dY = (player.posy - e.posy);

			for (e2 in enemies) {
				if(e2 != e) {
					var dist : Float = Helpers.Distance(e.posx, e.posy, e2.posx, e2.posy);
					if(dist < 10) {
						dX += (e.posx - e2.posx) * 2;
						dY += (e.posy - e2.posy) * 2;
					}
				}
			}
			var dist = Math.sqrt(Math.pow(dX, 2) + Math.pow(dY,2));

			e.Move((dX / dist) * e.moveSpeed * dt, (dY / dist) * e.moveSpeed * dt);
		}
	}
}
