extends StaticBody2D

signal health_depleted

var health = 100.0
@onready var hurt: Area2D = $hurt
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.value = health

func make_damage(damage: float):
		health -= damage
		progress_bar.value = health 
		if health <= 0.0:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")

#TODO si el enemigo sigue chocando con el chiringuito siga haciendo daño cada X segundos
func _on_hurt_body_entered(body):
	if body.is_in_group("enemy"):
		make_damage(10)
		body.queue_free()
