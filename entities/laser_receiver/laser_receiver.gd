@tool
class_name LaserReceiver
extends PuzzleEntity


@export_group("Dependencies")
@export var laser_collider: LaserCollider

var connected: bool


func _ready() -> void:
	assert(laser_collider)

	if not Engine.is_editor_hint():
		var handle_reset := func() -> void:
			connected = false
		laser_collider.on_reset.connect(handle_reset)
		
		var handle_collide := func(laser: Laser) -> void:
			if laser.get_color() == color:
				connected = true
		laser_collider.on_collide.connect(handle_collide)
