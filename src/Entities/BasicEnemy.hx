import hxd.Math;
import h2d.Object;
import h2d.Scene;

class BasicEnemy extends Entity {
    public var moveSpeed = 40;

    private var player : PlayerEntity;

    public function new(scene:Scene, ?parent:Object) {
        var sprite = hxd.Res.PlayerSprite.toTile();

        player = MainGame.instance.get_player();

        this.sprite = new h2d.Anim([sprite], 1, scene);
        super(scene, "BasicEnemy", parent);
    }

    //override function update(dt:Float) {}
}