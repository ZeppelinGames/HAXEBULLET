import InputMap.InputMapType;
import InputSystem;
import hxd.Pad;

class ButtonInputMap extends InputMap {
    public var positiveInput:Int;

	public function new(c:ControlScheme, pos:Int) {
		this.positiveInput = pos;
		super(c, InputMapType.BUTTON, pos);
	}

    public override function GetInput(?pad:Pad):Float {
        switch (this.scheme) {
            case ControlScheme.KBM:
                return hxd.Key.isDown(posInput) ? 1 : 0;
            case ControlScheme.GAMEPAD:
                return  pad != null ? pad.values[posInput] : 0;
        }
        return 0;
    }
}