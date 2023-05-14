import h2d.Scene;

class Main extends hxd.App {
    public var game:Game;

    override function init() {
        game = new Game();
	}


	static function main() {
		new Main();
	}
}
