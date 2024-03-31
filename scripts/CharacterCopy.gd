extends StaticBody3D
class_name CharacterCopy

const CHARACTER_MESH = preload("res://resources/character_mesh.tres")

var connected_character: Character

@onready var mesh = $Mesh


func _ready():
	get_tree().create_timer(1)
	mesh.mesh = CHARACTER_MESH.duplicate()
	mesh.mesh.text = connected_character.current_letter


func interact() -> void:
	connected_character.interact()
