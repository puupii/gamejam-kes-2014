extends Sprite2D

var heilunta = 0.0
var kuopat
var kuoppa
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	heilunta += delta 
	kuoppa = randf_range(0,1)
	if kuoppa <= 0.17:
		kuopat = randf_range(0,0.2)
		heilunta -= kuopat
	position.y = 300 + 30*sin(heilunta)
	if kuoppa <= 0.17:
		heilunta += kuopat
	pass
