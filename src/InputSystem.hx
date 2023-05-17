import hxd.Pad;
import hxd.Key;

enum ControlScheme {
	KBM;
	GAMEPAD;
}

class InputSystem extends hxd.App {
	public static var instance(get, null):InputSystem;

	private static function get_instance() {
		if (instance == null) {
			instance = new InputSystem();
		}
		return instance;
	}

	private var controlScheme = ControlScheme.KBM;

	private var gamepad:hxd.Pad = null;

	private var inputMappings:Map<String, InputMapping> = [
		"MoveX" => new InputMapping("MoveX", [
			new CompositeInputMap(ControlScheme.KBM, Key.D, Key.A),
			new ButtonInputMap(ControlScheme.GAMEPAD, Pad.DEFAULT_CONFIG.analogX)
		]),
		"MoveY" => new InputMapping("MoveY", [
			new CompositeInputMap(ControlScheme.KBM, Key.W, Key.S),
			new ButtonInputMap(ControlScheme.GAMEPAD, Pad.DEFAULT_CONFIG.analogY)
		]),
	];

	override function init() {
		trace("Input system registered");
		hxd.Pad.wait(onPadConnect);
	}

	public function GetInput(key:String):Float {
		if (!inputMappings.exists(key)) {
			trace("Invalid input " + key);
			return 0;
		}

		for (input in inputMappings[key].mapping) {
			if (input.scheme == controlScheme) {
            	return input.GetInput(gamepad);
			}
		}

		return 0;
	}

	override function update(dt:Float) {
		if (gamepad != null) {
			gamepad.config;
		}
	}

	function onPadConnect(p:hxd.Pad) {
		trace("Gamepad connected");
		gamepad = p;
		controlScheme = ControlScheme.GAMEPAD;
		p.onDisconnect = onPadDisconnect;
	}

	function onPadDisconnect() {
		gamepad = null;
		controlScheme = ControlScheme.KBM;
		trace("Gamepad disconnected");
	}
}
