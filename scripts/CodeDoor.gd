extends StaticBody3D
class_name CodeDoor

var open: bool = false
var numbers: Array[int] = [0, 0, 0]
@export var unlock_code: Array[int] = [1, 9, 2]

# Get nodes
@onready var animation_player = $"../AnimationPlayer"


func _on_number_1_number_changed(number: int) -> void:
	numbers[0] = number
	check_if_unlocked()


func _on_number_2_number_changed(number: int) -> void:
	numbers[1] = number
	check_if_unlocked()


func _on_number_3_number_changed(number: int) -> void:
	numbers[2] = number
	check_if_unlocked()


func check_if_unlocked() -> void:
	if not open and numbers == unlock_code:
		open = true
		animation_player.play("open_door")
