extends Node2D

var nykyinenNakyma = "etu"
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.
    $Etunakyma.show()
    $LepotilaNakyma.hide()
    $ApukuskinpuolenNakyma.hide()
    $KuskinpuolenNakyma.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

################################################################################
#################### kameran kääntäminen scenejen välillä ######################
################################################################################

func _on_left_arrow_pressed():
    if nykyinenNakyma == "etu":
        nykyinenNakyma = "vasen"
        $Etunakyma.hide()
        $KuskinpuolenNakyma.show()
        
    elif nykyinenNakyma == "vasen":
        nykyinenNakyma = "taka"
        $KuskinpuolenNakyma.hide()
        $LepotilaNakyma.show()
        
    elif nykyinenNakyma == "taka":
        nykyinenNakyma = "oikea"
        $LepotilaNakyma.hide()
        $ApukuskinpuolenNakyma.show()
        
    else:
        nykyinenNakyma = "etu"
        $ApukuskinpuolenNakyma.hide()
        $Etunakyma.show()


func _on_right_arrow_pressed():
    if nykyinenNakyma == "etu":
        nykyinenNakyma = "oikea"
        $Etunakyma.hide()
        $ApukuskinpuolenNakyma.show()
        
    elif nykyinenNakyma == "oikea":
        nykyinenNakyma = "taka"
        $ApukuskinpuolenNakyma.hide()
        $LepotilaNakyma.show()
        
    elif nykyinenNakyma == "taka":
        nykyinenNakyma = "vasen"
        $LepotilaNakyma.hide()
        $KuskinpuolenNakyma.show()
        
    else:
        nykyinenNakyma = "etu"
        $KuskinpuolenNakyma.hide()
        $Etunakyma.show()
################################################################################

################################################################################
############################# Radion toiminta ##################################
################################################################################
func _on_radio_pressed():
        if $RadioSoitin.is_playing() != true:
            $rekanÄäni.set_volume_db(-15.0)
            #valittuKappale = Musiikki1
            #$RadioSoitin.stream = valittuKappale
            $RadioSoitin.play()
        
        elif $RadioSoitin.is_playing() == true:
            $RadioSoitin.stop()
            $rekanÄäni.set_volume_db(1.0)
################################################################################
