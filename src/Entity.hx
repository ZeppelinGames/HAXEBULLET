import h2d.Scene;
import h2d.RenderContext;
import h2d.Anim;
import h2d.Object;

class Entity extends Object {
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

	override function draw(ctx:RenderContext) {}
}
