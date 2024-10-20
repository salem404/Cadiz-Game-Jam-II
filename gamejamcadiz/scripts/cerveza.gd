extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		const bullet = preload("res://scenes/bullet.tscn")
		var new_bullet = bullet.instantiate()
		new_bullet.speed *= 1.1
		queue_free()
		
