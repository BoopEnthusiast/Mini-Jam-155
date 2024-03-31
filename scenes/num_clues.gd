extends StaticBody3D

@export var number = 0

@onready var mesh = $Mesh

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh.mesh.text = str(number)
