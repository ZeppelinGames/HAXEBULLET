import h2d.Text;

enum GameState {
	TITLE;
	OPTIONS;
	CHARACTER_SELECT;
	PLAYING;
}

class Game extends hxd.App {
	public static var WINDOW_WIDTH = 320;
	public static var WINDOW_HEIGHT = 240;

	public static var instance(get, null):Game;

	private static function get_instance():Game {
		if (instance == null) {
			instance = new Game();
		}
		return instance;
	}

	private var inputSystem : InputSystem = InputSystem.instance;

	private var scenes = [
		Title.instance,
		MainGame.instance
	];
	private var currentScene:GameScene;

	var font:h2d.Font = hxd.res.DefaultFont.get();
	var noSceneText:Text;

	override function init():Void {
		super.init();
		hxd.Res.initLocal();

		s2d.scaleMode = ScaleMode.LetterBox(WINDOW_WIDTH, WINDOW_HEIGHT);

		var customGraphics = new h2d.Graphics(s2d);
		customGraphics.beginFill(0xEA8220);
		customGraphics.drawRect(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
		customGraphics.endFill();

		font.resizeTo(32);
		noSceneText = new Text(font);
		noSceneText.text = "No scene loaded.";
		noSceneText.textAlign = Align.Center;
		noSceneText.setPosition(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2);

		s2d.addChild(noSceneText);

		SetSceneByIndex(1);
	}

	override function update(dt:Float) {
		currentScene.update(dt);
	}

	public function SetSceneByIndex(index:Int):Bool {
		if (index < 0 || index >= scenes.length) {
			return false;
		}

		currentScene = scenes[index];
		trace("Loaded scene: " + currentScene);

		currentScene.init();
		setScene2D(currentScene);

		return true;
	}

	public function GetSceneIndex(scene:GameScene):Int {
		for (i in 0...scenes.length) {
			if (scenes[i] == scene) {
				return i;
			}
		}
		return -1;
	}
}
