extends StaticBody3D

signal interacted


func interact() -> void:
	interacted.emit()
