class_name PuzzleEntity
extends Node3D


@export_group("Dependencies")
@export var mesh_instance: MeshInstance3D

@export_group("Settings")
@export var color: Color = Color.WHITE


func _ready() -> void:
	assert(mesh_instance)
	__override_model_color()


func __override_model_color() -> void:
	var material: StandardMaterial3D = mesh_instance.get_active_material(0)
	material.albedo_color = color
	mesh_instance.set_surface_override_material(0, material)
