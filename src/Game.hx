import h2d.Scene;
import h2d.Layers;

enum GameState {
	TITLE;
	OPTIONS;
	CHARACTER_SELECT;
	PLAYING;
}

class Game extends hxd.App {
	public final WINDOW_WIDTH = 960;
	public final WINDOW_HEIGHT = 540;

	public var entities = new Array<Entity>();

	private var gameState:GameState;

	override function init():Void {
		super.init();

		s2d.scaleMode = ScaleMode.LetterBox(WINDOW_WIDTH, WINDOW_HEIGHT);
		SetGameState(GameState.TITLE);
	}

	public function GetS2D():Scene {
		return s2d;
	}

	function SetGameState(newState:GameState) {
		gameState = newState;
		switch (gameState) {
			case GameState.TITLE:
				CreateEntity();
			case _:
		}
	}

	function CreateEntity(?name:String):Entity {
		return new Entity(s2d, name);
	}
}
