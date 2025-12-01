class_name LaserEmitter
extends PuzzleEntity


@export_group("Dependencies")
@export var laser: Laser


func _ready() -> void:
	super._ready()
	
	assert(laser)
	
	laser.set_color(color)
	laser.set_process(false)
