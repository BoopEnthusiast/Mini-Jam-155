@tool
extends Area3D

const WIND_NEW_PARTICLE_RESOURCE = preload("res://resources/wind_new_particle_resource.tres")

@export var wind_force: float = 6
@export var direction: Vector3
var player_inside := false

@onready var particles = $Particles


func _ready() -> void:
	particles.process_material = WIND_NEW_PARTICLE_RESOURCE.duplicate()
	particles.process_material.gravity = direction * 15


func _process(_delta) -> void:
	if Engine.is_editor_hint():
		particles.process_material.gravity = direction * 15


func _on_body_entered(body) -> void:
	if body is Player:
		body.wind_force = direction * wind_force
		player_inside = true


func _on_body_exited(body) -> void:
	if body is Player:
		body.wind_force = Vector3.ZERO
		player_inside = false
