extends StaticBody3D
class_name NumberFlip

var number: int = 0

signal number_changed(number: int)

@onready var mesh = $Mesh

@onready var door_node = get_parent().get_parent()


func interact():
	print("interacting with ",self)
	if !door_node.is_open():
		number += 1
		if number > 9:
			number = 0
		mesh.mesh.text = str(number)
		number_changed.emit(number)
