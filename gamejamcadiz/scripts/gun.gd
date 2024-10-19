extends Area2D
@onready var crosshair: Marker2D = $pivot/crosshair

func _process(delta: float) -> void:
	var enemys_in_range = get_overlapping_bodies()
	if enemys_in_range.size() > 0:
		var target_enemy = enemys_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const Bullet = preload("res://scenes/bullet.tscn")
	var new_bullet = Bullet.instantiate()
	new_bullet.global_position = crosshair.position
	new_bullet.global_rotation = crosshair.rotation
	crosshair.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
