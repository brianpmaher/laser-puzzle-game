class_name LaserReceiver
extends PuzzleEntity


@export_group("Dependencies")
@export var laser_collider: LaserCollider

var __connected: bool


func _ready() -> void:
	assert(laser_collider)
	
	var handle_reset := func() -> void:
		__connected = false
	laser_collider.on_reset.connect(handle_reset)
	
	var handle_collide := func(laser: Laser) -> void:
		if laser.get_color() == color:
			__connected = true
	laser_collider.on_collide.connect(handle_collide)
