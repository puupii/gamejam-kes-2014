extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 250:
		position = Vector2(-5,-340)
		scale = Vector2(0.5,0.2)
	scale = scale.lerp(Vector2(1,1),8.5*delta)
	position = position.lerp(Vector2(-80,300),0.8*delta)
	pass
