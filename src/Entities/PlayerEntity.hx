import h2d.Object;
import hxd.Key;
import h2d.Scene;
import hxd.Res;

class PlayerEntity extends Entity {
    private var playerSpeed = 5;

    public function new(scene:Scene, ?parent:Object) {
        var playerSprite = hxd.Res.PlayerSprite.toTile();

        this.sprite = new h2d.Anim([playerSprite], scene);
        super(scene, "Player", parent);
    }

    override function update(dt:Float) {
        HandlePlayerMovement(dt);

    }

    function HandlePlayerMovement(dt:Float) {
        var dx = 0;
        var dy = 0;

        if(Key.isDown(Key.W)) {
            dy += 1;
        }
        if(Key.isDown(Key.S)) {
            dy -= 1;
        }
        if(Key.isDown(Key.A)) {
            dx -= 1;
        }
        if(Key.isDown(Key.D)) {
            dx += 1;
        }

        this.move(dx * dt * playerSpeed, dy * dt * playerSpeed);
    }
}