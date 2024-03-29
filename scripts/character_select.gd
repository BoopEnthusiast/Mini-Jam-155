extends Control

var player_1_scene = preload("res://scenes/player_1_main.tscn")
var player_2_scene = preload("res://scenes/player_2_main.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_packed(player_1_scene)


func _on_button_2_pressed():
	get_tree().change_scene_to_packed(player_2_scene)
