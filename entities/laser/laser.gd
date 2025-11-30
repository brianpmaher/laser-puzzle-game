class_name Laser
extends Node3D


const LineRenderer3D = preload("res://addons/LineRenderer/line_renderer.gd")


const MAX_DIST = 64


@export_group("Dependencies")
@export var line_renderer: LineRenderer3D
@export var raycast: RayCast3D


func _ready() -> void:
	assert(line_renderer)
	assert(raycast)
	raycast.target_position = raycast.target_position.normalized() * MAX_DIST


func _process(_delta: float) -> void:
	var points = line_renderer.points
	points.clear()
	points.append(Vector3(0, 0, 0))
	if raycast.is_colliding():
		var global_point = raycast.get_collision_point()
		var relative_point = global_point - line_renderer.global_position
		points.append(relative_point)
	if points.size() == 1:
		points.append(Vector3.FORWARD * MAX_DIST)
