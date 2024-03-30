extends StaticBody3D

@export var min_time: int = 30
@export var max_time: int = 180

var open = false

@onready var timer = $Timer


func _ready():
	var time_length = randf_range(0, 30)
	timer.start(time_length)


func _on_timeout():
	visible = !visible
	if collision_layer == 0:
		collision_layer = 1
		collision_mask = 1
	else:
		collision_layer = 0
		collision_mask = 0
	var time_length = randf_range(min_time, max_time)
	timer.start(time_length)
