class_name PuzzleEntity
extends Node3D


@export_group("Dependencies")
@export var model: MeshInstance3D

@export_group("Settings")
@export var color: Color = Color.WHITE


func _ready() -> void:
	assert(model)
