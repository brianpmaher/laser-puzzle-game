class_name GameCamera
extends Camera3D


@export_group("Dependencies")
@export var raycast: RayCast3D


func _ready() -> void:
	assert(raycast)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var length := raycast.target_position.length()
			var from := project_ray_origin(event.position)
			var to := from + project_ray_normal(event.position) * length
			raycast.position = from
			raycast.target_position = to
			if raycast.is_colliding():
				var obj := raycast.get_collider()
				if obj is LaserEmitterProvider:
					var provider := obj as LaserEmitterProvider
					var emitter := provider.laser_emitter
					emitter.selected = true
