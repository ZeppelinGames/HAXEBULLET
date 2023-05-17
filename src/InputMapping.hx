import InputMap;

class InputMapping {
	public var mappingKey:String;
    public var mapping: Array<InputMap>;

    public function new(mapKey:String, map: Array<InputMap>) {
        this.mappingKey = mapKey;
        this.mapping = map;
    }
}
