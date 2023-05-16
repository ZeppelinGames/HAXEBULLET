import InputMap.InputMapType;
import InputSystem;

class CompositeInputMap extends InputMap {
	public var positiveInput:Int;
	public var negativeInput:Int;

	public function new(c:ControlScheme, pos:Int, neg:Int) {
		this.positiveInput = pos;
		this.negativeInput = neg;
		super(c, InputMapType.COMPOSITE, pos, neg);
	}

    public override function GetInput() {
        switch (this.scheme) {
            case ControlScheme.KBM:
                return hxd.Key.isDown(posInput) ? 1 : Key.isDown(negInput) ? -1 : 0;
            case ControlScheme.GAMEPAD:
                return posInput;
            case _:
                return 0;
        }
        return 0;
    }
}