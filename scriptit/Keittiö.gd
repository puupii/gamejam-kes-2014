extends Sprite2D

var p1
var p2
var kahvipannuFound = false


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if kahvipannuFound:
        p1 = $kahvipannu.position.lerp(Vector2(0,0),0.5)
        p2 = p1.lerp(Vector2(0,-700),1.5)
        $kahvipannu.position = $kahvipannu.position.lerp(p2,0.2*delta)


################################################################################
############################### ITEMS ##########################################
################################################################################


############################### PANNU ##########################################
func _on_kahvipannu_pressed():
    kahvipannuFound = true
    
func _on_kaapin_ovi_pressed():
    $kaapinOvi.hide()
    $kahvipannu.show()

################################################################################
