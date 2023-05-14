import h2d.Scene;
import h2d.RenderContext;
import h2d.Anim;
import h2d.Object;

class Entity extends Object {
	public function new(scene:Scene, ?name:String) {
        this.name = name != null ? name : "New Entity";

		trace('New entity created \'${name}\'');
		scene.addChild(this);
		super();
	}

	override function onAdd() {
		trace('Added entity ${name}');
		super.onAdd();
	}

	public function update(dt:Float) {}

	override function draw(ctx:RenderContext) {}
}
