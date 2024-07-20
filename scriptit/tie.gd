extends Node3D

# Path to the road block scene
@export var tie = PackedScene
@export var road_block_length = 40.0
@export var num_blocks_in_front = 3
@export var num_blocks_behind = 2

@onready var auto = $Ohjaamoview
var road_blocks = []

func _ready():
    # blokit tulkaa tänne
    for i in range(num_blocks_in_front + num_blocks_behind + 1):
        var road_block = tie.instance()
        road_block.translation.z = i * road_block_length
        road_blocks.append(road_block)
        add_child(road_block)

func _process(delta):
    update_road_blocks()

func update_road_blocks():
    # Auton nykyinen sijainti
    var auto_pos_z = auto.translation.z
    
    # Pitkääkö hävittää takaa blokkeja
    while road_blocks.size() > 0 and road_blocks[0].translation.z < auto_pos_z - road_block_length * num_blocks_behind:
        var old_block = road_blocks.pop_front()
        old_block.queue_free()
    
    # Pitääkö summonaa uusia eteen
    while road_blocks.size() > 0 and road_blocks[road_blocks.size() - 1].translation.z < auto_pos_z + road_block_length * num_blocks_in_front:
        var new_block = tie.instance()
        var last_block = road_blocks[road_blocks.size() - 1]
        new_block.translation.z = last_block.translation.z + road_block_length
        road_blocks.append(new_block)
        add_child(new_block)
