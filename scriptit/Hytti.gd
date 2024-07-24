extends Sprite2D

var heilunta = 0.0
var kuopat
var kuoppa
var radiotimer
var akkufound = false
var p1
var p2
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
        
        #akku lentää inventoryyn
    if akkufound:
        p1 = $akku.position.lerp(Vector2(0,0),0.5)
        p2 = p1.lerp(Vector2(0,-700),1.5)
        $akku.position = $akku.position.lerp(p2,0.2*delta)
    
    if $akku.position.y < -400:
        if akkufound:
            print("akku inventoryssä")
        akkufound = false
    

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



################################################################################
############################### ITEMS ##########################################
################################################################################


############################### AKKU ###########################################

func _on_akku_pressed():
    $akku/Button.disabled = true
    akkufound = true
    pass # Replace with function body.


func _on_kassi_pressed():
    $kassi.hide()
###############################################################################
