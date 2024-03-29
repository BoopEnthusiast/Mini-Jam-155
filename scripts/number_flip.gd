extends StaticBody3D
class_name NumberFlip

var number: int = 0

signal number_changed(number: int)

@onready var mesh = $Mesh


func interact():
	number += 1
	if number > 9:
		number = 0
	mesh.mesh.text = str(number)
	number_changed.emit(number)
