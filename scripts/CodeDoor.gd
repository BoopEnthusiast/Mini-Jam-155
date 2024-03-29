extends StaticBody3D
class_name CodeDoor

var open: bool = false
var numbers: Array[int] = [0, 0, 0]
@export var unlock_code: Array[int] = [1, 9, 2]

# Get nodes
@onready var animation_player = $AnimationPlayer
@onready var number_1 = $Number1
@onready var number_2 = $Number2
@onready var number_3 = $Number3


func _on_number_1_number_changed(number):
	numbers[0] = number
	if not open and numbers == unlock_code:
		open = true
		animation_player.play("open_door")


func _on_number_2_number_changed(number):
	numbers[1] = number
	if not open and numbers == unlock_code:
		open = true
		animation_player.play("open_door")


func _on_number_3_number_changed(number):
	numbers[2] = number
	if not open and numbers == unlock_code:
		open = true
		animation_player.play("open_door")
