extends Node

var score = 0
var max_score = 10000
var hud : HUD

func _ready() -> void:
	hud = get_tree().get_first_node_in_group("hud")
	hud.update_score(score, max_score)

func add_point():
	score += 500
	hud.update_score(score, max_score)
	if score > max_score:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
