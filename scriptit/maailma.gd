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

func vaihdaNakymaVasen():
    if nykyinenNakyma == "etu":
        nykyinenNakyma = "vasen"
        $Etunakyma.hide()
        $KuskinpuolenNakyma.show()
    
func vaihdaNakymaOikea():
    pass
