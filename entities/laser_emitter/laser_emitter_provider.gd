class_name LaserEmitterProvider
extends StaticBody3D


@export_group("Dependencies")
@export var laser_emitter: LaserEmitter


func _ready() -> void:
	assert(laser_emitter)
