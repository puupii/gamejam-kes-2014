shader_type canvas_item;

uniform sampler2D noise;
uniform float offset;
uniform vec2 tiling = vec2(1.0,1.0);

void vertex() {
	  VERTEX += UV.y*vec2(sin(TIME*1.88)*9.4, tan(TIME/10.0)/1.8);
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	vec2 baseuv = UV;
	baseuv -=0.5;
	baseuv *= 2.0;
	float angle = atan(baseuv.y,baseuv.x);
	float dist = length(vec2(baseuv.x,baseuv.y));
	vec2 polaruv = vec2(angle,dist);
	polaruv *= polaruv*tiling+offset;
	vec2 noise_uv = polaruv;
	float noisee = texture(noise,noise_uv).a*tan(TIME*polaruv.x*polaruv.y);
	
	COLOR.a=COLOR.a*sin(baseuv.x*6.7*polaruv.y)/sin(TIME*COLOR.a)*noisee;
	COLOR.rgb = COLOR.rgb*texture(noise,noise_uv).rgb+min(vec3(0.1,0.0,0.1)*sin(TIME),vec3(0.12,0.0,0.13)/tan(TIME));
	
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
