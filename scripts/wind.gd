extends Area3D

var wind_direction = Vector3(1, 0, 0) # wind direction
var wind_force = 50 # wind force

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("player"): # only affect player 
			var force = wind_force * wind_direction.normalized()
			body.apply_impulse(Vector3.ZERO, force)
		#elif body.is_in_group("block"): # only affect blocks
