class_name LaserColliderProvider
extends StaticBody3D


@export_group("Dependencies")
@export var laser_collider: LaserCollider


func _ready() -> void:
	assert(laser_collider)
