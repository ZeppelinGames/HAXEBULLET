import hxd.Pad;
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

    public override function GetInput(?pad:Pad):Float {

        trace("Getting input with scheme " + scheme);

        switch scheme {
            case ControlScheme.KBM:
                return hxd.Key.isDown(posInput) ? 1 : hxd.Key.isDown(negInput) ? -1 : 0;
            case ControlScheme.GAMEPAD:
                return pad != null ? pad.values[posInput] : 0;
        }
        return 0;
    }

}