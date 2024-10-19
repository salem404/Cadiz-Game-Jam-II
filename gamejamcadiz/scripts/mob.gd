extends CharacterBody2D

@onready var puerta: Marker2D = $"../Puerta"
var direction
var speed = 100.0
var health = 2

func _ready() -> void:
	print(puerta)
	direction = global_position.direction_to(puerta.global_position)

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
