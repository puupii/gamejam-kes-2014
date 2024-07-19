extends MeshInstance3D

# Rotation speed in degrees per second
var rotation_speed = -20.0

func _ready():
    # Initialization if needed
    pass

func _process(delta):
    # Rotate the cylinder around its Y axis
    rotate_x(deg_to_rad(rotation_speed * delta))
