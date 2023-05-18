import hxd.Math;

class Helpers {

    public static function Distance(x:Float, y:Float, x2:Float, y2:Float):Float {
        return Math.sqrt(Math.pow(x2 - x, 2) + Math.pow(y2-y,2));
    }

}