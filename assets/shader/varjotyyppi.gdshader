shader_type canvas_item;

void vertex() {
	VERTEX += UV.y*vec2(sin(-TIME*2.58)*3.4, tan(TIME/6.0)/1.8);
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR.a=COLOR.a*0.1*sin(TIME/600.7)*(COLOR.r+COLOR.g+COLOR.b)*sin(TIME/18.9);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
