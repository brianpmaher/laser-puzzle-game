class_name LaserEmitter
extends PuzzleEntity


@export_group("Dependencies")
@export var laser: Laser

var selected: bool


func _ready() -> void:
	super._ready()
	
	assert(laser)
	
	laser.set_color(color)
	laser.set_process(false)


func _process(_delta: float) -> void:
	if selected:
		DebugDraw3D.draw_box(position, quaternion, scale, Color.YELLOW)
