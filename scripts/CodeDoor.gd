extends StaticBody3D
class_name CodeDoor

var open: bool = false
var numbers: Array[int] = [0, 0, 0]
var unlock_code: Array[int]

# Get nodes
@onready var animation_player = $"../AnimationPlayer"


func _ready():
	unlock_code = get_parent().unlock_code


func _on_number_1_number_changed(number: int) -> void:
		numbers[0] = number
		check_if_unlocked()


func _on_number_2_number_changed(number: int) -> void:
		numbers[1] = number
		check_if_unlocked()


func _on_number_3_number_changed(number: int) -> void:
		numbers[2] = number
		check_if_unlocked()

func is_open() -> bool:
	return open

func check_if_unlocked() -> void:
	if not open and numbers == unlock_code:
		open = true
		animation_player.play("open_door")
		
