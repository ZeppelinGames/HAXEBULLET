import hxd.Key;
import InputSystem;

enum InputMapType {
	BUTTON;
	COMPOSITE;
}

class InputMap {
	public var scheme:ControlScheme;
	public var type:InputMapType;

	private var posInput:Int;
	private var negInput:Int;

	public function new(s:ControlScheme, type:InputMapType, pos:Int, ?neg:Int) {
		this.scheme = s;
		this.type = type;

		this.posInput = pos;
		this.negInput = neg;
	}

    public function GetInput():Float {
        return 0;
    }
}
