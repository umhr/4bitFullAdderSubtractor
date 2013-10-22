package  
{
	/**
	 * ...
	 * @author umhr
	 */
	public class Adder 
	{
		
		public function Adder() { };
		
		static private function half(a:Boolean, b:Boolean):Object {
			var c:Boolean = a && b;
			return { "s":(a || b) && !c, "c":c };
		}
		
		static public function full(a:Boolean, b:Boolean, x:Boolean):Object {
			var half0:Object = half(a, b);
			var half1:Object = half(half0.s, x);
			return { "s":half1.s, "c":half0.c || half1.c };
		}
		
		
	}

}