extends CharacterBody2D

#TODO cambiar path cuando creemos el chiringuito
@onready var puerta: Marker2D = $"../Puerta"
@onready var mob: CharacterBody2D = $"."

var direction
var speed = 100.0
var health = 2

func _ready() -> void:
	direction = global_position.direction_to(puerta.global_position)

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		const MoneyScene = preload("res://scenes/money.tscn")
		var money_instance = MoneyScene.instantiate()
		money_instance.global_position = global_position
		get_parent().add_child(money_instance)
		queue_free()
