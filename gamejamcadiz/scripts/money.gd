extends Area2D

var game_manager

func _ready() -> void:
	var managers = get_tree().get_nodes_in_group("game_manager")
	if managers.size() > 0:
		game_manager = managers[0]
	else:
		print("Game Manager no encontrado!")

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	queue_free()
