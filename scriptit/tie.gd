extends Node3D

# Path to the road block scene
@export var tie = PackedScene
# Length of a single road block
@export var road_block_length = 40.0
# Number of road blocks to maintain in front of and behind the car
@export  var num_blocks_in_front = 3
@export var num_blocks_behind = 2

# Reference to the car node
@onready var auto = $Ohjaamoview
var road_blocks = []

func _ready():
    # Initialize road blocks
    for i in range(num_blocks_in_front + num_blocks_behind + 1):
        var road_block = tie.instance()
        road_block.translation.z = i * road_block_length
        road_blocks.append(road_block)
        add_child(road_block)

func _process(delta):
    update_road_blocks()

func update_road_blocks():
    # Get the car's current position
    var auto_pos_z = auto.translation.z
    
    # Check if we need to despawn road blocks behind the car
    while road_blocks.size() > 0 and road_blocks[0].translation.z < auto_pos_z - road_block_length * num_blocks_behind:
        var old_block = road_blocks.pop_front()
        old_block.queue_free()
    
    # Check if we need to spawn new road blocks in front of the car
    while road_blocks.size() > 0 and road_blocks[road_blocks.size() - 1].translation.z < auto_pos_z + road_block_length * num_blocks_in_front:
        var new_block = tie.instance()
        var last_block = road_blocks[road_blocks.size() - 1]
        new_block.translation.z = last_block.translation.z + road_block_length
        road_blocks.append(new_block)
        add_child(new_block)
