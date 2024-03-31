extends Node3D
class_name Lever

signal interacted_with(pushed: bool, which_lever: Lever)

var pushed := false

@onready var lever_animator = $LeverAnimator


func _on_lever_body_interacted():
	if not lever_animator.is_playing():
		if pushed:
			lever_animator.play("lever_pull")
		else:
			lever_animator.play("lever_push")
		pushed = !pushed
		interacted_with.emit(pushed, self)
