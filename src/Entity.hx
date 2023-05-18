import h2d.Scene;
import h2d.RenderContext;
import h2d.Anim;
import h2d.Object;

class Entity extends Object {

	public var posx (get, null):Float;
	public function get_posx() {
		return sprite.x;
	}

	public var posy (get, null):Float;
	public function get_posy() {
		return sprite.y;
	}

	private var sprite:Anim;

	public function new(scene:Scene, ?name:String, ?parent:Object) {
		this.name = name != null ? name : "New Entity";

		trace('New entity created \'${name}\'');
		if (parent == null) {
			scene.addChild(this);
		} else {
			parent.addChild(this);
		}
		super();
	}

	override function onAdd() {
		trace('Added entity ${name}');
		super.onAdd();
	}

	public function update(dt:Float) {}

	public function Move(x:Float, y:Float) {
		this.sprite.x += x;
		this.sprite.y += y;
	}

	
	public function MoveTo(x:Float, y:Float) {
		this.sprite.x = x;
		this.sprite.y = y;
	}

	override function draw(ctx:RenderContext) {}
}
