extends StaticBody3D
class_name Character

const ALPHABET_LENGTH = 26
const CHARACTER_MESH = preload("res://resources/character_mesh.tres")

signal character_changed(character: String, which: Character)

var alphabet: Array[String] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
var current_letter: String

@onready var mesh = $Mesh


func _ready():
	mesh.mesh = CHARACTER_MESH.duplicate()
	current_letter = alphabet.pick_random()
	mesh.mesh.text = current_letter

func interact() -> void:
	if alphabet.find(current_letter) == ALPHABET_LENGTH - 1:
		current_letter = alphabet[0]
	else:
		current_letter = alphabet[alphabet.find(current_letter) + 1]
	mesh.mesh.text = current_letter
	character_changed.emit(current_letter, self)
