package gl3d.shaders 
{
	import as3Shader.Var;
	import gl3d.core.Material;
	/**
	 * ...
	 * @author lizhi
	 */
	public class TerrainPhongFragmentShader extends PhongFragmentShader
	{
		public function TerrainPhongFragmentShader(material:Material,vs:PhongVertexShader) 
		{
			super(material,vs);
		}

		override public function getDiffColor():Var {
			var uv:Var = vs.uvVarying;
			//repeat,miplinear
			var flags:Array = material.terrainTextureSets[0].flags;
			var map:Var = tex(uv, FS(), null, flags);
			//mov(sub2([1,map.x,map.y,map.z]),map.w);
			var diffColor0:Var = tex(mul(uv,uniformTerrainScaleVar().x), samplerTerrains(0),null,flags);
			var diffColor1:Var = tex(mul(uv,uniformTerrainScaleVar().y), samplerTerrains(1),null,flags);
			var diffColor2:Var = tex(mul(uv,uniformTerrainScaleVar().z), samplerTerrains(2),null,flags);
			var diffColor3:Var = tex(mul(uv,uniformTerrainScaleVar().w), samplerTerrains(3),null,flags);
			var diffColor:Var=
						add2([
							mul(diffColor0,sub2([1,map.x,map.y,map.z])),
							mul(diffColor1,map.x),
							mul(diffColor2,map.y),
							mul(diffColor3,map.z)
						]);
			mov(1,diffColor.w);//diffColor.w = 1;
			return diffColor;
		}
	}

}