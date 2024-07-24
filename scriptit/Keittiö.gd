extends Sprite2D

var kahvipannuFound = false


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


################################################################################
############################### ITEMS ##########################################
################################################################################


############################### PANNU ##########################################
func _on_kahvipannu_pressed():
    $kahvipannu.hide()
    kahvipannuFound = true
    
func _on_kaapin_ovi_pressed():
    $kaapinOvi.hide()
    $kahvipannu.show()

################################################################################
