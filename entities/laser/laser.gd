class_name Laser
extends Node3D


const LineRenderer3D = preload("res://addons/LineRenderer/line_renderer.gd")


@export_group("Dependencies")
@export var line_renderer: LineRenderer3D
@export var raycast: RayCast3D

var collider: LaserCollider


func get_color() -> Color:
	var material: StandardMaterial3D = line_renderer.material_override
	return material.albedo_color


func set_color(color: Color) -> void:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	line_renderer.material_override = material


func toggle(firing: bool) -> void:
	if is_processing() and not firing:
		line_renderer.points.clear()
		# Must append two points to trigger rerender of line mesh
		line_renderer.points.append(Vector3(0, 0, 0))
		line_renderer.points.append(Vector3(0, 0, 0))
	set_process(firing)


func _ready() -> void:
	assert(line_renderer)
	assert(raycast)


func _process(_delta: float) -> void:
	if collider:
		collider.reset()
	
	var points = line_renderer.points
	points.clear()
	points.append(Vector3(0, 0, 0))
	if raycast.is_colliding():
		var global_point := raycast.get_collision_point()
		var relative_point := global_point - line_renderer.global_position
		points.append(relative_point)
		var obj := raycast.get_collider()
		if obj is LaserColliderProvider:
			var provider := obj as LaserColliderProvider
			collider = provider.laser_collider
			collider.collide(self)
	if points.size() == 1:
		points.append(Vector3.FORWARD * raycast.target_position.length())
