extends Area3D

var wind_direction = Vector3(1, 0, 0) # wind direction
var wind_force = 10 # wind force

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		var force = wind_force * wind_direction.normalized()
		body.apply_impulse(Vector3.ZERO, force)
