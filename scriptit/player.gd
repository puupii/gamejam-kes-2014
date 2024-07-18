extends Sprite2D

const max_steer = 0.1
const acceleration = 1
const max_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(turn_left):
		rotation = rotation-max_steer
	if Input.turn_right():
		rotation = rotation+max_steer
	pass
