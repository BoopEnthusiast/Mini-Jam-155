extends Area3D

@export var wind_force: float = 20
var player_inside := false


func _on_body_entered(body):
	if body is Player:
		body.wind_force = Vector3.BACK * wind_force
		player_inside = true


func _on_body_exited(body):
	if body is Player:
		body.wind_force = Vector3.ZERO
		player_inside = false
