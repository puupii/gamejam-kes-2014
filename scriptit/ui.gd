extends Node2D
var itemit = []
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_inventory_mouse_entered():
    position = position.lerp(Vector2(position.x,100),1)
    pass # Replace with function body.


func _on_inventory_mouse_exited():
    position = position.lerp(Vector2(position.x,0),1)
    pass # Replace with function body.

