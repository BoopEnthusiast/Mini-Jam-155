extends Control

var player_1_scene = preload("res://scenes/player_1_main.tscn")
var player_2_scene = preload("res://scenes/player_2_main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_packed()
	
