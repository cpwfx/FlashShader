package gl3d.core {
	/**
	 * ...
	 * @author lizhi
	 */
	public class Light extends Node3D
	{
		public var color:Vector.<Number> = Vector.<Number>([1, 1, 1, 1]);
		public var shadowMapEnabled:Boolean = false;
		public function Light() 
		{
			super("def");
		}
		
	}

}