import h2d.Tile;
import h2d.Graphics;

class MainGame extends GameScene {

    private var player : PlayerEntity;

    override function init() {
        super.init();

        player = new PlayerEntity(this);
    }

    override function update(dt: Float) {
        player.update(dt);
    }
}