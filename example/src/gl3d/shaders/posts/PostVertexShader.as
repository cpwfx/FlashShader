package gl3d.shaders.posts 
{
	import as3Shader.AS3Shader;
	import gl3d.core.shaders.GLAS3Shader;
	/**
	 * ...
	 * @author lizhi
	 */
	public class PostVertexShader extends GLAS3Shader
	{
		
		public function PostVertexShader() 
		{
			m44(buffPos(),matrix(), op);
			mov(buffUV(), V());
		}
		
	}

}