@tool
class_name PuzzleEntity
extends Node3D


@export_group("Dependencies")
@export var mesh_instance: MeshInstance3D:
	set(new_mesh_instance):
		mesh_instance = new_mesh_instance.duplicate()

@export_group("Settings")
@export var color := Color.WHITE:
	set(new_color):
		print("Setting color")
		color = new_color
		var material := mesh_instance.get_active_material(0).duplicate()
		assert(material is StandardMaterial3D)
		var standard_material := material as StandardMaterial3D
		standard_material.albedo_color = color
		mesh_instance.set_surface_override_material(0, standard_material)


func _ready() -> void:
	assert(mesh_instance)
