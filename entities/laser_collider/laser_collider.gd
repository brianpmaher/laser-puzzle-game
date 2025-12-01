class_name LaserCollider
extends CollisionShape3D


signal on_reset()
signal on_collide(laser: Laser)


func reset() -> void:
	on_reset.emit()


func collide(laser: Laser) -> void:
	on_collide.emit(laser)
