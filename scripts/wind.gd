extends Area3D

var wind_direction = Vector3(1, 0, 0) # wind direction
var wind_force = 20 # wind force


# Stop applying force when body exits area3D
func _on_Area3D_body_entered(body):
	if body.is_in_group("player"):
		body.apply_wind_force(wind_direction, wind_force)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Area3D_body_exited(body):
	if body.is_in_group("player"):
		body.remove_wind_force()
