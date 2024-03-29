extends StaticBody3D
class_name CodeDoor

var open: bool = false
@onready var animation_player = $AnimationPlayer


func interact():
	if not open:
		open = true
		animation_player.play("open_door")
