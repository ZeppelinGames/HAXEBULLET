enum ControlScheme {
    KBM;
    GAMEPAD;
}

class InputSystem extends hxd.App {

    private var controlScheme = ControlScheme.KBM;

    private var inputMapping : InputMapping;
    private var gamepad : hxd.Pad;

    override function init() {
        hxd.Pad.wait(onPadConnect);
    }

    function onPadConnect(p: hxd.Pad) {
        trace("Gamepad connected");
        p.onDisconnect = onPadDisconnect;
    }

    function onPadDisconnect() {
        trace("Gamepad disconnected");
    }
}