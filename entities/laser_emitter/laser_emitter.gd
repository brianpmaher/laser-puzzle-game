@tool
class_name LaserEmitter
extends PuzzleEntity


@export_group("Dependencies")
@export var laser: Laser

var selected: bool
var firing: bool


func toggle() -> void:
	firing = not firing
	laser.toggle(firing)


func _ready() -> void:
	super._ready()
	
	assert(laser)
	
	if not Engine.is_editor_hint():
		laser.set_color(color)
		laser.toggle(firing)


func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		if selected:
			var box_pos := global_position - Vector3(.5, 0, .5)
			DebugDraw3D.draw_box(box_pos, quaternion, scale, Color.YELLOW)
