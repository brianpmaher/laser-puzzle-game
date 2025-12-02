class_name GameCamera
extends Camera3D


const RAY_LENGTH := 64

var selected_emitter: LaserEmitter


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var space_state := get_world_3d().direct_space_state
			var from := project_ray_origin(event.position)
			var to := from + project_ray_normal(event.position) * RAY_LENGTH
			var query := PhysicsRayQueryParameters3D.create(from, to)
			var result := space_state.intersect_ray(query)
			if not result.is_empty():
				var obj: Object = result["collider"]
				if obj is LaserEmitterProvider:
					var provider := obj as LaserEmitterProvider
					var laser_emitter = provider.laser_emitter
					if selected_emitter != laser_emitter:
						if selected_emitter:
							selected_emitter.selected = false
						selected_emitter = laser_emitter
						selected_emitter.selected = true
					else:
						assert(selected_emitter.selected)
						selected_emitter.toggle()
			elif selected_emitter:
				selected_emitter.selected = false
				selected_emitter = null
