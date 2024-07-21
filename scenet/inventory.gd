extends Area2D


const slidespeed = 4.0
const position_in = Vector2(400,0) 
const position_out = Vector2(400,150) 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func slideout():
	self.position = position_in.lerp(position_out,0.5)
	

func slidein():
	self.position = position_out.lerp(position_in,0.5)
