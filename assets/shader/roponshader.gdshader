shader_type canvas_item;

void vertex() {
	  VERTEX += UV.x*vec2(cos(TIME)*10.0, sin(TIME)*10.0);
	  VERTEX += UV.y*vec2(sin(TIME)*10.0, tan(TIME/10.0)/10.0);
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR.a=UV.x/UV.y*99.9*sin(TIME*UV.x*0.7)*sin(TIME*UV.y);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
