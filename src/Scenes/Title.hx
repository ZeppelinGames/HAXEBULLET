import hxd.Key;
import h2d.Graphics;

class Title extends GameScene {
	public static var instance (get, null) : Title;
    public static function get_instance() {
        if(instance == null) {
            instance = new Title();
        }
        return instance;
    }

	private var customGraphics:Graphics;

	override function init() {
		super.init();
		customGraphics = new h2d.Graphics(this);
	}

	override function update(dt:Float) {
		customGraphics.beginFill(Key.isDown(Key.A) ? 0x40417c : 0x23411a);
		customGraphics.drawRect(0, 0, Game.WINDOW_WIDTH, Game.WINDOW_HEIGHT);
		customGraphics.endFill();
	}
}
