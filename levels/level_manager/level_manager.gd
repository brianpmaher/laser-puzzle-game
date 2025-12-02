class_name LevelManager
extends Node3D


@export_group("Dependencies")
@export var levels: Array[PackedScene]

var current_level_idx := 0
var current_level: Node


func load_next_level() -> void:
	if not current_level:
		current_level_idx += 1
		current_level_idx %= levels.size()
	else:
		remove_child(current_level)
	current_level = levels[current_level_idx].instantiate()
	print("Loading level: ", current_level.name)
	add_child(current_level)


func _ready() -> void:
	assert(levels.size())
	load_next_level()


func _process(_delta: float) -> void:
	var nodes := get_tree().get_nodes_in_group("laser_receivers")
	var all_connected := true
	for node in nodes:
		if node is LaserReceiver:
			var receiver: LaserReceiver = node
			if not receiver.connected:
				all_connected = false
				break
	if all_connected:
		print("All emitters are connected")
		load_next_level()
