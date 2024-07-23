extends Sprite2D

var heilunta = 0.0
var kuopat
var kuoppa
var radiotimer
# Called when the node enters the scene tree for the first time.
func _ready():
	radiotimer = 0.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#hytin heilunta
	heilunta += delta 
	kuoppa = randf_range(0,1)
	if kuoppa <= 0.17:
		kuopat = randf_range(0,0.2)
		heilunta -= kuopat
	position.y = 300 + 5*sin(heilunta)
	if kuoppa <= 0.17:
		heilunta += kuopat
		
	#radio sammuu automaattisesti 30sec kuluttua
	if radiotimer < 0.0:
		AudioServer.set_bus_volume_db(3,-3.0)
		AudioServer.set_bus_volume_db(1,-5.0)
		AudioServer.set_bus_mute(2, true)
	if radiotimer > 0.0:
		radiotimer -= delta
	

################################################################################
############################# Radion toiminta ##################################
################################################################################
func _on_radio_pressed():
		if $RadioSoitin.is_playing() != true:
			AudioServer.set_bus_volume_db(1,-8.0)
			AudioServer.set_bus_volume_db(3,-8.0)
			AudioServer.set_bus_mute(2, false)
			radiotimer = 30.0
			#valittuKappale = Musiikki1
			#$RadioSoitin.stream = valittuKappale
			$RadioSoitin.play()
		
		elif $RadioSoitin.is_playing() == true:
			radiotimer = 0
			AudioServer.set_bus_mute(2, true)
			$RadioSoitin.stop()
			AudioServer.set_bus_volume_db(3,-3.0)
			AudioServer.set_bus_volume_db(1,-5.0)
################################################################################
