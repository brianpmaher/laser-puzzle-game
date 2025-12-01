class_name Laser
extends Node3D


const LineRenderer3D = preload("res://addons/LineRenderer/line_renderer.gd")


@export_group("Dependencies")
@export var line_renderer: LineRenderer3D
@export var raycast: RayCast3D


var __collider: LaserCollider


func get_color() -> Color:
	var material: StandardMaterial3D = line_renderer.material_override
	return material.albedo_color


func set_color(color: Color) -> void:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	line_renderer.material_override = material


func _ready() -> void:
	assert(line_renderer)
	assert(raycast)


func _process(_delta: float) -> void:
	if __collider:
		__collider.reset()
	
	var points = line_renderer.points
	points.clear()
	points.append(Vector3(0, 0, 0))
	if raycast.is_colliding():
		var global_point := raycast.get_collision_point()
		var relative_point := global_point - line_renderer.global_position
		points.append(relative_point)
		var obj := raycast.get_collider()
		assert(obj is CollisionObject3D)
		var body := obj as CollisionObject3D
		for collider in body.get_children():
			if collider is LaserCollider:
				var laser_collider := collider as LaserCollider
				laser_collider.collide(self)
	if points.size() == 1:
		points.append(Vector3.FORWARD * raycast.target_position.length())
