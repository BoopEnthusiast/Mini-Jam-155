extends Node3D

var open = false

@onready var door_animator = $DoorAnimator


func _on_lever_open_door():
	if not open:
		open = true
		door_animator.play("open_doors")
