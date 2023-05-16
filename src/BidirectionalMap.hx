@:generic
class BidirectionalMap<T,V> {
    
    private var map: Map<T,V>;
    private var revMap: Map<V,T>;

    public function new(m:Map<T,V>) {
        map = new Map<T,V>();
        revMap = new Map<V,T>();

        for(key in m.keys()) {
            map[key] = m[key];
            revMap[m[key]] = key;
        }
    }
}