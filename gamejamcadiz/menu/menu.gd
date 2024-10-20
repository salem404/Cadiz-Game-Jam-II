extends Control

func _on_entrar_pressed() -> void:
	get_tree().change_scene_to_file("res://principal.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
