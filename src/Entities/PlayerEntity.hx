import h2d.Object;
import hxd.Key;
import h2d.Scene;
import hxd.Res;

class PlayerEntity extends Entity {
    private var playerSpeed = 50;

    public function new(scene:Scene, ?parent:Object) {
        var playerSprite = hxd.Res.PlayerSprite.toTile();

        this.sprite = new h2d.Anim([playerSprite], 1, scene);
        super(scene, "Player", parent);
    }

    override function update(dt:Float) {
        HandlePlayerMovement(dt);
    }

    function HandlePlayerMovement(dt:Float) {
        var dx : Float = InputSystem.instance.GetInput("MoveX");
        var dy : Float = InputSystem.instance.GetInput("MoveY");

        this.sprite.x += dx * playerSpeed * dt;
        this.sprite.y += -dy * playerSpeed * dt;
    }
}