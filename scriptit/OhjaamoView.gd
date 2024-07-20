extends MeshInstance3D

@export var OhjaamoView : Node
var speed = 20.0

# Called when the node enters the scene tree for the first time.
func _ready():
<<<<<<< HEAD
    pass # Replace with function body.
=======
	self.visible = false
	pass # Replace with function body.
>>>>>>> b062db8 (shaderiä ja ohjaamoa sörkitty)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position.z += speed * delta
